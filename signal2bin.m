function bin_string = signal2bin( signal, carrier_freq, word_length, Fs )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
% reconstruct message from predominating frequencies
temp = reshape(signal, word_length, []);
[~, indexMax] = max(abs(fft(temp - mean(temp(:)))));
frequency = (indexMax-1) * Fs / word_length;

bin_string = [];

for i=frequency
    delta = i - carrier_freq;
    
    if delta > 0
        bin_string = [bin_string, '0'];
    else 
        bin_string = [bin_string, '1'];
    end
end

end

