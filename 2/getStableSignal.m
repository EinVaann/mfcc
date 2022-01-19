function StableSignal = getStableSignal(y,fs)

frameSizeT = 0.025;
shiftingSizeT = 0.01;

frameSizeS = round(frameSizeT * fs);
shiftingSizeS = round(shiftingSizeT*fs);

UV = getUV(y,fs,frameSizeS,shiftingSizeS);
startSample = 0;
endSample = 0;
for index=2:length(UV)
    if((UV(index)~=UV(index-1)))
        if startSample == 0
            startSample = index;
        else
            endSample = index;
        end
    end
end
startSample = startSample*shiftingSizeS;
endSample = endSample*shiftingSizeS;
StableSignal = y(startSample:endSample);
StableLength = length(StableSignal);
StableSignal = StableSignal(round(StableLength/3):round(StableLength/3*2));
