I = imread('image.jpg');
whos I

Iblure= 5*I;
whos Iblure

I2 = histeq(I);
whos I2
imwrite (I2, 'image2.jpg');
%display original and changed image with histograms
figure('Name','Standardowy obrazek i obrazek po histeq()');
subplot(2,2,1),imshow(I);
subplot(2,2,2), imhist(I);
subplot(2,2,3), imshow(I2);
subplot(2,2,4), imhist(I2);

%display scaled image
figure('Name','Przeskalowany obrazek');
subplot(2,2,1), imshow(Iblure);
subplot(2,2,2), imhist(Iblure);

m=mean2(mean2(I));

%display avarage brightness of picture
disp('Srednia jasnosc obrazka:');
disp(m);

%display contrast of picture
c=std2(I);
disp('Kontrast obrazka:');
disp(c);
disp('Roznica miedzy najciemniejszym i najjasniejszym pixelem obrazka:');
dif=(max(I(:)) - min(I(:)));
disp(dif);

%create and display images with noises
J = imnoise(I,'salt & pepper',0.02);
J2 = imnoise(I,'gaussian',0,0.01);
figure('Name','Szumy');
subplot(2,2,1), imshow(J);
subplot(2,2,2), imshow(J2);

imageinfo('image.jpg');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
IA = imadjust(I,[.2 .3 0; .6 .7 1],[]);
h = fspecial('motion', 50, 45);
filteredI = imfilter(I, h);
I=im2double(I);
replicateI = imfilter(I, h, 'replicate');
figure('Name','Imadjust i filtry');
subplot(2,2,1), imshow(IA);
subplot(2,2,2), imshow(filteredI);
subplot(2,2,3), imshow(replicateI);