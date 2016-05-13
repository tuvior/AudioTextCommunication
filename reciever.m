% sample frequency
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
%plot(rec_data);
%axis([0 200000 -1 1]);