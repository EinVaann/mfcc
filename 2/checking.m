function confusionMatr = checking(huanluyen)
 path='NguyenAmKiemThu';
    
    people= {'23MTL' '24FTL' '25MLM' '27MCM' '28MVN' '29MHN' '30FTN' '32MTP' '33MHP' '34MQP' '35MMQ' '36MAQ' '37MDS' '38MDS' '39MTS' '40MHS' '41MVS' '42FQT' '43MNT' '44MTT' '45MDV'};
    vowel = {'a' 'e' 'i' 'o' 'u'};
    %ma tran nham lan
    confusionMatr = zeros(5,5);
    NumCoeffs = 13;
    for j = 1: length(vowel)
        for i = 1 : length(people)
           filename = append(path,'\',people{i},'\',vowel{j},'.wav');
             [y,fs] = audioread(filename);
           StableSignal = getStableSignal(y,fs);
           mfccVectors = v_melcepst(StableSignal, fs, 'E', NumCoeffs-1, floor(3*log(fs)), 0.03*fs, 0.01*fs);
           mfccVector = mean(mfccVectors);
           detectedVowel = detectVowel(mfccVector,huanluyen);
           confusionMatr(j,detectedVowel) = confusionMatr(j,detectedVowel)+1;
        end
    end
