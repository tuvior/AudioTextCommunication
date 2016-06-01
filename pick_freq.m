function [ f_0, f_1 ] = pick_freq( f1, f2)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

p1 = f1 - 400;
p2 = (f2 - f1)/2;
p3 = 2000- f2;

min_b = min([p1, p2, p3]);

if min_b == p2
    f_0 = 400;
    f_1 = 2000;
elseif min_b == p1
    f_0 = p2 + f1;
    f_1 = 2000;
else
    f_0 = 400;
    f_1 = p2 + f1;
end

