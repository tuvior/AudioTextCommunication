function sound_data = bin2sound3 ( bin , A, f0, f1, f2, f3 , w_duration, Fs)
sound_data = [];
t = 0:(1/Fs):w_duration;

w0 = A*cos(2*pi * f0 * t);
w1 = A*cos(2*pi * f1 * t);
w2 = A*cos(2*pi * f2 * t);
w3 = A*cos(2*pi * f3 * t);

bin = reshape(bin, 2, []);

for i = bin
    if isequal(i, [0, 0]')
        sound_data = [sound_data, w0, w0, w0];
    elseif isequal(i, [0, 1]')
        sound_data = [sound_data, w1, w1, w1];
    elseif isequal(i, [1, 0]')
        sound_data = [sound_data, w2, w2, w2];
    elseif isequal(i, [1, 1]')
        sound_data = [sound_data, w3, w3, w3];
    end
end
end