function [Alpha,Beta,Gamma] = FiltreUygula(veri)
Subject = size(veri,2);
for i=1:Subject
    sinyal = veri(i).data0;
    AlphaVeri=filtrele(sinyal,256,'Alpha');
    BetaVeri=filtrele(sinyal,256,'Beta');
    GammaVeri=filtrele(sinyal,256,'Gamma');
    
    Alpha(i).data = AlphaVeri;
    Beta(i).data = BetaVeri;
    Gamma(i).data = GammaVeri;
end


end

