function bin_string = signal2bin( signal, f0, f1, word_length, Fs )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
% reconstruct message from predominating frequencies
temp = reshape(signal, word_length, []);
f_d = abs(fft(temp));
b11 = floor((f0 - 25) * word_length / Fs);
b12 = floor((f0 + 25) * word_length / Fs);
b21 = floor((f1 - 25) * word_length / Fs);
b22 = floor((f1 + 25) * word_length / Fs); 
f_d(1:b11, :) = 0;
f_d(b12:b21, :) = 0;
f_d(b22:end, :) = 0;
[~, indexMax] = max(f_d);
frequency = (indexMax-1) * Fs / word_length;

bin_string = [];

for i=frequency
    d0 = abs(i - f0);
    d1 = abs(i - f1);
    
    if d0 > d1
        bin_string = [bin_string, '0'];
    else 
        bin_string = [bin_string, '1'];
    end
end

end

