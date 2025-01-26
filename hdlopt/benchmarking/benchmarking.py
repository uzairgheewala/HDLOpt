import os, json, jinja2, itertools, re, statistics, random, inspect
import numpy as np

class Rule:
    def __init__(self, input_vars, output_vars, name, pattern, bit_width=8):
        self.input_vars = input_vars
        self.output_vars = output_vars
        self.name = name
        self.pattern = pattern
        self.bit_width = bit_width

    def set_bit_width(self, bit_width):
        self.bit_width = bit_width

    def generate_expected(self, test_case):
        raise NotImplementedError("This method should be implemented by subclasses")

    def matches(self, filename):
        return self.pattern.matches(filename)

    def __str__(self):
        generate_expected_code = inspect.getsource(self.generate_expected)
        return generate_expected_code
        #return f"Rule Name: {self.name}\nInput Variables: {self.input_vars}\nOutput Variables: {self.output_vars}\nBit Width: {self.bit_width}\nPattern: \n{self.pattern}\n\nGenerate Expected Function:\n{generate_expected_code}"

class AdderRule(Rule):
    def __init__(self, bit_width=8):
        super().__init__(input_vars=["a", "b", "cin"], output_vars=["sum", "cout"],
                         name="AdderRule", pattern=SubstringPattern("adder"), bit_width=bit_width)

    def generate_expected(self, test_case):
        max_val = (1 << self.bit_width) - 1
        if "cin" in test_case:
            sum_val = test_case["a"] + test_case["b"] + test_case["cin"]
            outs = {
                "sum": sum_val & max_val,
                "cout": sum_val >> self.bit_width
            }
        else:
            sum_val = test_case["a"] + test_case["b"]
            outs = {
                "sum": sum_val & max_val,
                "cout": sum_val >> self.bit_width
            }
        return outs
    
class SquareRule(Rule):
    def __init__(self, bit_width=4):
        super().__init__(input_vars=["Ai", "Bi"], output_vars=["G", "P"],
                         name="SquareRule", pattern=StringMatchPattern("square"), bit_width=bit_width)

    def generate_expected(self, test_case):
        a_bits = [(test_case["Ai"] >> i) & 1 for i in range(self.bit_width)]
        b_bits = [(test_case["Bi"] >> i) & 1 for i in range(self.bit_width)]

        G = [a_bits[i] & b_bits[i] for i in range(self.bit_width)]
        P = [a_bits[i] ^ b_bits[i] for i in range(self.bit_width)]

        G_int = sum(G[i] << i for i in range(self.bit_width))
        P_int = sum(P[i] << i for i in range(self.bit_width))

        return {
            "G": G_int,
            "P": P_int
        }
    
class TriangleRule(Rule):
    def __init__(self, bit_width=4):
        super().__init__(input_vars=["Pi", "CiPrev"], output_vars=["Si"],
                         name="TriangleRule", pattern=StringMatchPattern("triangle"), bit_width=bit_width)

    def generate_expected(self, test_case):
        P_bits = [(test_case["Pi"] >> i) & 1 for i in range(self.bit_width)]
        CiPrev_bits = [(test_case["CiPrev"] >> i) & 1 for i in range(self.bit_width)]

        S = [P_bits[i] ^ CiPrev_bits[i] for i in range(self.bit_width)]

        S_int = sum(S[i] << i for i in range(self.bit_width))

        return {
            "Si": S_int
        }
    
class BigCircleRule(Rule):
    def __init__(self, bit_width=4):
        super().__init__(input_vars=["Gi", "Pi", "GiPrev", "PiPrev"], output_vars=["G", "P"],
                         name="BigCircleRule", pattern=StringMatchPattern("big_circle"), bit_width=bit_width)

    def generate_expected(self, test_case):
        width = self.bit_width
        G = [0] * width
        P = [0] * width

        for i in range(width):
            e = (test_case["Pi"] >> i) & 1 & (test_case["GiPrev"] >> i) & 1
            G[i] = e | (test_case["Gi"] >> i) & 1
            P[i] = (test_case["Pi"] >> i) & 1 & (test_case["PiPrev"] >> i) & 1

        G_int = sum(G[i] << i for i in range(width))
        P_int = sum(P[i] << i for i in range(width))

        return {
            "G": G_int,
            "P": P_int
        }
    
