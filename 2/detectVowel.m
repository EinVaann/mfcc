function DetectedVowel = detectVowel(vector,huanluyen)
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