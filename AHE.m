originalImage=imread('ui3.jpg'); %Adaptive Histogram equalization
imshow(originalImage);
motblurr=fspecial('motion',15,13);
blurred=imfilter(originalImage,motblurr,'conv','circular'); % adding artificial motion blurring
imshow(blurred);
imwrite(blurred,'D:\ui3AHE_blurred.jpeg');
originalImage=blurred;
ycbcroriginal=rgb2ycbcr(originalImage); %conversion to ycbcr space
figure;imshow(ycbcroriginal);
imwrite(ycbcroriginal,'D:\ui3AHE_ycbcr.jpeg');
ychannel=ycbcroriginal(:,:,1);
figure;imshow(ychannel);
imwrite(ychannel,'D:\ui3AHE_ycbcr_ychannel.jpeg');
ychannelafterhisteq=adapthisteq(ychannel);
figure;imshow(ychannelafterhisteq);
imwrite(ychannelafterhisteq,'D:\ui3AHE_ycbcr_ychannelafterHE.jpeg');
ycbcroriginal(:,:,1)=ychannelafterhisteq;
ycbcrafterhisteq=ycbcroriginal;
figure;imshow(ycbcrafterhisteq);
imwrite(ycbcrafterhisteq,'D:\ui3AHE_ycbcr_afterHE.jpeg') ;
rgbafterhisteq = ycbcr2rgb(ycbcrafterhisteq) ;
figure;imshow(rgbafterhisteq);
r=rgbafterhisteq(:,:,1);
g=rgbafterhisteq(:,:,2);
b=rgbafterhisteq(:,:,3);
rfiltered=imgaussfilt(r,2);
gfiltered=imgaussfilt(g,2);
bfiltered=imgaussfilt(b,2);
rgbafterhisteq(:,:,1)=rfiltered;
rgbafterhisteq(:,:,2)=gfiltered;
rgbafterhisteq(:,:,3)=bfiltered;
rgbafterfiltering=rgbafterhisteq;
figure;imshow(rgbafterhisteq);
figure;imshow(imsharpen(rgbafterfiltering));
imwrite(rgbafterfiltering,'D:\ui3AHE_final.jpeg');

