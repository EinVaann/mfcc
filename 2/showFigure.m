function showFigure(filename)

figure('Name',filename);
[y,fs] = audioread(filename);
subplot(311);
plotSignalinTime(y,fs);

UV = getUV(y,fs);

frameSizeT = 0.025;
frameSizeS = round(frameSizeT * fs);
shiftingSizeT = 0.01;
shiftingSizeS = round(shiftingSizeT*fs);
left = 0;
right = 0;
for index=2:length(UV)
    if((UV(index)~=UV(index-1)))
        if left == 0
            left = index;
        else
            right = index;
        end
    end
end
left = left*shiftingSizeS;
right = right*shiftingSizeS;
cutY = y(left:right);
cutYsize = length(cutY);
cutY = cutY(round(cutYsize/3):round(cutYsize/3*2));
subplot(312);
plot(cutY);

MfccVectors = v_melcepst(cutY, fs, 'E', 12, floor(3*log(fs)), 0.03*fs, 0.01*fs);
mfccc = mean(MfccVectors);
subplot(313);
plot(mfccc);
