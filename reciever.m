% sample frequencty
Fs = 44100;

% parameters

% carrier frequency
b_f = 1700;

% frequency offset
delta_f = 600;

% code symbol frequencies
f0 = b_f - delta_f;
f1 = b_f + delta_f;

% duration of codeword
w_duration = 0.2;
t = 0:(1/Fs):w_duration;

% bound signal
w_b = gen_bound(500, 1, Fs, 1);

% record data from microphone
% rec_data = record(Fs);
rec_data = sound_data;

% search sync signals at start and end
[ix_s, ix_e] = bound_signal(w_b, rec_data);

% trim the signal with the found indices
trimmed_data = apply_bounds(rec_data, length(t), ix_s, ix_e);

% reconstruct binary data
b_string = signal2bin(trimmed_data, b_f, length(t), Fs);

S = transpose(reshape(b_string, 8, []));
decimalValues = bin2dec(S);

out = transpose(char(decimalValues));