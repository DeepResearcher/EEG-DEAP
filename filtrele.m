function [filteredData] = filtrele(eegData, srate, band)
% Input parameters:
%   eegData is a 3D matrix numChannels x numTimePoints x numTrials
%   srate is the sampling rate of the EEG data
%   filtSpec is the filter specification to filter the EEG signal in the
%     desired frequency band of interest. It is a structure with two
%     fields, order and range. 
%       Range specifies the limits of the frequency
%     band, for example, put filtSpec.range = [35 45] for gamma band.
%       Specify the order of the FIR filter in filtSpec.order. A useful
%     rule of thumb can be to include about 4 to 5 cycles of the desired
%     signal. For example, filtSpec.order = 50 for eeg data sampled at
%     500 Hz corresponds to 100 ms and contains ~4 cycles of gamma band
%     (40 Hz).
%
%--------------------------------------------------------------------------
% Example: Consider a 28 channel EEG data sampled @ 500 Hz with 231 trials,
% where each trial lasts for 2 seconds (500x2=1000). 
% You are required to plot the phase
% locking value in the gamma band between channels Fz (17) and Oz (20) for
% two conditions (say, attend and ignore). Below is an example of how to
% use this function.
%
%   eegData = rand(28, 1000, 231); 
%   srate = 500; %Hz
%   filtSpec.order = 50;
%   filtSpec.range = [35 45]; %Hz
%

switch band
    case 'Alpha'
        filtSpec.order = round(128*4*2/(8+13));  % fs=500Hz için 50
        filtSpec.range = [8 13];      % alfa
    case 'Beta'
        filtSpec.order = round(128*4*2/(13+30));  % fs=500Hz için 50
        filtSpec.range = [13 30];      % beta
    case 'Gamma'
        filtSpec.order = round(128*4*2/(30+45));
        filtSpec.range = [30 45];      % gamma
end

numChannels = size(eegData, 1);
numTrials = size(eegData, 3);

filtPts = fir1(filtSpec.order, 2/srate*filtSpec.range);
filteredData = filter(filtPts, 1, eegData, [], 2);
return;