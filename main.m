%% Yol = Veri stinin yolunu tutan deðisken,
%% Burada deðiþtiriniz :
%% 1.) Adým EEG Bantlarýna Ayýrma => Alpha , Beta , Gamma.
Yol = "C:\Users\serha\Desktop\DeapDataset Calismasi\DB_DEAP_MARA.mat";
load(Yol);
mkdir ('Sonuclar');
cd 'C:\Users\serha\Desktop\DeapDataset Calismasi\Algoritmalar' ;
[Alpha,Beta,Gamma] = FiltreUygula(veriDEAPMARA);
%% Bu Adýmdan sonra Alpha , Beta ve Gamma'yý Sonuclar klasörüne kaydediyoruz
%% Birinci Adým Tamamlandý.
------------------------------------------------------------------------------
%% 2.) Adým => Özniteliklerin çýkarýlmasý ve Normalizasyon
%% Time Features:  (Alpha Beta Gamma)
cd 'C:\Users\serha\Desktop\DeapDataset Calismasi\Sonuclar' ;
load(Alpha.mat);
load(Beta.mat);
load(Gamma.mat);
cd 'C:\Users\serha\Desktop\DeapDataset Calismasi\Algoritmalar' ;
Time_Features_Alpha = [ zscore(HJRTH(Alpha)) zscore(Statistics(Alpha)) ];
Time_Features_Beta = [ zscore(HJRTH(Beta)) zscore(Statistics(Beta)) ];
Time_Features_Gamma = [ zscore(HJRTH(Gamma)) zscore(Statistics(Gamma)) ];

%% Frequency Features:  (Alpha Beta Gamma)
Frequency_Features_Alpha = [ zscore(STFTransform(Alpha)) zscore(Welch(Alpha)) ];
Frequency_Features_Beta = [ zscore(STFTransform(Beta)) zscore(Welch(Beta)) ];
Frequency_Features_Gamma = [ zscore(STFTransform(Gamma)) zscore(Welch(Gamma)) ];

%% Time - Frequency Features: (Alpha Beta Gamma)
HHT_Alpha = HHT(Alpha);
HHT_Beta = HHT(Beta);
HHT_Gamma = HHT(Gamma);

Time_Frequency_Alpha = [ zscore(WT_numeric(Alpha)) zscore(HJRTH(HHT_Alpha)) zscore(Statistics(HHT_Alpha)) zscore(WT_numeric(HHT_Alpha)) ];
Time_Frequency_Beta = [ zscore(WT_numeric(Beta)) zscore(HJRTH(HHT_Beta)) zscore(Statistics(HHT_Beta)) zscore(WT_numeric(HHT_Beta)) ];
Time_Frequency_Gamma = [ zscore(WT_numeric(Gamma)) zscore(HJRTH(HHT_Gamma)) zscore(Statistics(HHT_Gamma)) zscore(WT_numeric(HHT_Gamma)) ];

%% 3.) Adým : 
%% Binary Deðerlerin Hesaplanmasý => V - A - D
Valence = zeros(1280,1);
for i = 1 : 1280
    deger(i,1) = veriDEAPMARA(i).valence;
    valence = deger(i,1);
    if(valence <= 0.5)
        Valence(i,1) = 0; 
    else 
        Valence(i,1) = 1;
    end
end

Arousal = zeros(1280,1);
for i = 1 : 1280
    deger(i,1) = veriDEAPMARA(i).arousal;
    arousal = deger(i,1);
    if(arousal <= 0.5)
        Arousal(i,1) = 0; 
    else 
        Arousal(i,1) = 1;
    end
end

Dominance = zeros(1280,1);
for i = 1 : 1280
    deger(i,1) = veriDEAPMARA(i).dominance;
    dominance = deger(i,1);
    if(dominance <= 0.5)
        Dominance(i,1) = 0; 
    else 
        Dominance(i,1) = 1;
    end
end

%% Binary Deðerleri Matrise Burada Ekliyoruz : 
%% Frequency Features With Nominal :

Frequency_Features_Alpha = [ Frequency_Features_Alpha Valence ];
Frequency_Features_Beta = [ Frequency_Features_Beta Valence ];
Frequency_Features_Gamma = [ Frequency_Features_Gamma Valence ];

Frequency_Features_Alpha = [ Frequency_Features_Alpha Arousal ];
Frequency_Features_Beta = [ Frequency_Features_Beta Arousal ];
Frequency_Features_Gamma = [ Frequency_Features_Gamma Arousal ];

Frequency_Features_Alpha = [ Frequency_Features_Alpha Dominance ];
Frequency_Features_Beta = [ Frequency_Features_Beta Dominance ];
Frequency_Features_Gamma = [ Frequency_Features_Gamma Dominance ];

%% Time Features With Nominal : 

Time_Features_Alpha = [ Time_Features_Alpha Valence ];
Time_Features_Beta = [ Time_Features_Beta Valence ];
Time_Features_Gamma = [ Time_Features_Gamma Valence ];

Time_Features_Alpha = [ Time_Features_Alpha Arousal ];
Time_Features_Beta = [ Time_Features_Beta Arousal ];
Time_Features_Gamma = [ Time_Features_Gamma Arousal ];

Time_Features_Alpha = [ Time_Features_Alpha Dominance ];
Time_Features_Beta = [ Time_Features_Beta Dominance ];
Time_Features_Gamma = [ Time_Features_Gamma Dominance ];

%% Time - Frequency Features With Nominal :

Time_Frequency_Alpha = [ Time_Frequency_Alpha Valence ];
Time_Frequency_Beta = [ Time_Frequency_Beta Valence ];
Time_Frequency_Gamma = [ Time_Frequency_Gamma Valence ];

Time_Frequency_Alpha = [ Time_Frequency_Alpha Arousal ];
Time_Frequency_Beta = [ Time_Frequency_Beta Arousal ];
Time_Frequency_Gamma = [ Time_Frequency_Gamma Arousal ];

Time_Frequency_Alpha = [ Time_Frequency_Alpha Dominance ];
Time_Frequency_Beta = [ Time_Frequency_Beta Dominance ];
Time_Frequency_Gamma = [ Time_Frequency_Gamma Dominance ];


