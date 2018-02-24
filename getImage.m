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
   gauss = fspecial('gaussian',[5 5],0.5);
   smooth = imfilter(abu,gauss,'replicate');
   figure,imshowpair(abu,smooth,'montage');
   prewitt = uint8(DeteksiTepi(smooth,'prewitt'));
   figure,imshow(prewitt);
%    filter = imfilter(abu,fspecial('gaussian'));
%    filter2 = imfilter(abu,fspecial('log'));
%    tepi = edge(filter,'log');
%    tepi2 = edge(filter2,'prewitt');
%    figure,imshowpair(tepi,filter2,'montage');
   %% Crop and Resize Image
%    cropImg = imcrop(filter);
%    figure,imshow(cropImg),title('Filter');

   %% Sharp Image
   Gablok=[97.5 108.5 94 148]
   Potong=[97.5 96.5 84 160]
%    biner2 = threshBiner(cropImg,180);
   
end