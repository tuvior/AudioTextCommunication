function sound_data = bin2sound ( bin , A, carrier_f, delta_f , w_duration, Fs)
sound_data = [];

f0 = carrier_f - delta_f;
f1 = carrier_f + delta_f;

t = 0:(1/Fs):w_duration;

w0 = A*cos(2*pi * f0 * t);
w1 = A*cos(2*pi * f1 * t);

for i = bin
    if i == 1
        sound_data = [sound_data, w0];
    elseif i == 0
        sound_data = [sound_data, w1];
    end
end
end