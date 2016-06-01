function [ start_ix, end_ix ] = bound_signal( bound, signal )
%Bound Signal 
%   Detailed explanation goes here

sync_length = length(bound);

[acor,lag] = xcorr(signal(1:sync_length * 5), bound);

[~,I] = max(abs(acor));
lagDiff = lag(I);
start_ix = lagDiff + sync_length;

[acor,lag] = xcorr(signal(end-(sync_length * 5):end), bound);

[~,I] = max(abs(acor));
lagDiff = lag(I);
end_ix = lagDiff + sync_length + length(signal) - sync_length * 5 - 1 - sync_length;

end

