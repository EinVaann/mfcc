function plotSignalinTime(y,fs)
time = length(y)/fs;
time1 = linspace(0,time,length(y));
plot(time1,y);
xlim([0 time]);
xlabel('Thời gian(s)');
ylabel('Biên độ tín hiệu');
title('Tín hiệu');