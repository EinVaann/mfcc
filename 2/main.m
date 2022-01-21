clear
clc

% s1 = 0;
% for l = 1:10
NumCoeffs = 13;
NumCluster = 3;
huanluyen = getFileMFCC(NumCoeffs,NumCluster);
confusionMatrix = checkingMFCC(huanluyen,NumCoeffs)
correctRate = getCorrectRate(confusionMatrix)
%     s1 = s1+percentage;
% end
% rate = s1/10