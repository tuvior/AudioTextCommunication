function rec_data = record( Fs )
%RECORD Summary of this function goes here
%   Detailed explanation goes here
rec = audiorecorder(Fs, 8, 1);
pause;
disp('start recoding');
record(rec);
pause;
stop(rec);
disp('end recording');
rec_data = getaudiodata(rec, 'double');
end

