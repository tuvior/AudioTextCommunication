% fsk

% amplitude
A=1;

% sampling frequency
Fs = 44100;

% carrier frequency
b_f = 800;

% frequency offset
delta_f = b_f/4;

[f1, f2] = analyse_noise(Fs);
[f0, f1, f2, f3] = pick_freq2(f1, f2);

% word duration
w_duration = 0.12;

% bound signal
bound = [1, 1, 0, 0, 0, 1, 1, 1, 0, 1, 1, 0, 1, 1];
w_b = bin2sound2(bound, A, f0, f1,f2, f3, w_duration, Fs); 

% serialize text
b = text2bin('jambon.txt');

% % emulated async
% sound_data = [zeros(1, 15000), w_b];
% sound_data = w_b;

sound_data = bin2sound2(b, A, f0, f1, f2, f3, w_duration, Fs);

% end bound signal
sound_data = [zeros(1, 2398), w_b, sound_data, w_b, zeros(1, 4392)];

%plot(sound_data);

% sound_data = sound_data + (randn(size(sound_data)) * 8);

duration = length(sound_data)/Fs;

%sound(sound_data, Fs);
