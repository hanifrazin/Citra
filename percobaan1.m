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
   B = bwboundaries(closing,8); % find the boundaries of all objects

   CC = cell(1, length(B)); % pre-allocate
     
   for k = 1:length(B)
        CC{k} = chaincode2(B{k}); % chain code for the k'th object
   end
%    [kodeRantai tabel tepi] = ChainCode(morf);
%    imshow(tepi)
%    EdgeBw = edge(thick,'roberts');
   figure,imshowpair(opening,closing,'montage');

end