% MATLAB script for Assessment Item-1
% Task-4
clear; close all; clc;

source = imread('IMG_06.jpg');

%Step-2: Conversion of input image to grey-scale image
grayScale = rgb2gray(source);

% Step-3: Resizing the grayscale image using bilinear interpolation
halfSize = imresize(grayScale,0.5,'bilinear');

imshow(halfSize);
imhist(halfSize);
bw = imbinarize(halfSize);



    


