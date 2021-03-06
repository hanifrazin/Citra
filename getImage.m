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
   figure,imshow(X),title('Gambar original');
   
   %% Gray image
   abu = grayImage(Img);
   sharp = imsharpen(abu);
   
   %% Crop
   crop = imcrop(sharp,[107.5 72.5 173 116]);
   
   %% Resize Image
   reImg = imresize(crop,[150 150]);
   
   %% Binary image
   t = threshIterative(reImg);
   biner = threshBiner(reImg,t);
   
   %% Morfologi 
   
   
   
   
end