function bin_string = signal2bin2( signal, f0, f1, f2, f3, word_length, Fs )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
% reconstruct message from predominating frequencies
temp = reshape(signal, word_length, []);
f_d = abs(fft(temp));
b11 = floor((f0 - 50) * word_length / Fs);
b12 = floor((f0 + 50) * word_length / Fs);
b21 = floor((f1 - 50) * word_length / Fs);
b22 = floor((f1 + 50) * word_length / Fs); 
b31 = floor((f2 - 50) * word_length / Fs);
b32 = floor((f2 + 50) * word_length / Fs);
b41 = floor((f3 - 50) * word_length / Fs);
b42 = floor((f3 + 50) * word_length / Fs);
f_d(1:b11, :) = 0;
f_d(b12:b21, :) = 0;
f_d(b22:b31, :) = 0;
f_d(b32:b41, :) = 0;
f_d(b42:end, :) = 0;
[~, indexMax] = max(f_d);
frequency = (indexMax-1) * Fs / word_length;

bin_string = [];

for i=frequency
    d0 = abs(i - f0);
    d1 = abs(i - f1);
    d2 = abs(i - f2);
    d3 = abs(i - f3);
    
    m_v = min([d0, d1, d2, d3]);
    
    if m_v == d0
        bin_string = [bin_string, '00'];
    elseif m_v == d1
        bin_string = [bin_string, '01'];
    elseif m_v == d2
        bin_string = [bin_string, '10'];
    elseif m_v == d3
        bin_string = [bin_string, '11'];
    end
end

end
