clc,clear all,close all

%% Basit convolution işlemi
matris=rand(5);
kernel = [1 1 1;0 2 0; -1 -1 -1];
for i=1:size(matris,1)-size(kernel,1)+1
    for j=1:size(matris,2)-size(kernel,2)+1
        parca = matris(i:i+size(kernel,1)-1,j:j+size(kernel,2)-1);
        deger(i,j)=sum(sum(parca.*kernel));
    end
end
%% Alex convolution
kernel=round(rand(11));
input=round(rand(227,227).*255);
stride=4; %% Zıplama Değeri
satir=1
for i=1:stride:size(input,1)-size(kernel,1)+1
    sutun=1;
    for j=1:stride:size(input,2)-size(kernel,2)+1
        parca=input(i:i+size(kernel,1)-1,j:j+size(kernel,2)-1);
        alex_degeri(satir,sutun)=sum(sum(parca.*kernel));
        sutun=sutun+1;
    end
    satir=satir+1;
end
%% Normalizasyon örneği

dizi = round(rand(1,5000)*10^5);
ortanca = median(dizi)
uzaklik = sqrt(dizi.^2+ortanca.^2);
% Normalize et
ndizi=(dizi-min(dizi))/(max(dizi)-min(dizi));
ortanca1=median(ndizi);
uzaklik1=sqrt(ndizi.^2+ortanca1.^2);
%% Alex pooling
poolsize=3;
stride=2;
r=1;
for i=1:stride:size(alex_degeri,1)-poolsize+1
    c=1
    for j=1:stride:size(alex_degeri,2)-poolsize+1
        parca=alex_degeri(i:i+poolsize-1,j:j+poolsize-1);
        cikti(r,c) = max(max(parca));
        c = c + 1;
    end
    r = r + 1;
end

    