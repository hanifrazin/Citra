function [biner] = binerImage(Img,level,ket)
%BINERIMAGE Summary of this function goes here
%   Detailed explanation goes here
    if nargin==2
        ket = 'langsung'
    elseif nargin==1
        level = 0.7;
        ket = 'langsung';
    end
    
    if isequal(ket,'langsung')
        biner = im2bw(Img,level);
    elseif isequal(ket,'threshold')
        [tinggi,lebar] = size(Img);
        biner = zeros(tinggi,lebar);
        for baris=1:tinggi
            for kolom=1:lebar
                if Img(baris,kolom)>=level
                    biner(baris,kolom) = 0;
                else
                    biner(baris,kolom) = 1;
                end
            end
        end
    end  
end

