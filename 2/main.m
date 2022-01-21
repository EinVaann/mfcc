clear
clc

% s1 = 0;
% for l = 1:10
huanluyen = getFileHL();
confusionMatrix = checking(huanluyen)
correctRate = getCorrectRate(confusionMatrix)
%     s1 = s1+percentage;
% end
% rate = s1/10