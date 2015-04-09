%{
Method : This method extracts the characters from the data svt datsets
         provided.

Author : Suman Ghosh
         Sounak Dey
%}

clear all; close all; clc;
addpath('../characters/');
addpath('../lib/boxcount/');
params.filename = 'box.txt';
params.fid = fopen(params.filename, 'a+');
listing = dir('../characters/');
for i =3:length(listing)
    im = imread(listing(i).name);
    bw = im2bw(im, graythresh(im));
    [n,r] = boxcount(bw);
    df = -diff(log(n))./diff(log(r));
    fprintf(params.fid, '%s %f\n', listing(i).name, df);
end


