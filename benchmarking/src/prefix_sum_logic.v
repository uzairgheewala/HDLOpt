module prefix_sum_logic (
    input wire p_i,       // in propagate signal from stage i
    input wire g_i,       // in generate signal from stage i
    input wire p_j,       // in propagate signal from stage j
    input wire g_j,       // in generate signal from stage j
    
    output wire p_kj,     // out combined propagate signal
    output wire g_kj      // out combined generate signal
);
    assign p_kj = p_i & p_j;
    assign g_kj = g_i | (p_i & g_j);
endmodule