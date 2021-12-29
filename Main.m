
%Arda Efe ÞEN 201611053

% Clear workspace
clear all
close all

 %Reading the images and showing the originals
Image1 = imread('./image1.jpg');
Image2 = imread('./image2.jpg');
Image3 = imread('./image3.jpg');
Image4 = imread('./image4.jpg');
subplot(2,4,1); imshow(Image1); title('Image1');
subplot(2,4,4); imshow(Image2); title('Image2');
subplot(2,4,5); imshow(Image3); title('Image3');
subplot(2,4,8); imshow(Image4); title('Image4');
figure;

%Inverting to grayscale
Imgray1 = rgb2gray(Image1);
Imgray2 = rgb2gray(Image2);
Imgray3 = rgb2gray(Image3);
Imgray4 = rgb2gray(Image4);

subplot(2,4,1); imshow(Imgray1); title('Image1');
subplot(2,4,4); imshow(Imgray2); title('Image2');
subplot(2,4,5); imshow(Imgray3); title('Image3');
subplot(2,4,8); imshow(Imgray4); title('Image4');

figure;


% Croping images for certain places
Icrop1 = imcrop(Imgray1,[50 50 250 250]);
Crophist1 = imhist(Icrop1);
Icrop2 = imcrop(Imgray2,[50 50 250 250]);
Crophist2 = imhist(Icrop2);
Icrop3 = imcrop(Imgray3,[50 50 250 250]);
Crophist3 = imhist(Icrop3);
Icrop4 = imcrop(Imgray4,[50 50 250 250]);
Crophist4 = imhist(Icrop4);

subplot(2,4,1); imshow(Icrop1); title('Cropped Image 1');
subplot(2,4,3); imhist(Icrop1); title('Hist 1');
subplot(2,4,2); imshow(Icrop2); title('Cropped Image 2');
subplot(2,4,4); imhist(Icrop2); title('Hist 2');
subplot(2,4,5); imshow(Icrop3); title('Cropped Image 3');
subplot(2,4,7); imhist(Icrop3); title('Hist 3');
subplot(2,4,6); imshow(Icrop4); title('Cropped Image 4');
subplot(2,4,8); imhist(Icrop4); title('Hist 4');


figure;

%Resizing the images
ICrop1 = imresize(Icrop1,[200 200]);
ICrop2 = imresize(Icrop2,[200,200]);
ICrop3 = imresize(Icrop3,[200,200]);
ICrop4 = imresize(Icrop4,[200,200]);

%Combining Cropped Images
CombineImg = zeros(400,400,1);
CombineImg(1:200,1:200,:)=ICrop1;
CombineImg(1:200,201:400,:)=ICrop2;
CombineImg(201:400,1:200,:)=ICrop3;
CombineImg(201:400,201:400,:)=ICrop4;
imshow(uint8(CombineImg));
title('Before Matching');
figure;

%Histgoram Matching
Ref = ICrop4;

Match1= imhistmatch(ICrop1,Ref);
Match2= imhistmatch(ICrop2,Ref);
Match3= imhistmatch(ICrop3,Ref);


MatchImg = zeros(400,400,1);
MatchImg(1:200,1:200,:)=Match1;
hist1 = imhist(Match1);
MatchImg(1:200,201:400,:)=Match2;
hist2 = imhist(Match2);
MatchImg(201:400,1:200,:)=Match3;
hist3 = imhist(Match3);
MatchImg(201:400,201:400,:)=ICrop4;
hist4 = imhist(Ref);
imshow(uint8(MatchImg));
title('After Matching');
figure;

subplot(2,4,1); imshow(Match1); title('Image 1');
subplot(2,4,3); imhist(Match1); title('Hist 1');
subplot(2,4,2); imshow(Match2); title('Image 2');
subplot(2,4,4); imhist(Match2); title('Hist 2');
subplot(2,4,5); imshow(Match3); title('Image 3');
subplot(2,4,7); imhist(Match3); title('Hist 3');
subplot(2,4,6); imshow(Ref); title('Ref Image');
subplot(2,4,8); imhist(Ref); title('Ref Hist');




 













