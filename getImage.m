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
   figure,imshow(X),title('Gambar ori');
   
   %% Gray image
   abu = grayImage(Img);
   sharp = imsharpen(abu);
   filter2 = imfilter(sharp,fspecial('laplacian'));
   %% Crop and Resize Image
   cropImg = imcrop(filter2);
   figure,imshow(cropImg),title('Filter');
   %% Sharp Image
   Gablok=[90.5 108.5 94 148]
   Potong=[97.5 96.5 84 160]
%    biner2 = threshBiner(cropImg,180);
   
end