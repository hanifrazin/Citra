function [ t1 ] = threshIterative(Gray_Img)
%THRESHITERATIVE Summary of this function goes here
%   Detailed explanation goes here

    [m, n] = size(Gray_Img);
    Gray_Img = double(Gray_Img);
    t0 = 127;
    while true
        rata_kiri = 0;
        rata_kanan = 0;
        jum_kiri = 0;
        jum_kanan = 0;
        for i=1 : m
            for j=1 : n
                if Gray_Img(i, j) <= 127
                    rata_kiri = rata_kiri + Gray_Img(i,j);
                    jum_kiri = jum_kiri + 1;
                else
                    rata_kanan = rata_kanan + Gray_Img(i,j);
                    jum_kanan = jum_kanan + 1;
                end
            end
        end
        rata_kiri = rata_kiri / jum_kiri;
        rata_kanan = rata_kanan / jum_kanan;
        t1 = (rata_kiri + rata_kanan) / 2.0;
        if (t0 - t1) < 1
            break; % Keluar dari while
        end
    t0 = t1;
    end
    t1 = floor(t1);
end

