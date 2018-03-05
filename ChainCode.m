function  [chain table tepiBiner] = ChainCode(mb)
% mb refers to one bw with the boundaries of one object 
% chain is the ordered list of chaincode sigma for the boundaries
    %on the first two columns are the variation on x and y axis to the previsous point
    % 3rd column contains the chaincode
% table is the frequency of the orientations
% @Jorge Pereira, Instituto de Telecomunicações
    %2014, all rights reserved
 
    % object centroid
[z,num]=bwlabel(mb,8);
CC = bwconncomp(mb, 8);
rem=regionprops(CC,z,'all');
f1=round(rem(1).Centroid); 

% certify that the image only contains the border pixels
mb = boundaries (mb);
tepiBiner = mb;

% getting the first pixel 
[x1 y1]=size(mb);
mb2=zeros(x1+2,y1+2);
mb2(2:(end-1),2:end-1)=mb;
mb=mb2;
c=[f1(1,1) f1(1,2)];
for i=f1(1,2):y1
    if mb(f1(1,1),i)==1
    sy=i;
    sx=f1(1,1);
    
    end;
end;


check=0;
mbfinal=mb;
mbfinal(sx,sy)=1;
i=0;
sx1=sx;
sy1=sy;

%% computing the chaincode

while 1

if sx==sx1 & sy==sy1 & i>0
   % break;
 end;

 mbcheck=zeros(x1,y1);


 mbcheck(sx-1:sx+1,sy-1:sy+1)=mbfinal(sx-1:sx+1,sy-1:sy+1);
 [a b]=find(mbcheck==1);
if isempty(a)==1
   break;
end;
 rx=sx-a(1);
 ry=sy-b(1);
 i=i+1;
 chain(i,1)=rx;
 chain(i,2)=ry;
 
 if rx==-1 & ry==0
 chain(i,3)=6;
 end;
 if rx==-1 & ry==1
 chain(i,3)=5;
 end;
 if rx==0 & ry==1
 chain(i,3)=4;
 end;
 if rx==1 & ry==1
 chain(i,3)=3;
 end;
 if rx==1 & ry==0
 chain(i,3)=2;
 end;
 if rx==1 & ry==-1
 chain(i,3)=1;
 end;
 if rx==0 & ry==-1
 chain(i,3)=0;
 end;
 if rx==-1 & ry==-1
 chain(i,3)=7;
 end;
 
 if a(1)==sx1 & b(1)==sy1 & i==1
     a(1)=a(2);
     b(1)=b(2);
 end;
 sx=a(1);
 sy=b(1);
  
 mbfinal(sx,sy)=0; 
 xy(i,1)=sx-1;
 xy(i,2)=sy-1;


end;

% build up the frequency table
for i=0:7
nr=length(find(chain(:,3)==i));
table(i+1,1)=i;
table(i+1,2)=nr;
end;

