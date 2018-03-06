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
   CropImg = imcrop(Img,[122.5 45.5 155 155]);

   %% Biner
   otsu = graythresh(CropImg);
   BwImg = im2bw(CropImg,otsu);
   InversBw = imcomplement(BwImg);

   %% Morfologi
   SE1 = strel('line',3,45);
   SE2 = strel('square',4);
   SE3 = strel('line',7,90);
   
   opening = imopen(InversBw,SE1);
   closing = imclose(opening,SE2);
   
   %% Ekstraksi
   boundary = bwboundaries(closing,8,'noholes'); % find the boundaries of all objects
   b = boundary{1,1};
   b(end,:) = [];
   cc = chaincode2(b);
   cc2 = koderantai(b);
   row = size(cc,1);
   fprintf('Chain Code : ');
   for i=1:row
       fprintf('%d',cc.code);
       fprintf('\n');
       fprintf('%d',cc2);
   end
   fprintf('\n');
   figure,imshowpair(opening,closing,'montage');

end