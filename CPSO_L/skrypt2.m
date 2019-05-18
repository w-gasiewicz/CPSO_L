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

