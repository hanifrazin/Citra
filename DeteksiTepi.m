function [Out_Edge] = DeteksiTepi(Img,ket)
%DETEKSITEPI Summary of this function goes here
%   Detailed explanation goes here
    
    if isequal(ket,'roberts')
        Gx = [1 0;0 -1];
        Gy = [0 1;-1 0];
        Ix = conv2(double(Img),double(Gx),'same');
        Iy = conv2(double(Img),double(Gy),'same');
        Out_Edge = sqrt(Ix.^2+Iy.^2);
    elseif isequal(ket,'sobel')
        Gx = [-1 0 1;-2 0 2;-1 0 1];
        Gy = [-1 -2 -1;0 0 0;1 2 1];
        Ix = conv2(double(Img),double(Gx),'same');
        Iy = conv2(double(Img),double(Gy),'same');
        Out_Edge = sqrt(Ix.^2+Iy.^2);
    elseif isequal(ket,'prewitt')
        Gx = [-1 0 1;-1 0 1;-1 0 1];
        Gy = [-1 -1 -1;0 0 0;1 1 1];
        Ix = conv2(double(Img),double(Gx),'same');
        Iy = conv2(double(Img),double(Gy),'same');
        Out_Edge = sqrt(Ix.^2+Iy.^2);
    elseif isequal(ket,'laplace')
        G = [-1 -1 -1;
             -1 8 -1;
             -1 -1 -1];
        Out_Edge = conv2(double(Img),double(G),'same');
    elseif isequal(ket,'log')
%         G = [0 0 -1 0 0;
%              0 -1 -2 -1 0;
%              -1 -2 16 -2 -1;
%              0 -1 -2 -1 0;
%              0 0 -1 0 0];
%         Out_Edge = conv2(double(Img),double(G),'same');
        Out_Edge = edge(Img,ket);
    elseif isequal(ket,'kirsch')
        W = [5 -3 -3;5 0 -3;5 -3 -3];
        NW = [5 5 -3;5 0 -3;-3 -3 -3];
        N = [5 5 5;-3 0 -3;-3 -3 -3];
        NE = [-3 5 5;-3 0 5;-3 -3 -3];
        SW = [-3 -3 -3;5 0 -3;5 5 -3];
        S = [-3 -3 -3;-3 0 -3;5 5 5];
        SE = [-3 -3 -3;-3 0 5;-3 5 5];
        E = [-3 -3 5;-3 0 5;-3 -3 5];
        
        KirschW = conv2(double(Img),double(W));
        KirschNW = conv2(double(Img),double(NW));
        KirschN = conv2(double(Img),double(N));
        KirschNE = conv2(double(Img),double(NE));
        KirschSW = conv2(double(Img),double(SW));
        KirschS = conv2(double(Img),double(S));
        KirschSE = conv2(double(Img),double(SE));
        KirschE = conv2(double(Img),double(E));
        
        Kirsch1 = max(KirschW,max(KirschNW,max(KirschN,KirschNE)));
        Kirsch2 = max(KirschSW,max(KirschS,max(KirschSE,KirschE)));
        Out_Edge = max(Kirsch1,Kirsch2);
    elseif isequal(ket,'canny')
        Out_Edge = edge(Img,ket);
    end
    figure,
    subplot(1,2,1),imshow(uint8(Img)),title('Citra Grayscale');
    subplot(1,2,2),imshow(uint8(Out_Edge)),title(['Citra Hasil Edge Detection ',ket]);
end

