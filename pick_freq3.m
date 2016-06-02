function [ f_0, f_1, f_2, f_3 ] = pick_freq3( f1, f2)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

low = 400;
high = 4000;

base = [0, 240, 480, 720];
bsize = 1000;
offs = 0;

f1 = f1- mod(f1, 20) + 10;
f2 = f2 - mod(f2, 20) + 10;

freq = [low, f1, f2, high];

d1 = freq(2) - freq(1);
d2 = freq(3) - freq(2);
d3 = freq(4) - freq(3);

mm = max([d1 d2 d3]);

if mm == d1
    offs = low;
elseif mm == d2
    offs = f1 + 200;
else 
    offs = f2 + 200;
end

freqs = base + offs;

f_0 = freqs(1);
f_1 = freqs(2);
f_2 = freqs(3);
f_3 = freqs(4);
    
    
end