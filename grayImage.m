function [GrayImg] = grayImage(Img,ket)
%GRAYIMAGE Summary of this function goes here
%   Detailed explanation goes here
    if nargin<2
        ket = 'langsung';
    end

    RedImg      = Img(:,:,1);
    GreenImg    = Img(:,:,2);
    BlueImg     = Img(:,:,3);
    
    if isequal(ket,'manual')
        GrayImg = (RedImg+GreenImg+BlueImg)/3;
    elseif isequal(ket,'rumus')
        GrayImg = uint8(0.2989*double(RedImg)+...
                        0.5879*double(GreenImg)+...
                        0.1141*double(BlueImg));
    elseif isequal(ket,'langsung')
        GrayImg = rgb2gray(Img);
    end
end

