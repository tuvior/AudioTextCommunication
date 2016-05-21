function bound_s = gen_bound( f, A, Fs, duration )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
t_b = 0:(1/Fs):duration;
bound_s = A*cos(2*pi * f * t_b);
end