class SmallCircleRule(Rule):
    def __init__(self, bit_width=4):
        super().__init__(input_vars=["Gi"], output_vars=["Ci"],
                         name="SmallCircleRule", pattern=StringMatchPattern("small_circle"), bit_width=bit_width)

    def generate_expected(self, test_case):
        width = self.bit_width
        Ci = [(test_case["Gi"] >> i) & 1 for i in range(width)]

        Ci_int = sum(Ci[i] << i for i in range(width))

        return {
            "Ci": Ci_int
        }

def determine_input_ranges(bit_width, sign_type):
    if bit_width is None or bit_width == '1':
        width = 1

    if ':' in bit_width:
        high, low = map(int, bit_width.split(':'))
        width = high - low + 1
    else:
        width = int(bit_width)

    if sign_type == 'signed':
        return range(-(2**(width-1)), 2**(width-1))
    else:
        if width > 16:
            width = 16
        return range(0, 2**width)

testbench_template = """
`timescale 1ns / 1ps

module tb_{{ param_component_name }};

    // Parameters
    {% for param_name, param_value in param_comb %}
    parameter {{param_name}} = {{param_value}};
    {% endfor %}
     
    // Inputs
    {% for signal_type, data_type, sign_type, bit_width, signal_name in inputs %}
    reg {{ 'signed' if sign_type == 'signed' }} {% if bit_width != '1' %}[{{ bit_width }}]{% endif %} {{ signal_name }};
    {% endfor %}
    
    // Outputs
    {% for signal_type, data_type, sign_type, bit_width, signal_name in outputs %}
    {{ data_type }} {{ 'signed' if sign_type == 'signed' }} {% if bit_width != '1' %}[{{ bit_width }}]{% endif %} {{ signal_name }};
    {% endfor %}
    
    // Instantiate the Unit Under Test (UUT)
    {{ component_name }} {% if param_comb|length > 0 %} #( {% for param_name, _ in param_comb %}{{ param_name }}{% if not loop.last %},{% endif %}{% endfor %} ){% endif %} uut (
        {% for signal_type, data_type, sign_type, bit_width, signal_name in inputs %}
        .{{ signal_name }}({{ signal_name }}),
        {% endfor %}
        {% for signal_type, data_type, sign_type, bit_width, signal_name in outputs %}
        .{{ signal_name }}({{ signal_name }}){% if not loop.last %},{% endif %}
        {% endfor %}
    );
    
    initial begin
        // Initialize Inputs
        {% for signal_type, data_type, sign_type, bit_width, signal_name in inputs %}
        {{ signal_name }} = 0;
        {% endfor %}
    
        // Wait for global reset
        #100;
    
        // Stimuli
        {% for i in range(stimuli|length) %}
        {{ stimuli[i] }} // Expected: {{ expected[i] }}
        #10;
        $display("Test %0d: Inputs: {{ stimuli[i] }} | Outputs: {% for signal_type, data_type, sign_type, bit_width, signal_name in outputs %}{{ signal_name }}=%b{% if not loop.last %}, {% endif %}{% endfor %} | Expected: {% for signal_name in expected[i].keys() %}{{ signal_name }}=%d{% if not loop.last %}, {% endif %}{% endfor %}",
                 {{ i }},
                 {% for signal_name in outputs %}
                 {{ signal_name[4] }}{% if not loop.last %}, {% endif %}
                 {% endfor %}, 
                 {% for signal_name in expected[i].keys() %}
                 {{ expected[i][signal_name] }}{% if not loop.last %}, {% endif %}
                 {% endfor %}
        );
        $timeformat(-9, 1, " ns", 6);
        $display("Simulation time: %t", $time);
        {% endfor %}
        $finish;
    end
  
endmodule
"""

