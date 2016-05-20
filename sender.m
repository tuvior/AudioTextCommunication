% fsk

% amplitude
A=1;

% sampling frequency
Fs = 44100;

% carrier frequency
b_f = 1700;

% frequency offset
delta_f = 400;

% bound signal
f_b = 500;
dur_b = 1;
t_b = 0:(1/Fs):dur_b;
w_b = A*cos(2*pi * f_b * t_b);

b = text2bin('jambon.txt');

% % emulated async
% sound_data = [zeros(1, 15000), w_b];
% sound_data = w_b;

sound_data = bin2sound(b, A, b_f, delta_f, 6000, Fs);

% end bound signal
sound_data = [zeros(1, 1000), w_b, sound_data, w_b];

% % emulated async and noise
% sound_data = [sound_data, zeros(1,10000)];
% sound_data = sound_data + randn(size(sound_data));

% sound(sound_data, Fs);
