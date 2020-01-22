function [fv_HJRT] = HJRTH(veri)
ornek=size(veri,2);

fv_HJRT = zeros(0);
for i=1:1:ornek
    AMC=zeros(0);
    DATA = veri(i).data;
	[ACT MOB COM] = hjorth(transpose(DATA));
    AMC = [AMC ACT];
    AMC = [AMC MOB];
    AMC = [AMC COM];
    fv_HJRT(i,:) = AMC;
end
%save('C:\Users\serha\Desktop\makine_ogrenmesi_proje\fv_HJRT314.mat','fv_HJRT','-v7.3');