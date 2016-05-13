% sample frequency
Fs = 44100;

nBits = 8;
nChannels = 1;

rec = audiorecorder(Fs,nBits,nChannels);
recordblocking(rec, 4);
rec_data = getaudiodata(rec, 'double');

% signal needs to be split here

[maxValue, indexMax] = max(abs(fft(rec_data - mean(rec_data))));
plot(rec_data);
axis([0 200000 -1 1]);