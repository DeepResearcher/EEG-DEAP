function [HHT_Sonuc] = HHT(HHT)
Subject = size(HHT,2);
for i = 1:Subject
     cikti = memd(HHT(i).data);
     HHT_Sonuc(i).data = cikti;
end
end

