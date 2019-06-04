%imadjust(f,[low_in,heigh_in],[low_out,heigh_out],gamma)
%[low_in,heigh_in]->[low_out,heigh_out]
I = imread('pic.jpg');
I = rgb2gray(I);
I2 = medfilt2(I);
%medfilt2 filter
figure('Name','Standardowy obrazek');
subplot(2,2,1),imshow(I);
subplot(2,2,2), imhist(I);
subplot(2,2,3),imshow(I2);
subplot(2,2,4), imhist(I2);

%negative image
Negative = imadjust(I,[0,1],[1,0]); %-> Negative = imcomplement(I);
%Negative=imadjust(I,[0,1],[0,1],2);
%Negative=imadjust(I,[0.5,0.75],[0,1]);
%Negative=imadjust(I,stretchlim(I),[0,1]);

figure('Name','Negatyw obrazka');
subplot(2,2,1),imshow(I);
subplot(2,2,2), imhist(I);
subplot(2,2,3),imshow(Negative);
subplot(2,2,4), imhist(Negative);

%Filter=imfilter(I,[-1 0 1],'replicate');
Filter=imfilter(I,[-1 0 1],'conv','replicate');
%Filter=imfilter(I,rot90([-1 0 1],2),'replicate');

figure('Name','Filtry');
subplot(2,2,1),imshow(I);
subplot(2,2,2), imhist(I);
subplot(2,2,3),imshow(Filter);
subplot(2,2,4), imhist(Filter);

figure('Name','Filtry');
w=fspecial('laplacian',0)
g1=imfilter(f,w,'replicate');
subplot(2,2,1);
imshow(g1,[]);

w=fspecial('average', 50);
g1=imfilter(f,w,'replicate');
subplot(2,2,2);
imshow(g1,[]);


f2=double(f);
g2=imfilter(f2,w,'replicate');
subplot(2,2,3);
imshow(g2,[]);

subplot(2,2,4);
g=f2-g2;
imshow(g);
 
 figure('Name','Filtry');
w4=fspecial('laplacian',0);
w8=[1 1 1 ; 1 -8 1 ; 1 1 1];
f1=double(f);
g4=f1-imfilter(f1,w4,'replicate');
g8=f1-imfilter(f1,w8,'replicate');

subplot(2,2,1);
imshow(g4);

subplot(2,2,2);
imshow(g8);

fn=imnoise(f, 'salt & pepper', 0.02);
subplot(2,2,3);
imshow(fn);
