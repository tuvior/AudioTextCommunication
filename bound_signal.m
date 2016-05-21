function [ start_ix, end_ix ] = bound_signal( bound, signal )
%Bound Signal 
%   Detailed explanation goes here

sync_length = length(bound);

correlated = conv(signal(1:sync_length * 4), bound);
[~, ix_s] = max(correlated);
start_ix = ix_s + 1;

correlated = conv(signal(end-(sync_length * 4):end), bound);
[~, ix_e] = max(correlated);
end_ix = ix_e + length(signal) - sync_length * 4 - 1 - sync_length;

end

