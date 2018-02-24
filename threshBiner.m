function [biner] = threshBiner(Img,thresh)
%BINERIMAGE Summary of this function goes here
%   Detailed explanation goes here
    [tinggi,lebar] = size(Img);
    biner = zeros(tinggi,lebar);
    for baris=1:tinggi
        for kolom=1:lebar
            if Img(baris,kolom)>=thresh
                biner(baris,kolom) = 1;
            else
                biner(baris,kolom) = 0;
            end
        end
    end

    biner = not(biner);
    figure,imshow(biner),title('Gambar Biner');
end

