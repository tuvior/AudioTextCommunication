% fsk

% amplitude
A=1;

% sampling frequency
Fs = 44100;

% carrier frequency
b_f = 800;

% frequency offset
delta_f = b_f/4;

[noise, Fs] = audioread('interference2.wav');
[f1, f2] = analyse_noise(noise, Fs);
[f0, f1] = pick_freq(f1, f2);

Fs = 44100;


% word duration
w_duration = 0.1;

% bound signal
bound = [0, 0, 0, 1, 1, 1, 0, 1, 1, 0, 1];
w_b = bin2sound(bound, A, f0, f1, w_duration, Fs); 

% serialize text
b = text2bin('jambon.txt');

% % emulated async
% sound_data = [zeros(1, 15000), w_b];
% sound_data = w_b;

sound_data = bin2sound(b, A, f0, f1, w_duration, Fs);

% end bound signal
sound_data = [zeros(1, 9348), w_b, sound_data, w_b, zeros(1, 2948)];

%plot(sound_data);

sound_data = sound_data + (randn(size(sound_data)) * 8);

duration = length(sound_data)/Fs;

% % emulated async and noise
% sound_data = [sound_data, zeros(1,10000)];
% sound_data = sound_data + randn(size(sound_data));

% sound(sound_data, Fs);
