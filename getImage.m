%% Clear Command Window, Clear Workspace, Close Editor
clc;
clear all;
close all;

%% Get Image
[filename, pathname] = uigetfile({'*.jpg';'*.png';'.tif';'.tiff';'.gif'},'Pilih Gambar');
if isequal(filename,0)
   disp('User selected Cancel')
else
   disp(sprintf('User selected %s',filename))
   
   %% Read image
   X = fullfile(pathname,filename);
   Img = imread(X);
   
end