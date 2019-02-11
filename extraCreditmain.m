clear all;
clc;

% RGB Model
imageRGB = imread('white.jpg');
[imageHeight,imageWidth, dem]= size(imageRGB);

% -------------------------------------------------------------------------
% This part is the part using RGB color space to get the segmentation.
% Use the roipoly method to choose the area with the wanted color and creat 
% the sample mask image, which is the binary image.
samplemaskBlack = roipoly(imageRGB);

% Use the function sampleMeanCov get the sample mean and covariance.
[meanBlack, covBlack]= sampleMeanCova(samplemaskBlack, imageRGB );
% Use the function RGBsegmentation to get the blue part of the image.
Black = segmentationRGB(imageRGB,100,meanBlack);


% Get the Green part using the same method above.
samplemaskWhite = roipoly(imageRGB);
[meanGWhite, covWhite] =  sampleMeanCova(samplemaskWhite, imageRGB );
White = segmentationRGB(imageRGB,120,meanGWhite);

mask= mask( Black, White);

figure(1)
imshow(mask)
imwrite(mask, 'mask.bmp', 'bmp')

