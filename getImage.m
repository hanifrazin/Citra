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
   gauss = fspecial('gaussian',[3 3],0.5);
   smooth = imfilter(abu,gauss,'replicate');
   sharp = imsharpen(abu);
   figure,imshowpair(smooth,sharp,'montage');
   tepi = uint8(DeteksiTepi(sharp,'prewitt'));
   tepi2 = uint8(DeteksiTepi(smooth,'prewitt'));
   figure,imshowpair(tepi,tepi2,'montage');
   %% Crop and Resize Image
   cropImg = imcrop(tepi,[90.5 120 95 155]);
   figure,imshow(cropImg),title('Filter');

   %% Sharp Image
   Gablok=[89.5 107.5 92 149]
   Potong=[93.5 94.5 86 162]
   Sorenan=[98.5 101.5 92 155]
%    biner2 = threshBiner(cropImg,180);
   
end