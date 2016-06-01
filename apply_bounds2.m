function bounded_signal = apply_bounds2( signal, word_length, start_ix, end_ix )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
estimated_length = end_ix - start_ix - 1;
nBits_ubound = ceil(estimated_length/word_length);

% heuristic to decide whetever we cut out a character or not
if rem(nBits_ubound,4) > 2
    t_o = (nBits_ubound + (4 - rem(nBits_ubound,4))) * word_length;
else 
    t_o = (nBits_ubound - rem(nBits_ubound, 4)) * word_length;
end

bounded_signal = signal(start_ix: start_ix + t_o - 1);
end