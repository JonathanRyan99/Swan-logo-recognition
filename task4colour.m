clear; close all; clc;
source = imread('IMG_08.jpg');

%%
%this shows the different colour channels in respective grey scale
rmat = source(:,:,1);
gmat = source(:,:,2);
bmat = source(:,:,3);

figure();
subplot(2,2,1), imshow(rmat);
title('red plane');
subplot(2,2,2), imshow(gmat);
title('green plane');
subplot(2,2,3), imshow(bmat);
title('blue plane');
subplot(2,2,4), imshow(source);
title('source image');

%%
%shows the individual binarized channgels as well as the summed one
ir = imbinarize(rmat);
ib = imbinarize(bmat);
ig = imbinarize(gmat);
image = (ir&ib&ig);

figure();
subplot(2,2,1), imshow(ir);
title('red plane');
subplot(2,2,2), imshow(ib);
title('green plane');
subplot(2,2,3), imshow(ig);
title('blue plane');
subplot(2,2,4), imshow(image);
title('combined image');

%%
%clears the boarders of the image since the swan is almost always in the
%center
bordered = imclearborder(image,4);
figure();
imshow(bordered);
title('bordered cleared image');

%%
%morphological operator
%this section cleans up left over noise
%4 choosen because higher tends to sqew the swans shape
se = strel('diamond',4);
openned = imopen(bordered,se);

figure();
imshow(openned);
title('morphological operator openned');

%%
%more cleaning but this isnt really helping
areaopenned = bwareaopen(openned,1000);
figure();
imshow(areaopenned);
title('area openned');

%% 
%look into region properties for selecting the swan maybe eccentricity or
%the spherical

