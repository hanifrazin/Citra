%% Clear Command Window, Clear Workspace, Close Editor
clc;
clear all;
close all;

%% Get Image
StartDirectory = 'C:\Users\HANIF\Pictures\Golok';
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

   %% Crop and Resize ([x y panjang lebar])
   CropImg = imcrop(SharpImg,[122.5 45.5 155 155]);
   EdgeBw = edge(CropImg,'roberts');imshow(EdgeBw)

end