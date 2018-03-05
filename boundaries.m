function mb = boundaries (im)
%Creates a new image with the border's points
%Only works on binary images
im=im2double(im);
[B]= bwboundaries(im);
B=B{1};
[x y]=size(im);
im2=zeros(x,y);
for i=1:length(B(:,1))    
im2(B(i,1),B(i,2))=1;
end;
mb=im2;
t6=bwmorph(mb,'spur',1088888888888);

t4=bwmorph(t6,'thin',10);
t5=bwmorph(t4,'clean',1);
mb=double(t5);
mm=[0 1 0 ; 1 0 1; 0 1 0];
C = xcorr2 (mb, mm);
[aa bb]=find(C==4);
%%
for i=1:length(aa)
 ll1=length(find(mb(aa(i)-1:aa(i)+1,bb(i)-2:bb(i))>0));
    ll2=length(find(mb(aa(i)-2:aa(i),bb(i)-1:bb(i)+1)>0));
    ll3=length(find(mb(aa(i)-3:aa(i)-1,bb(i)-2:bb(i))>0));
    ll4=length(find(mb(aa(i)-2:aa(i),bb(i)-3:bb(i)-1)>0));
    
    if ll1 <4
        mb(aa(i),bb(i)-1)=0;
    end;
     if ll2 <4
        mb(aa(i)-1,bb(i))=0;
    end;
     if ll3 <4
        mb(aa(i)-2,bb(i)-1)=0;
    end;
     if ll4 <4
        mb(aa(i)-1,bb(i)-2)=0;
    end;
end;
%%
[a b]=find(mb==1);
[x y]=size(mb);
for i=1:length(a)
    if a(i)>1 & a(i)<x & b(i)>1 & b(i)<y
 n(i)=length(find(mb(a(i)-1:a(i)+1,b(i)-1:b(i)+1)==1));
  if n(i)<3
      mb(a(i),b(i))=0;
  end;
    end;
end;
%imshow(mb);

