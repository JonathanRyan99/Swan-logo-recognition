% MATLAB script for Assessment 1
% Task-1
clear; close all; clc;

% Step-1: Load input image
source = imread('IMG_13.jpg');

%Step-2: Conversion of input image to grey-scale image
grayScale = rgb2gray(source);

% Step-3: Resizing the grayscale image using bilinear interpolation
halfSize = imresize(grayScale,0.5,'bilinear');

% Step-4: Generating histogram for the resized image
hist = imhist(halfSize);

%Step-5: Producing binarised image
[threshold ,EM] = otsuthresh(hist);
%the above line is just to demonstrate the threshold value calculated by
%otsu method which is the default method of imbinarize
otsu = imbinarize(halfSize);

%manual threshold 190/255 = 0.745
manual = imbinarize(halfSize, 190/255);

figure();
imshowpair(manual,otsu,'montage');
title('manual(190)                     otsu(156)');



%---------------------------------------------------------------


% Task-2
sobel = edge(halfSize,'sobel');
canny = edge(halfSize,'canny');
%figure;
%imshowpair(sobel,canny,'montage')
%title('Sobel Filter                                   Canny Filter');


%---------------------------------------------------------------
% Task-3;  
%swan is in the center of the image so we can loose the edges which is sky
bwborder = imclearborder(manual,4);
%areaopen removes objects that have a smaller connective value than the
%given value
bwborder2 = bwareaopen(bwborder,12000);

%left with 3 objects
%need to drop the middle object
swanTop = bwareafilt(bwborder2,1,'largest');
swanBottom = bwareafilt(bwborder2,1,'smallest');

%since theres no overlap you can just add the matrix
swan = swanTop + swanBottom;

figure();
imshow(swan);

%bwareafilter selects connected componets that have a combined pixel count in the given range
%swanBottom = bwareafilt(otsu,[12000 13000]);


%swan top is second largest object in image
%swanTop = bwareafilt(otsu,2,'largest');%selects the 2 largest objects in image
%swanTop2 = bwareafilt(swanTop,1,'smallest'); %selects the smaller of the two

%The image matrix retains the same dimensions in both and theres no
%overlap between the two sections so it is possible to simply add them

%swanFinal = swanTop2 + swanBottom;
%figure();
%imshowpair(otsu,swanFinal,'montage');

