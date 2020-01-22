function [fv_STFT, Sonuc] = STFTransform(veri)
ornek=size(veri,2);
tmpKanal=16;
kanal=size(tmpKanal,1);

fv_STFT=zeros(0);
for i=1:1:ornek
    DATA = veri(i).data;
    S=zeros(0);
    ST=zeros(0);
	for j=1:1:kanal
         % stft(x, wlen, hop, nfft, fs)
		%S = stftorj(DATA(j,:),256,64,32,128);
        windowsize = 32;
        window = hanning(windowsize);
        noverlap = windowsize-32;
        [S,F,T,P] = spectrogram(DATA(j,:),window,noverlap,32,128);
        Sonuc(j,:) = mean(P);
        

    %windowsize = 16;
    %window = hanning(windowsize);
    %nfft = windowsize;
    %noverlap = windowsize-1;
    %[ S ] = spectrogram(S,window,noverlap,nfft,fs);
        %S = stftsasas(DATA(j,:),100,50,'hamming',2.5);
      %S = stfth(S,128);
        %satir = size(S,1);
       % for k=1:1:satir
      %      ST = [ST Sonuc(k,:)];
      %  end
    end
    Sonuc1 = Sonuc;
    Sonuc1 = Sonuc1(:);
    Sonuc1 = Sonuc1.';
	fv_STFT(i,:) = Sonuc1(1,:);
end
%save('D:\Data\fv_STFT.mat','fv_STFT','-v7.3');