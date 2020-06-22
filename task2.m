% SERBOI FLOREA-DAN GRUPA 315CB
function task2(image)
  % citim matricea corespunzatoare imaginii
  A = double(imread(image));
  % extragem dimensiunile lui A
  [m n] = size(A);  
  
  % efectuam DVS asupra lui A si reprezentam grafic valorile singulare
  [U,S,V] = svd(A);
  valori_singulare = diag(S);
  figure(1);
  plot(valori_singulare);
  
  k = [1:19 20:20:99 100:30:min(m,n)];
  
  % reprezentam grafic k si informatia data de primele k valori singulare
  s = 0;
  suma_k = zeros(1, min(m,n));
  % in suma_k tinem minte suma primilor k termeni, cu k de la 1 la min(m,n)
  for i = 1 : min(m,n)
    s = s + valori_singulare(i);
    suma_k(i) = s;
  endfor 
  % retinem doar valorile corespunzatoare fiecarui element din vectorul k 
  valori_k = suma_k(k);
  % impartim fiecare element la suma tuturor elementelor
  valori_k = valori_k/s;
  figure(2);
  plot(k, valori_k);
  
  % reprezentam grafic k si eroarea aproximarii pentru A
  er_ap_k = length(k);
  for l = 1 : length(k)
    A_k = task1(image, k(l));
    dif = 0;
    for i = 1 : m
      for j = 1 : n
        dif = dif + (A(i,j) - A_k(i,j))^2;
      endfor
    endfor
    er_ap_k(l) = dif/(m*n);
  endfor
  figure(3);
  plot(k, er_ap_k);
  
  % reprezentam grafic k si rata de compresie a datelor
  rata_compr_k = zeros(length(k));
  for l = 1 : length(k)
    rata_compr_k(l) = (m*k(l) + n*k(l) + k(l))/(m*n);    
  endfor
  figure(4);
  plot(k, rata_compr_k);
  
endfunction