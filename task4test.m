% MATLAB script for Assessment Item-1
% Task-4
clear; close all; clc;
source = imread('IMG_05.jpg');
%Step-2: Conversion of input image to grey-scale image
grayScale = rgb2gray(source);


% Step-3: Resizing the grayscale image using bilinear interpolation
halfSize = imresize(grayScale,0.5,'bilinear');




%calculate a threshold value using otsu method
I = imhist(halfSize);% produce histogram of image
[threshold ,EM] = otsuthresh(I); %threshold value, EM - em is the estimation of how well it worked

bw = imbinarize(halfSize,1.5 *threshold); %threshold often came out low so added a muiliplyer to tweak it up
%sobel = edge(bw,'sobel');
%figure();
%imshow(sobel);

%border also tends to leave small clusters of objects across the image
bwborder = imclearborder(bw,4);%clears objects connected to boarder generally skys and bright reflections
bw2 = bwareaopen(bwborder,500);%removes smaller objects left by border, swans generally a fair size

figure();
imshowpair(bwborder,bw2,'montage');






