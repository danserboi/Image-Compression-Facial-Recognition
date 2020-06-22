% SERBOI FLOREA-DAN GRUPA 315CB
function [A_k S] = task3(image, k)
  % citim matricea corespunzatoare imaginii
  A = double(imread(image));
  % extragem dimensiunile lui A
  [m n] = size(A); 
  % calculam media pentru fiecare linie dupa care o scadem din fiecare element
  miu = zeros(m,1);
  for i = 1 : m
    s = 0;
    for j = 1 : n
      s = s + A(i,j);
    endfor
    miu(i,1)=s/n;
  endfor
  for i = 1 : m
    A(i,:) = A(i,:) - miu(i,1);
  endfor
  % construim matricea Z
  Z = A'/sqrt(n-1);
  % efectuam DVS asupra lui Z 
  [U,S,V] = svd(Z);
  % calculam spatiul k-dimensional al componentelor principale
  W=V(:,1:k);
  % calculam proiectia lui A in spatiul componentelor principale
  Y=W'*A;
  % aproximam matricea initiala
  A_k = W*Y + miu;
endfunction