class Pattern:
    def __init__(self, pattern):
        self.pattern = pattern

    def matches(self, filename):
        raise NotImplementedError("This method should be implemented by subclasses")

    def __str__(self):
        #print(inspect.getsourcelines(self.matches))
        return ''.join(inspect.getsourcelines(self.matches)[0])

class SubstringPattern(Pattern):
    def matches(self, filename):
        return self.pattern in filename

    def exact_match(self, filename):
        return self.pattern == filename

class StringMatchPattern(Pattern):
    def matches(self, filename):
        #print(self.pattern, filename)
        return self.pattern == filename

def parse_binary_string(bin_str):
    match = re.match(r"(\d+)'b([01]+)", bin_str)
    if match:
        return int(match.group(2), 2)
    return int(bin_str, 2)

def assign_rules_to_tests(rules, test_cases, component_details):
    expected_values = []
    rules_used = []
    for test_case in test_cases:
        if type(list(test_case.values())[0]) == str:
            cleaned_test_case = {k: int(v[3:], 2) for k, v in test_case.items()}
        else:
            cleaned_test_case = test_case

        #print(test_case, cleaned_test_case)
        
        filename = component_details['component_name']  # Assuming component_name is the filename here
        for rule in rules:
            if isinstance(rule.pattern, SubstringPattern):
                if rule.pattern.exact_match(filename) or any(isinstance(other_rule.pattern, StringMatchPattern) and other_rule.pattern.matches(filename) for other_rule in rules):
                    continue

            #print(rule, rule.name, filename, rule.matches(filename), rule.name == filename)
            if rule.matches(filename):
                #print(f"{rule.name} being used on {filename}")
                #print(test_case)
                expected_value = rule.generate_expected(cleaned_test_case)
                #print(expected_value)
                expected_values.append(expected_value)
                rules_used.append(rule.name)
                break

    rules_used = list(set(rules_used))
    print("Rules used:", rules_used)

    component_details['rules'] = rules_used
    return expected_values

def predict_execution_time(function_name, num_tests):
    with open(f"{function_name}_timing_logs.json", "r") as log_file:
        logs = [json.loads(line) for line in log_file]

    if not logs:
        return None

    times = [log["elapsed_time"] for log in logs]
    avg_time = statistics.mean(times)
    std_dev = statistics.stdev(times) if len(times) > 1 else 0

    predicted_time = avg_time * num_tests
    return predicted_time, avg_time, std_dev

def recommend_test_depth(time_limit, avg_time, num_possible_tests):
    max_tests = time_limit / avg_time
    test_depth = max_tests / num_possible_tests
    
    return np.clip([test_depth], a_min=0.0, a_max=1.0)[0], np.clip([int(max_tests)], a_min=1, a_max=num_possible_tests)[0]

def to_binary_string(value, bit_width, sign):
    """
    Convert a value to its binary string representation, considering signed or unsigned format.
    
    Args:
    value (int): The value to convert.
    bit_width (int): The bit width for the binary representation.
    sign (str): The sign type, either "signed" or "unsigned".
    
    Returns:
    str: The binary string representation of the value.
    """
    if sign == "signed":
        # Handle signed conversion
        if value < 0:
            value = (1 << bit_width) + value  # Two's complement for negative numbers
        binary_str = f"{value:0{bit_width}b}"
        msb = binary_str[0]
        padding_char = msb
    else:
        # Handle unsigned conversion
        binary_str = f"{value:0{bit_width}b}"
        padding_char = '0'
    
    # Ensure the string is always of length bit_width
    if len(binary_str) < bit_width:
        binary_str = padding_char * (bit_width - len(binary_str)) + binary_str

    return binary_str

def kogge_stone_constraint(N):
    #return (N > 0) and (N & (N - 1)) == 0
    p = [8, 16, 32, 64]
    return N in p

