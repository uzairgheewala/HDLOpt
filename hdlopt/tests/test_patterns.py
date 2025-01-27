from ..patterns.regex import RegexPattern
from ..patterns.string_match import StringMatchPattern
from ..patterns.substring import Substring_CountPattern, SubstringPattern


def test_substring_pattern():
    # Test SubstringPattern
    pattern = SubstringPattern("alu")
    assert pattern.matches("alu.v"), "Substring 'alu' should match 'alu.v'"
    assert not pattern.matches("adder.v"), "Substring 'alu' should not match 'adder.v'"
    assert pattern.exact_match("alu.v"), "Exact match for 'alu.v' should be True"
    assert not pattern.exact_match(
        "alu_adder.v"
    ), "Exact match for 'alu_adder.v' should be False"


def test_substring_count_pattern():
    # Test Substring_CountPattern
    pattern = Substring_CountPattern("alu", {"alu": (1, 3)})
    assert pattern.matches("alu.v"), "1 occurrence of 'alu' should match"
    assert pattern.matches("alu_alu.v"), "2 occurrences of 'alu' should match"
    assert not pattern.matches(
        "alu_alu_alu.v"
    ), "3 occurrences of 'alu' should not match"
    assert not pattern.matches("adder.v"), "0 occurrences of 'alu' should not match"


def test_string_match_pattern():
    # Test StringMatchPattern
    pattern = StringMatchPattern("alu.v")
    assert pattern.matches("alu.v"), "Exact string 'alu.v' should match"
    assert not pattern.matches(
        "alu_adder.v"
    ), "String 'alu_adder.v' should not match 'alu.v'"
    assert not pattern.matches(
        "alu.v.bak"
    ), "String 'alu.v.bak' should not match 'alu.v'"


def test_regex_pattern():
    # Test RegexPattern
    pattern = RegexPattern(r"alu_\d+\.v")
    assert pattern.matches("alu_1.v"), "Regex should match 'alu_1.v'"
    assert pattern.matches("alu_123.v"), "Regex should match 'alu_123.v'"
    assert not pattern.matches("alu.v"), "Regex should not match 'alu.v'"
    assert not pattern.matches("alu_abc.v"), "Regex should not match 'alu_abc.v'"
