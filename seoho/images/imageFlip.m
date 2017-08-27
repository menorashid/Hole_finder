clear all;
close all;
clc;

imagesdir = 'C:\Users\ymzhang\Desktop\seoho\images';
images = dir([imagesdir '/*.jpg']);
num = length(images);
for i = 1:num
    pre = images(i).name;
    pre = pre(1:end - 4);
    I = imread([imagesdir, '\', images(i).name]);
    I_h = flip(I, 2);
    I_v = flip(I, 1);
    I_hv = flip(I_h, 1);
    imwrite(I_h, [imagesdir, '\', pre, '_h.jpg']);
    imwrite(I_v, [imagesdir, '\', pre, '_v.jpg']);
    imwrite(I_hv, [imagesdir, '\', pre, '_hv.jpg']);
end