def get_param_combs(component_name, parameter_ranges, constraints=None):
    # Special case:
    if component_name == "kogge_stone_adder":
        return ['N'], [(8,), (16,), (32,), (64,)], 4
    
    param_names = [param[0] for param in parameter_ranges]
    param_values = [range(param[1][0], param[1][1] + 1) for param in parameter_ranges]
    
    param_combinations = list(itertools.product(*param_values))
    
    if constraints and component_name in constraints:
        constraint_func = constraints[component_name]
        param_combinations = [comb for comb in param_combinations if constraint_func(*comb)]
    
    total_combinations = len(param_combinations)
    
    return param_names, param_combinations, total_combinations

def find_component_directory(component_name, hierarchy='hierarchy.json', base_dir="generated"):
    for root, dirs, files in os.walk(base_dir):
        if component_name in dirs:#f"{component_name}.v" in files:
            d = dirs[dirs.index(component_name)]
            return os.path.join(base_dir, d)
    return None

def generate_testbench(component_name, parameter_ranges=[], rules=[], subs=False, time_limit=10, component_dir=None, constraints=None):
    print("Generating testbench for", component_name)
    if component_dir is None:
        component_dir = find_component_directory(component_name)

    if not component_dir:
        raise FileNotFoundError(f"Component directory for {component_details['component_name']} not found.")
        
    details_filename = os.path.join(component_dir, f'{component_name}_details.json')
    with open(details_filename) as f:
        original_component_details = json.load(f)

    param_names, param_combinations, total_combinations = get_param_combs(component_name, parameter_ranges, constraints)
    print(f"Parameter Names: {param_names}")
    print(f"Total Parameter Combinations: {total_combinations}")
    print("Parameter Combinations:", param_combinations)

    #unique_param_combinations = set(tuple(comb) for comb in param_combinations)
    #unique_param_combinations = [list(comb) for comb in unique_param_combinations]
    #print("Unique Parameter Combinations:", unique_param_combinations[:5])

    """
    if not 'param_combs' in component_details:
        

    for comb in unique_param_combinations:
        component_details['param_combs'].append(comb)

    #print(component_details['param_combs'])
    
    # Ensure param_combs contains only unique combinations
    component_details['param_combs'] = [list(comb) for comb in set(tuple(pc) for pc in component_details['param_combs'])]

    
    """

    # Generate separate TB for every parameter combination
    for param_comb in param_combinations:
        print("Param Combination:", param_comb)

        component_details = json.loads(json.dumps(original_component_details))

        param_combs = []
        for k in range(len(param_comb)):
            param_combs.append((param_names[k], param_comb[k]))

        #print(param_combs)
        N_val = 1
        for p in param_combs:
            if 'N' in p:
                N_val = p[1]
                break

        #print(N_val)
                
        component_details['param_comb'] = param_combs
        
        lines = component_details['inputs'] + component_details['outputs']
        
        for z in range(len(lines)):
            inp = lines[z]
            signal_type, conn_type, sign_type, bit_width, signal_name = inp

            #print("Old bit width:", bit_width)
            
            #bit_width_value = 1
            #if bit_width != "1":
                #parts = sorted(bit_width.split(':'))
                #bit_width_value = int(parts[1]) - int(parts[0]) + 1 

            # Modify bit widths
            #print(param_range, bit_width)
            #time.sleep(1)
            param_dict = {param_names[i]: param_comb[i] for i in range(len(param_names))}
            #print(param_dict)

            # Function to replace parameters in the bit width string
            def replace_param(match):
                param = match.group(0)
                return str(param_dict.get(param, param))
        
            # Use regex to replace full parameter names in the bit width string
            param_pattern = re.compile(r'\b(' + '|'.join(re.escape(param) for param in param_names) + r')\b')
            bit_width = param_pattern.sub(replace_param, bit_width)
            #print(bit_width)
        
            """
            parts = bit_width_replaced.split(':')
            for i in range(len(parts)):
                parts[i] = str(eval(parts[i]))
            
            parts = bit_width.split(':')
            for i in range(len(parts)):
                part = parts[i]
                for j in range(len(part)):
                    p = part[j]
                    if p in param_names:
                        ind = param_names.index(p)
                        #print(p, param_names, ind)
                        parts[i] = parts[i].replace(p, str(param_comb[ind]))

            bit_width = ':'.join(parts)
            """

            match = re.match(r'(\d+-/*\d+):(\d+)', bit_width)
            if match:
                expression, end = match.groups()
                # Evaluate the arithmetic expression
                start = eval(expression)
                end = int(end)
                bit_width = f"{start}:{end}"

            #print("New Bit Width:", bit_width)

            if bit_width != '1':
                parts = bit_width.split(':')
                #print(parts[0], parts[1], parts[0] == parts[1], int(parts[0]) == int(parts[1]))
                
                if parts[0] == parts[1]:
                    bit_width = '1'

            #print("Newest Bit Width:", bit_width)

            if z < len(component_details['inputs']):
                component_details['inputs'][z] = (signal_type, conn_type, sign_type, bit_width, signal_name)
            else:
                component_details['outputs'][z - len(component_details['inputs'])] = (signal_type, conn_type, sign_type, bit_width, signal_name)

        input_ranges = {}
        for inp in component_details['inputs']:
            signal_type, conn_type, sign_type, bit_width, signal_name = inp
            input_range = list(determine_input_ranges(bit_width, sign_type))
            input_ranges[signal_name] = [input_range[0], input_range[-1]]
                    
        print("Input Ranges: ", input_ranges)
            
        num_possible_tests = 1
        for input_range in input_ranges.values():
            #print(input_range, input_range[1], input_range[0])
            num_possible_tests *= (input_range[1] - input_range[0] + 1)
    
        print("Total possible tests: ", num_possible_tests)

        predicted_time, avg_time, std_dev = predict_execution_time("run_single_testbench", num_possible_tests)
        print(f"Predicted time for {num_possible_tests} tests: {predicted_time}s (avg: {avg_time}s, std: {std_dev}s)")

        recommended_depth, max_tests = recommend_test_depth(time_limit, avg_time, num_possible_tests)
        print(f"Recommended test depth for {time_limit}s: {recommended_depth}, {max_tests}/{num_possible_tests} tests to be generated.")

        test_depth = recommended_depth
        
        num_tests = int(test_depth * num_possible_tests)
        stimuli = []
        expected_values = []
        test_cases = []

        print("Number of tests to generate:", num_tests)

        inputs = component_details['inputs']
    
        for t in range(num_tests):
            #print("Generating stimulus for test", t)
            #print("Current test cases:", test_cases)
            test_case = {}
            
            valid = False
            while not valid:
                for input, range_values in input_ranges.items():
                    #print("Input:", input, "Range values:", range_values, "Input ranges:", input_ranges)
                    value = random.randint(range_values[0], range_values[1])

                    temp = [i for i in inputs if input in i][0]
                    bit_width = temp[-2]
                    sign = temp[2]
                    #print(sign, bit_width)

                    if bit_width == '1':
                        bit_width_value = 1
                    else:
                        parts = bit_width.split(':')
                        start = int(parts[0])
                        end = int(parts[1])
                        bit_width_value = abs(start - end) + 1
                    
                    #print("Random value:", value, "Bit width value:", bit_width_value, "Binary string:", to_binary_string(value, bit_width_value, sign))
                    test_case[input] = to_binary_string(value, bit_width_value, sign)

                #print("Test case:", test_case)
                #time.sleep(1)

                if not test_case in test_cases:
                    valid = True

            test_cases.append(test_case)
        
            stimulus = " ".join([f"{input} = {len(value)}'b{value};" for input, value in test_case.items()])
            stimuli.append(stimulus)

        for t in range(len(test_cases)):
            test_case = test_cases[t]
            for key, v in test_case.items():
                test_cases[t][key] = int(v, 2)

        if rules:    
            #print(param_names)
            #pprint.pprint(test_cases)
            if param_names:
                for rule in rules:
                    bw = 1
                    if len(param_comb) > 0:
                        if 'N' in param_names:
                            bw = param_comb[param_names.index('N')]
                        else:
                            bw = param_comb[0]
                    rule.set_bit_width(bw)

            expected_values = assign_rules_to_tests(rules, test_cases, component_details)
    
        component_details['stimuli'] = stimuli
        component_details['expected'] = expected_values
        
        param_comb_str = ""
        for k in range(len(param_comb)):
            param_comb_str += f"{param_names[k]}{param_comb[k]}_"
        param_comb_str = param_comb_str[:-1]

        #print(param_comb_str)

        component_details['component_name'] = component_name
        component_details['param_component_name'] = f'{param_comb_str}_{component_name}'

        # Save the modified component details to a new JSON file
        param_details_filename = os.path.join(component_dir, f'{component_name}_details_{param_comb_str}.json')

        #pprint(component_details)
        
        with open(param_details_filename, "w") as f:
            f.write(json.dumps(component_details, indent=4))

        print("Parameterized component details saved to", param_details_filename)
    
        template = jinja2.Template(testbench_template)
        tb_code = template.render(component_details)
        
        tb_filename = os.path.join(component_dir, f"tb_{param_comb_str}_{component_name}.v")
        with open(tb_filename, "w") as f:
            f.write(tb_code)
            
        print(f"Testbench generated and saved to {tb_filename}\n")

    #time.sleep(10)

    if subs and 'submodules' in component_details:
        print("Generating testbenches for submodules of", component_name)
        for submodule_name, submodule_details in component_details['submodules'].items():
            #submodule_rules = [rule for rule in rules if any(word in rule.__class__.__name__.lower() for word in submodule_name.split('_'))]
            submodule_dir = find_component_directory(submodule_name, base_dir=component_dir)
            #print(component_dir, submodule_dir)

            if not submodule_dir:
                raise FileNotFoundError(f"Component directory {submodule_dir} for {submodule_details['component_name']} in {component_dir} not found.")
                
            details_filename = os.path.join(submodule_dir, f'{submodule_name}_details.json')
            #print(f"Generating for {details_filename}")
            component_details = json.load(open(details_filename))
            parameters = component_details["parameters"]
            parameter_ranges = [(p['name'], (1, min([int(p['value']*4), 8]))) for p in parameters]
            print("Parameter ranges for submodule", submodule_name, ":", parameter_ranges)
            generate_testbench(submodule_name, parameter_ranges, rules, subs, time_limit, submodule_dir, constraints)

    print("Done generating TBs for submodules for", component_name)

    return tb_filename, expected_values

if __name__ == "__main__":
    if "simulation" in os.getcwd():
        os.chdir("..")

    print(os.getcwd())

    component_name = 'kogge_stone_adder'

    component_dir = find_component_directory(component_name)

    if not component_dir:
        raise FileNotFoundError(f"Component directory for {component_name} not found.")
        
    details_filename = os.path.join(component_dir, f'{component_name}_details.json')
    component_details = json.load(open(details_filename))
    parameters = component_details["parameters"]
    parameter_ranges = [(p['name'], (8, min([int(p['value']) * 8, 64]))) for p in parameters]
    print("Parameter ranges:", parameter_ranges)

    rules = [AdderRule(), SquareRule(), TriangleRule(), BigCircleRule(), SmallCircleRule()]
    print("Rules:", rules)

    def carry_skip_constraint(N, BLOCK_SIZE):
        return N % BLOCK_SIZE == 0

    constraints = None#{component_name: kogge_stone_constraint}
    print("Constraints:", constraints)

    tb_filename, expected_values = generate_testbench(component_name, parameter_ranges=parameter_ranges, rules=rules, subs=True, time_limit=60, constraints=constraints)