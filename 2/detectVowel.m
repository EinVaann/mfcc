function DetectedVowel = detectVowel(filename,huanluyen)
[y,fs] = audioread(filename);
StableSignal = getStableSignal(y,fs);
mfccVectors = v_melcepst(StableSignal, fs, 'E', 12, floor(3*log(fs)), 0.03*fs, 0.01*fs);
mfccVector = mean(mfccVectors);
min = Inf;
for i = 1:length(huanluyen)
   [m,~] = size(huanluyen{i});
   for j = 1:m
       distance = sum((mfccVector-huanluyen{i}(j,:)).^2);
       if(distance<min)
            min = distance;
            DetectedVowel = i;
       end
   end
end