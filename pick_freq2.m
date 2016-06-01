function [ f_0, f_1, f_2, f_3 ] = pick_freq2( f1, f2)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

low = 400;
high = 4000;

freq = [low, f1, f2, high];

d1 = freq(2) - freq(1);
d2 = freq(3) - freq(2);
d3 = freq(4) - freq(3);

[max_d, index] = max([d1, d2, d3]);
split = max_d / 3;
f_0 = freq(index) + split;
f_1 = freq(index) + (2*split);

freq = [freq, f_0, f_1];
freq = sort(freq);

d1 = freq(2) - freq(1);
d2 = freq(3) - freq(2);
d3 = freq(4) - freq(3);
d4 = freq(5) - freq(4);
d5 = freq(6) - freq(5);

[max_d, index] = max([d1, d2, d3, d4, d5]);
split = max_d / 2;
f_2 = freq(index) + split;

freq = [freq, f_2];
freq = sort(freq);

d1 = freq(2) - freq(1);
d2 = freq(3) - freq(2);
d3 = freq(4) - freq(3);
d4 = freq(5) - freq(4);
d5 = freq(6) - freq(5);
d6 = freq(7) - freq(6);

[max_d, index] = max([d1, d2, d3, d4, d5, d6]);
split = max_d / 2;
f_3 = freq(index) + split;

end