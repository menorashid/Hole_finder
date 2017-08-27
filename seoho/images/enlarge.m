clear all;
close all;
clc;

file = '2_7';
I = imread([file, '.jpg']);
[m, n, ~] = size(I);
zoom = 8;
x = 350;
y = 380;
Inew = I(x:x+m/zoom, y:y+n/zoom, :);
imshow(Inew)
imwrite(Inew, [file, '_', int2str(zoom), 'x.jpg']);