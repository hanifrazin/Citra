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
   h=imhist(abu);figure,plot(h);axis([0 255 0 500]);
   biner = binerImage(abu,150);
      
end