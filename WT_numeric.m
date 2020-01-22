%3 ayrý kategori (ses,goruntu,sesgoruntu) için Mat dosyalarýný oluþtur
function  dataWT = WT_numeric(veri)
dKanallar = 1;
dKisiler = 1:330; % 25 kisi x 15 stim(video)

dataWT=[];labelWT=[];
for kisiSayac=dKisiler
    sayac=0;
        for kanalNo=dKanallar
           sinyal = veri(kisiSayac).data(kanalNo,:);  

            [katsayilar,uzunluklar] = wavedec(sinyal,6,'coif5');

            [yaklasimE,detayE] = wenergy(katsayilar,uzunluklar);
            detayE=detayE/max(detayE);
            
            for i=1:4
                detayK=detcoef(katsayilar,uzunluklar,i); 
                sayac=sayac+1;dataWT(kisiSayac,sayac)=max(detayK);
                sayac=sayac+1;dataWT(kisiSayac,sayac)=min(detayK);
                sayac=sayac+1;dataWT(kisiSayac,sayac)=std(detayK);
                sayac=sayac+1;dataWT(kisiSayac,sayac)=mean(detayK);
                sayac=sayac+1;dataWT(kisiSayac,sayac)=detayE(i+1);
            end
            
            entropi = wentropy(sinyal,'shannon');
            sayac=sayac+1;dataWT(kisiSayac,sayac)=entropi;
        end

        
end

    %save(['F:\SonCalisma\YWavelet_A_' num2str(z) '.mat'],'dataWT');
    



end
