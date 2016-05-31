% sample frequencty
Fs = 44100;

A = 1;

% parameters

% carrier frequency
b_f = 800;

% frequency offset
delta_f = b_f/4;

% code symbol frequencies
%f0 = b_f - delta_f;
%f1 = b_f + delta_f;

[noise, Fs] = audioread('interference2.wav');
[f1, f2] = analyse_noise(noise, Fs);
[f0, f1] = pick_freq(f1, f2);

Fs = 44100;


% duration of codeword
w_duration = 0.1;
t = 0:(1/Fs):w_duration;

% barker code
% +1 +1 +1 −1 −1 −1 +1 −1 −1 +1 −1

bound = [0, 0, 0, 1, 1, 1, 0, 1, 1, 0, 1];
w_b = bin2sound(bound, A, f0, f1, w_duration, Fs); 

% record data from microphone
% rec_data = record(Fs);sound_data = sound_data + (randn(size(sound_data)) * 4);

rec_data = sound_data;

% search sync signals at start and end
[ix_s, ix_e] = bound_signal(w_b, rec_data);

% trim the signal with the found indices
trimmed_data = apply_bounds(rec_data, length(t), ix_s, ix_e);

% reconstruct binary data
b_string = signal2bin(trimmed_data, f0, f1, length(t), Fs);

S = transpose(reshape(b_string, 8, []));
decimalValues = bin2dec(S);

out = transpose(char(decimalValues));