 I=imread('ui5.jpg') ;    % G a m m a C o rr e c t i o n
 motblurr=fspecial('motion', 15,13) ;
 blurred=imfilter(I,motblurr ,'conv','circular') ;
 imshow(blurred) ;
 imwrite(blurred,'D:\ui5GC_blurred.jpg');
 figure ;
 I = blurred ;
 J = imadjust(I , [ ] , [ ] , 1.2 ) ;
 imwrite( J ,'D:\ui5GC_gammaCorrected.jpg') ;
 r = J (:,:, 1 ) ;
 g = J (:,:, 2 ) ;
 b = J (:,:, 3 ) ;
 rfiltered=imgaussfilt(r,2 ) ;
 bfiltered=imgaussfilt(b,2) ;
 gfiltered=imgaussfilt(g,2) ;
 J(:,:, 1 ) = rfiltered ;
 J(:,:, 2 ) = gfiltered ;
 J(:,:, 3 ) = bfiltered ;
 imshowpair(I,J,'montage') ;
 imwrite( J ,'D:\ui5GC_final.jpg') ;
