function [ linePixel] = z_lineCenterPts(im)   

if nargin <2   
    sigma = 8;  
end  

% ¨M©w°¾·L¤Àªº
[Dx,Dy,Dxx,Dxy,Dyy] = Hessian2D(im,sigma);
 
[eigenvalue1, eigenvalue2, eigenvectorx, eigenvectory]=eig2image(Dxx, Dxy, Dyy);  
  
%§PÂ_(px, py)¬O§_¦b[-1/2,1/2]X[-1/2,1/2]½d³ò  
t = -(Dx.*eigenvectorx + Dy .* eigenvectory) ./...  
    (Dxx .* eigenvectorx.^2 + 2*Dxy.*eigenvectorx.*eigenvectory + Dyy.*eigenvectory.^2 );  
  
px = t.*eigenvectorx;  
py = t.*eigenvectory;  
  
[candidateX1, candidateY1] = find(px >= -0.5 & px <= 0.5 & py >= -0.5 & py <= 0.5);  
  
linePixel = [candidateX1, candidateY1];   
