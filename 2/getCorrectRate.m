function correctRate = getCorrectRate(confusionMatrix)
 correctCount = 0;
 total = sum(sum(confusionMatrix));
 for i = 1:5
      correctCount = correctCount+confusionMatrix(i,i);
 end
correctRate = correctCount/total*100;