rawImg = imread('C:\Users\¤¯¤¤\Desktop\test.png');  
   
img = double(rgb2gray(rawImg));    
  
img = img/255;  
[ linePixel] = z_lineCenterPts(img);  
  
figure(1), imshow(img);  
hold on  
plot(linePixel(:,2), linePixel(:,1), 'g.');  
hold off;  