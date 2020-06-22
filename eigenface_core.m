% SERBOI FLOREA-DAN GRUPA 315CB
function [m A eigenfaces pr_img] = eigenface_core(database_path)
  % citim prima imagine doar pentru a face rost de dimensiune
  image_path = strcat(database_path,'/1.jpg');
  image_matrix = double(rgb2gray(imread(image_path)));
  [n] = length(image_matrix);
  % initializam matricea T
  T = zeros(n*n, 10);
  % construim matricea T, dupa matricea fiecarei imagini
  for i = 1 : 10
    image_path = strcat(database_path,'/',int2str(i),'.jpg');
    image_matrix = double(rgb2gray(imread(image_path)));
    for k = 1 : n
      for j = 1 : n
        T((k-1)*n+j, i) = image_matrix(k,j);
      endfor
    endfor
  endfor
  % calculam media pentru fiecare linie din T
  m = zeros(n*n, 1);
  for i = 1 : n*n
    s = 0;
    for j = 1 : 10
      s = s + T(i, j);
    endfor
    m(i) = s/10;
  endfor
  % calculam A, V, eigenfaces si pr_img
  A = T - m;
  [V, D] = eig(A'*A);
  l = length(D);
  V2=[];
  for i = 1 : l
    if D(i,i) > 1
      V2 = [V2, V(:,i)];
    endif
  endfor
  eigenfaces = A*V2; 
  pr_img = eigenfaces'*A;
endfunction