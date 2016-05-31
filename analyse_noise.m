function [ f1, f2 ] = analyse_noise( noise, Fs )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

[ft, f] = periodogram(noise, [], [], Fs);
[~, in] = findpeaks(ft, 'SortStr', 'descend', 'NPeaks', 2);
freq = sort(f(in));
f1 = freq(1);
f2 = freq(2);
end

