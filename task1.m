% SERBOI FLOREA-DAN GRUPA 315CB
function A_k = task1(image, k)
  % citim matricea corespunzatoare imaginii
  A = double(imread(image));
  
  % efectuam DVS asupra lui A 
  [U,S,V] = svd(A);
  
  % eliminam valorile considerate nesemnificative
  U_k = U(:,1:k);
  S_k = S(1:k,1:k);
  V_k = V(:,1:k);
  
  % rezultatul este inmultirea matricelor obtinute anterior
  A_k = U_k * S_k * V_k';
endfunction