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
w_duration = 6000/lcm(f0, f1);

t = 0:(1/Fs):w_duration;

% bound signal
f_b = 500;
dur_b = 1;
t_b = 0:(1/Fs):dur_b;
w_b = A*cos(2*pi * f_b * t_b);

% rec_data = record(Fs);

rec_data = sound_data;

max_v = 0;
index = 0;
sync_length = length(t_b);
ft = 0;
data_length = length(rec_data);

correlated = conv(rec_data(1:sync_length * 4), w_b);
[m, ix] = max(correlated);


% 
% % find beginning sync signal
% for pos = 1:25:(sync_length*3 - 1)
%     start_i = pos;
%     end_i = pos + sync_length - 1; 
%     temp_a = rec_data(start_i:end_i);
%     [ft, f] = periodogram(temp_a, [], [], Fs);
%     [pk, in] = findpeaks(ft, 'SortStr', 'descend', 'NPeaks', 1);
%     freq = f(in);
%     if abs(freq - f_b) < 100 && pk > max_v
%         max_v = pk;
%         index = pos;
%     end
% end
% 
% max_ve = 0;
% index_e = data_length;
% 
% % find ending sync signal
% for pos = 1:25  :(sync_length*3 - 1)
%     start_i = data_length - sync_length + 1 - pos;
%     end_i = data_length - pos;
%     temp_a = rec_data(start_i:end_i);
%     [ft, f] = periodogram(temp_a, [], [], Fs);
%     [pk, in] = findpeaks(ft, 'SortStr', 'descend', 'NPeaks', 1);
%     freq = f(in);
%     if abs(freq - f_b) < 100 && pk > max_ve
%         max_ve = pk;
%         index_e = start_i ;
%     end
% end
%     
% estimated_length = index_e - (index + sync_length) + 1;
% nBits_ubound = ceil(estimated_length/length(t));
% 
% % heuristic to decide whetever we cut out a character or not
% if rem(nBits_ubound,8) > 6
%     t_o = (nBits_ubound + (8 - rem(nBits_ubound,8))) * length(t);
% else 
%     t_o = (nBits_ubound - rem(nBits_ubound,8)) * length(t);
% end
% 
% trimmed_data = rec_data(index + sync_length:index + sync_length + t_o - 1);
% 
% % reconstruct message from predominating frequencies
% temp = reshape(trimmed_data, length(t), []);
% [maxValue, indexMax] = max(abs(fft(temp - mean(temp(:)))));
% frequency = (indexMax-1) * Fs / length(t);
% 
% b_string = [];
% 
% for i=frequency
%     delta = i - b_f;
%     
%     if delta > 0
%         b_string = [b_string, '0'];
%     else 
%         b_string = [b_string, '1'];
%     end
% end
% 
% S = transpose(reshape(b_string, 8, []));
% decimalValues = bin2dec(S);
% 
% out = transpose(char(decimalValues));