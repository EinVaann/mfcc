function showFigure(filename)

figure('Name',filename);
[y,fs] = audioread(filename);
subplot(311);
plotSignalinTime(y,fs);

StableSignal = getStableSignal(y,fs);
subplot(312);
plot(StableSignal);

mfccVector = calMfcc(StableSignal,fs);
[centralVector] = v_kmeans(mfccVector,5);
subplot(313);
plot(centralVector);
