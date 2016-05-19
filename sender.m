% fsk

% amplitude
A=1;
% sampling frequency
Fs = 44100;

% carrier frequency
b_f = 1700;

% frequency offset
delta_f = 400;

% code symbol frequencies
f0 = b_f - delta_f;
f1 = b_f + delta_f;

% duration of codeword
w_duration = 6000/lcm(f0, f1);

t = 0:(1/Fs):w_duration;

% bound signal
f_b = 1000;
dur_b = 0.5;
t_b = 0:(1/Fs):dur_b;
w_b = A*cos(2*pi * f_b * t_b);

% code signals
w0 = A*cos(2*pi * f0 * t);
w1 = A*cos(2*pi * f1 * t);

% retrieve text file
fid = fopen('jambon.txt');
x = fread(fid, '*char');
binn = dec2bin(x,8);
bin_t = transpose(binn);
bin = bin_t(:) - '0';

% bit array of input text
b = transpose(bin);

% % emulated async
% sound_data = [zeros(1, 15000), w_b];
sound_data = w_b;

for i = b
    if i == 1
        sound_data = [sound_data, w0];
    elseif i == 0
        sound_data = [sound_data, w1];
    end
end

% end bound signal
sound_data = [sound_data, w_b];

% % emulated async and noise
% sound_data = [sound_data, zeros(1,10000)];
% sound_data = sound_data + randn(size(sound_data));



sound(sound_data, Fs);
