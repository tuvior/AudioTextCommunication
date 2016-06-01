function [ f1, f2 ] = analyse_noise( Fs )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

rec = audiorecorder(Fs, 8, 1);
recordblocking(rec, 5);
noise = getaudiodata(rec, 'double');

[ft, f] = periodogram(noise, [], [], Fs);
[~, in] = findpeaks(ft, 'SortStr', 'descend', 'NPeaks', 2);
freq = sort(f(in));
f1 = freq(1);
f2 = freq(2);
end

