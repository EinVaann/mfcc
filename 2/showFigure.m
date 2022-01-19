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

% frameNumber = round((length(cutY)-frameSizeS+shiftingSizeS)/shiftingSizeS);
% 
% startFrame = 1;
% M = cell(frameNumber,1);
% for index = 1:frameNumber
%     %Lấy khung
%     endFrame = min(startFrame + frameSizeS,length(cutY));
%     frame = cutY(startFrame:endFrame);
%     
%     frame1 = frame.*hamming(length(frame),'periodic');
%     S = abs(fft(frame1,1024));
%     [coeffs,delta,deltadelta,loc] = mfcc(S,fs,'LogEnergy','Ignore','NumCoeffs',39);
%     M{index} = coeffs;
%     startFrame = startFrame + shiftingSizeS;
% end
% Sum = zeros(size(M{1}));
% for i = 1:frameNumber
%     Sum = Sum + M{i};
% end
% Sum = Sum./frameNumber;
% cutY1 = cutY.*hamming(length(cutY),'periodic');
% S = abs(fft(cutY1,1024));

MfccVectors = v_melcepst(cutY, fs, 'E', 12, floor(3*log(fs)), 0.03*fs, 0.01*fs);

subplot(313);
plot(MfccVectors);
% [m,n] = size(Sum);
% mm = 1:m;
% nn = 1:n;
% surf(nn,mm,Sum,'EdgeColor', 'none');
% colormap(jet); view(0,90);
