% SERBOI FLOREA-DAN GRUPA 315CB
function [min_dist output_img_index] = face_recognition(image_path, m, A, eigenfaces, pr_img)
  image_matrix = double(rgb2gray(imread(image_path)));
  [n] = length(image_matrix);
  T = zeros(n*n, 1);
  % construim matricea T doar pentru imaginea data
  for k = 1 : n
    for j = 1 : n
      T((k-1)*n+j, 1) = image_matrix(k,j);
    endfor
  endfor
  % construim o matrice din care scadem media
  N = zeros(n*n, 1);
  N = T - m;
  % calculam proiectia imaginii de test
  pr_img_test = eigenfaces'*N;
  % determinam cea mai mica distanta dintre proiectia imaginii de test si proiectiile obtinute anterior si retinem indicele imaginii
  min_dist = inf;
  for i = 1 : 10
    dist = norm(pr_img(:,i) - pr_img_test);
      if dist < min_dist
        min_dist = dist;
        output_img_index = i;
      endif
  endfor
endfunction