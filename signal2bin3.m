function bin_string = signal2bin3( signal, f0, f1, f2, f3, word_length, A, w_duration, Fs )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
% reconstruct message from predominating frequencies
t = 0:(1/Fs):w_duration;

w0 = A*cos(2*pi * f0 * t);
w1 = A*cos(2*pi * f1 * t);
w2 = A*cos(2*pi * f2 * t);
w3 = A*cos(2*pi * f3 * t);

temp = reshape(signal, word_length, []);

bin_string = [];

for t=temp
    acor0 = max(abs(xcorr(t, w0)));
    acor1 = max(abs(xcorr(t, w1)));
    acor2 = max(abs(xcorr(t, w2)));
    acor3 = max(abs(xcorr(t, w3)));

    [~, i] = max([acor0, acor1, acor2, acor3]);
    
    if i == 1
        bin_string = [bin_string, '00'];
    elseif i == 2
        bin_string = [bin_string, '01'];
    elseif i == 3
        bin_string = [bin_string, '10'];
    elseif i == 4
        bin_string = [bin_string, '11'];
    else
        disp('ERROR : could not retrieve bits');
    end
end

end