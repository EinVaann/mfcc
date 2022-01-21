function DetectedVowel = detectVowel(vector,huanluyen)
% [y,fs] = audioread(filename);
% StableSignal = getStableSignal(y,fs);
% NumCoeffs = 13;
% mfccVectors = v_melcepst(StableSignal, fs, 'E', NumCoeffs-1, floor(3*log(fs)), 0.03*fs, 0.01*fs);
% mfccVector = mean(mfccVectors);
min = Inf;
for i = 1:length(huanluyen)
   [m,~] = size(huanluyen{i});
   for j = 1:m
       distance = sum((vector-huanluyen{i}(j,:)).^2);
       if(distance<min)
            min = distance;
            DetectedVowel = i;
       end
   end
end