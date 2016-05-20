function bin_seq = text2bin( filename )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
fid = fopen(filename);
x = fread(fid, '*char');
binn = dec2bin(x,8);
bin_t = transpose(binn);
bin = bin_t(:) - '0';
bin_seq = transpose(bin);
end
