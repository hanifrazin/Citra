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
   CropImg = imcrop(SharpImg,[115.5 45.5 155 155]);

   %% Biner
   otsu = graythresh(CropImg);
   BwImg = im2bw(CropImg,otsu);
   InversBw = imcomplement(BwImg);

   %% Morfologi
   SE1 = strel('line',3,45);
   SE2 = strel('square',4);
   
   opening = imopen(InversBw,SE1);
   closing = imclose(opening,SE2);
  
   figure,imshowpair(opening,closing,'montage');
   
   %% Ekstraksi
   
   %% Display image
%    figure,
%    subplot(1,2,1),imshow(CropImg),title('Citra Grayscale');
%    subplot(1,2,2),imshow(InversBw),title('Citra Sharp');

end