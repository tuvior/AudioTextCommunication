function [ f1, f2 ] = analyse_noise( Fs )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

rec = audiorecorder(Fs, 8, 1);
recordblocking(rec, 5);
noise = getaudiodata(rec, 'double');

[ft, f] = periodogram(noise, [], [], Fs);
plot(ft);
inx = floor(200 * length(ft) / Fs);
[~, in] = findpeaks(ft(inx:end), 'SortStr', 'descend', 'NPeaks', 2);
freq = sort(f(in + inx));
f1 = freq(1);
f2 = freq(2);
end

