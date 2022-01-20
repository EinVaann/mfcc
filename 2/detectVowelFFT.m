function DetectedVowel = detectVowelFFT(filename,huanluyen)
[y,fs] = audioread(filename);
StableSignal = getStableSignal(y,fs);
% mfccVectors = v_melcepst(StableSignal, fs, 'E', 12, floor(3*log(fs)), 0.03*fs, 0.01*fs);
% mfccVector = mean(mfccVectors);
FFTVector=callFFT(StableSignal,fs,0.03,0.01);
min = Inf;
for i = 1:length(huanluyen)
   [m,~] = size(huanluyen{i});
   for j = 1:m
       distance = sum((FFTVector-huanluyen{i}(j,:)).^2);
       if(distance<min)
            min = distance;
            DetectedVowel = i;
       end
   end
end