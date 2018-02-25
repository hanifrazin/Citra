%% Clear Command Window, Clear Workspace, Close Editor
clc;
clear all;
close all;

%% Get Image
StartDirectory = 'C:\Users\HANIF\Pictures';
[filename, pathname] = uigetfile({'*.jpg';'*.png';'.tif';'.tiff';'.gif'},'Pilih Gambar',StartDirectory);
if isequal(filename,0)
   disp('User selected Cancel')
else
   disp(sprintf('User selected %s',filename))
   
   %% Read image
   X = fullfile(pathname,filename);
   Img = imread(X);
   
   %% Gray and filter
   GrayImg = rgb2gray(Img);
   SharpImg = imsharpen(GrayImg);
   
   %% Crop 
   CropImg = imcrop(SharpImg,[115.5 45.5 155 155]);
   
   %% Biner
   level = graythresh(CropImg);
   BwImage = im2bw(CropImg,level);
   inversBw = not(BwImage);
   
   %% Morfologi 
   
   
   %% Display image
   figure,
   subplot(1,2,1),imshow(GrayImg),title('Citra Grayscale');
   subplot(1,2,2),imshow(CropImg),title('Citra Sharp');
   
   
end