function mfccVector = calMfcc(StableSignal,fs)
mfccVectors = v_melcepst(StableSignal, fs, 'E', 12, floor(3*log(fs)), 0.03*fs, 0.01*fs);
mfccVector = mean(mfccVectors);