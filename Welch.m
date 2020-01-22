function [fv_Welch] = Welch(veri)
ornek=size(veri,2);
tmpKanal=veri.data;
kanal=size(tmpKanal,1);

fv_Welch=zeros(0);
for i=1:1:ornek
    DATA = veri(i).data;
    wel=zeros(0);
    welc=zeros(0);
	for j=1:1:kanal
		wel = pwelch(DATA(j,:),hanning(330),[],330,256);
        satir = size(wel,1);
        for k=1:1:satir
            welc = [welc wel(k,:)];
        end
	end
	fv_Welch(i,:) = welc(1,:);
end
%save('C:\Users\serha\Desktop\makine_ogrenmesi_proje\fv_Welch314.mat','fv_Welch','-v7.3');