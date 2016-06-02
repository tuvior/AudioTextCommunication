function bin_string = signal2bin5( signal, f0, f1, f2, f3, word_length, A, w_duration, Fs )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
% reconstruct message from predominating frequencies
t = 0:(1/Fs):w_duration;

w0 = A*cos(2*pi * f0 * t);
w1 = A*cos(2*pi * f1 * t);
w2 = A*cos(2*pi * f2 * t);
w3 = A*cos(2*pi * f3 * t);

temp = reshape(signal, word_length, []);
slice = int64(size(temp, 2) / 3);

bin_string = [];

j = 1;
bits_found = []
all_bits = [];
for t=temp
    acor0 = abs(xcorr(t, w0));
    acor0 = max(acor0(floor(length(acor0)/2) -10: floor(length(acor0)/2) +10));
    acor1 = abs(xcorr(t, w1));
    acor1 = max(acor1(floor(length(acor1)/2) -10: floor(length(acor1)/2) +10));
    acor2 = abs(xcorr(t, w2));
    acor2 = max(acor2(floor(length(acor2)/2) -10: floor(length(acor2)/2) +10));
    acor3 = abs(xcorr(t, w3));
    acor3 = max(acor3(floor(length(acor3)/2) -10: floor(length(acor3)/2) +10));

    [~, i] = max([acor0, acor1, acor2, acor3]);

    if i == 1
        bits_found = [bits_found; '00'];
    elseif i == 2
        bits_found = [bits_found; '01'];
    elseif i == 3
        bits_found = [bits_found; '10'];
    elseif i == 4
        bits_found = [bits_found; '11'];
    else
        disp('ERROR : could not retrieve bits');
    end
    
    if j < slice 
        j = j + 1;
    else
        all_bits = [all_bits, cellstr(bits_found)];
        j = 1;
        bits_found = [];
    end
end

for a=all_bits'
    bin_string = [bin_string, mode(char(a))]
end



end