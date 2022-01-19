function showFigure(filename)

figure('Name',filename);

[y,fs] = audioread(filename);
subplot(311);
plotSignalinTime(y,fs);

StableSignal = getStableSignal(y,fs);
subplot(312);
plot(StableSignal);

coeffsNum = 13;
clusterNum  = 2;

mfccVectors = v_melcepst(StableSignal, fs, 'E', coeffsNum - 1, floor(3*log(fs)), 0.03*fs, 0.01*fs);
centralVector = v_kmeans(mfccVectors,clusterNum);
subplot(313);
plot(centralVector.');
mfc = mean(mfccVectors);
hold on
plot(mfc,'r');
