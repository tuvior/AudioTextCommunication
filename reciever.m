% sample frequencty
Fs = 44100;

nBits = 8;
nChannels = 1;

%rec = audiorecorder(Fs,nBits,nChannels);
%recordblocking(rec, 4);
%rec_data = getaudiodata(rec, 'double');

% signal needs to be split here
%rec_data = reshape(rec_data, 9736);

temp = reshape(sound_data, length(t), []);
[maxValue, indexMax] = max(abs(fft(temp - mean(temp(:)))));
frequency = (indexMax-1) * Fs / length(t);

b_string = [];

for i=frequency
    delta = i - b_f;
    
    if delta > 0
        b_string = [b_string, '0'];
    else 
        b_string = [b_string, '1'];
    end
end

S = transpose(reshape(b_string, 8, []));
decimalValues = bin2dec(S);

out = transpose(char(decimalValues));
    

%plot(rec_data);
%axis([0 200000 -1 1]);