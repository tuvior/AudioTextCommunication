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
 
[fn1, fn2] = analyse_noise( Fs);
[f0, f1, f2, f3] = pick_freq3(fn1, fn2);

% duration of codewordf(ft)bin2sound3
w_duration = 240/1200;
t = 0:(1/Fs):w_duration;

% barker code
% +1 +1 +1 −1 −1 −1 +1 −1 −1 +1 −1

bound = [1, 1, 0, 0, 0, 1, 1, 1, 0, 1, 1, 0, 1, 1];
w_b = bin2sound2(bound, A, f0, f1, f2, f3, w_duration, Fs); 

disp('noise');

% record data from microphone
rec_data = record(Fs);
% rec_data = sound_data;

% search sync signals at start and end
[ix_s, ix_e] = bound_signal(w_b, rec_data);

% trim the signal with the found indices
trimmed_data = apply_bounds2(rec_data, length(t), ix_s, ix_e);

disp(ix_e - ix_s);

% reconstruct binary data
b_string = signal2bin3(trimmed_data, f0, f1, f2, f3, length(t), A, w_duration, Fs);
S = transpose(reshape(b_string, 8, []));
decimalValues = bin2dec(S);

out = transpose(char(decimalValues));

disp('result:');
disp(out);