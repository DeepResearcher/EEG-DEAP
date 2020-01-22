function [fv_Statis] = Statistics(veri)
ornek=size(veri,2);
tmpKanal=veri.data;
kanal=size(tmpKanal,1);
sure=size(tmpKanal,2);

fv_Statis=zeros(0);
for i=1:1:ornek
    DATA = veri(i).data;
    pow=0;
    stadev=0;
    Fst=0;
    Frst=0;
    Snd=0;
    Scnd=0;
    NormFrst=0;
    NormScnd=0;
    Stat=zeros(0);
    % STATISTICS CALCULATING %
    
   
	for j=1:1:kanal 
        Ort = mean(DATA(j));
		for k=1:1:sure-2
           pow = pow + (abs(DATA(j,k))^2); 
		   stadev = stadev + (DATA(j,k) - Ort^2); 
		   Fst = Fst + abs(DATA(j,k+1) - DATA(j,k)); 
           Snd = Snd + abs((DATA(j,k+2) - DATA(j,k)));
		end
		st = Fst + abs(DATA(j,sure) - DATA(j,sure-1));
		for k=sure-2:1:sure
           pow = pow + (abs(DATA(j,k))^2);
		   stadev = stadev + (DATA(j,k) - Ort^2);
        end
		Frst = Fst / (sure-1);
		NormFrst = Frst / stadev; 
		Scnd = Snd / (sure-2);
		NormScnd = Scnd / stadev;  
        % STATISTICS CALCULATED %		
		Stat = [Stat pow]; %POWER
		Stat = [Stat Ort]; %MEAN
		Stat = [Stat stadev]; %STANDART DEVIATION
		Stat = [Stat Frst]; %FIRST DIFFERENCE
		Stat = [Stat NormFrst]; %NORMALIZED FIRST DIFFERENCE
		Stat = [Stat Scnd]; %SECOND DIFFERENCE
		Stat = [Stat NormScnd]; %NORMALIZED SECOND DIFFERENCE
    end

	fv_Statis(i,:) = Stat;
end
%save('C:\Users\serha\Desktop\makine_ogrenmesi_proje\fv_Statistics314.mat','fv_Statis','-v7.3');
