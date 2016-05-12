% sample frequency
Fs = 44100;

nBits = 8;
nChannels = 1;

rec = audiorecorder(Fs,nBits,nChannels);
recordblocking(rec, 4);
y1 = getaudiodata(rec, 'double');
plot(y1);
axis([0 200000 -1 1]);