% fsk

% amplitude
A=1;

% sampling frequency
Fs = 44100;

% carrier frequency
b_f = 1700;

% frequency offset
delta_f = 600;

% word duration
w_duration = 0.2;

% bound signal
w_b = gen_bound(500, A, Fs, 1);

% serialize text
b = text2bin('jambon.txt');

% % emulated async
% sound_data = [zeros(1, 15000), w_b];
% sound_data = w_b;

sound_data = bin2sound(b, A, b_f, delta_f, w_duration, Fs);

% end bound signal
sound_data = [zeros(1, 9348), w_b, sound_data, w_b, zeros(1, 2948)];

% % emulated async and noise
% sound_data = [sound_data, zeros(1,10000)];
% sound_data = sound_data + randn(size(sound_data));

% sound(sound_data, Fs);
