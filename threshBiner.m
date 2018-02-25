function [biner] = threshBiner(Gray_Img,thresh)
%BINERIMAGE Summary of this function goes here
%   Detailed explanation goes here
    [tinggi,lebar] = size(Gray_Img);
    biner = zeros(tinggi,lebar);
    for baris=1:tinggi
        for kolom=1:lebar
            if Gray_Img(baris,kolom)>=thresh
                biner(baris,kolom) = 1;
            else
                biner(baris,kolom) = 0;
            end
        end
    end

%     biner = not(biner);
    figure,imshow(1-biner),title('Gambar Biner');
end

