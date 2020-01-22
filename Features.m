function [ Time_Frequency_Features, Time_Features, Frequency_Features, Fusion_Features ] = Features(Hht,veri,Nominal)

 for i = 1:330
% cikti = memd(Alpha(i).data);
% % A = cikti(:,1:4,:);
% % x= A(:).';
% % Hht_matris(i,:) = x;
% Hht(i).data = cikti(:,1:4,:);
 Hht(i).data = Hht(i).data(:,:);
 end


Wavelet = WT_numeric(veri);
Wavelet_hht = WT_numeric(Hht);
Stat_hht = Statistics(Hht);
Hjrth_hht = HJRTH(Hht);
Hht_Wave_TF_N = [ zscore(Wavelet_hht) zscore(Wavelet) zscore(Hjrth_hht) zscore(Stat_hht) ]; 
Fusion_tf = Hht_Wave_TF_N;
Time_Frequency_Features = [ Hht_Wave_TF_N Nominal ];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Stat = Statistics(veri);
Hjrth = HJRTH(veri);

Time_Features = [ zscore(Stat) zscore(Hjrth) ];
Fusion_time = Time_Features;
Time_Features = [ Time_Features Nominal ];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Stft = STFTransform(veri);
welch = Welch(veri);

Frequency_Features = [ zscore(Stft) zscore(welch) ];
Fusion_freq = Frequency_Features;
Frequency_Features = [ Frequency_Features Nominal ];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Fusion_Features = [ Fusion_tf Fusion_time Fusion_freq Nominal ];


return;