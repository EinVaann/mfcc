function StableSignal = getStableSignal(y,fs)

frameSizeT = 0.025;
shiftingSizeT = 0.01;

frameSizeS = round(frameSizeT * fs);
shiftingSizeS = round(shiftingSizeT*fs);

UV = getUV(y,fs,frameSizeS,shiftingSizeS);
startSample = 1;
endSample = length(UV);
for index=2:length(UV)
    if((UV(index)>UV(index-1)) && startSample == 1)
            startSample = index;
    else
            if ((UV(index)<UV(index-1)) && endSample == length(UV))
                endSample = index;
            end
    end
end
startSample = startSample*shiftingSizeS;
endSample = endSample*shiftingSizeS;
StableSignal = y(startSample:endSample);

StableLength = length(StableSignal);
StableSignal = StableSignal(round(StableLength/3):round(StableLength/3*2));
