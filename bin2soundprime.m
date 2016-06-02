function sound_data = bin2sound(is_barker, bin , A, carrier_f, delta_f , w_duration, Fs)
sound_data = [];
if is_barker == 0
    f0 = carrier_f - delta_f;
    f1 = carrier_f + delta_f;
    f2 = carrier_f - 2 * delta_f;
    f3 = carrier_f + 2 * delta_f;

    t = 0:(1/Fs):w_duration;

    w0 = A*cos(2*pi * f0 * t);
    w1 = A*cos(2*pi * f1 * t);
    w2 = A*cos(2*pi * f2 * t);
    w3 = A*cos(2*pi * f3 * t);

    for i = size(bin)
        if bin(1, i) == 0 && bin(1, i) == 0
            sound_data = [sound_data, w0];
        elseif bin(1, i) == 0 && bin(1, i) == 1
            sound_data = [sound_data, w1];
        elseif bin(1, i) == 1 && bin(1, i) == 0
            sound_data = [sound_data, w2];
        elseif bin(1, i) == 1 && bin(1, i) == 1
            sound_data = [sound_data, w3];
        end
    end
elseif is_barker == 1
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
end