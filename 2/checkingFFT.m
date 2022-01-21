function confusionMatr = checkingFFT(huanluyen)
 path='NguyenAmKiemThu';
    
    people= {'23MTL' '24FTL' '25MLM' '27MCM' '28MVN' '29MHN' '30FTN' '32MTP' '33MHP' '34MQP' '35MMQ' '36MAQ' '37MDS' '38MDS' '39MTS' '40MHS' '41MVS' '42FQT' '43MNT' '44MTT' '45MDV'};
    vowel = {'a' 'e' 'i' 'o' 'u'};
%     vowel = 'a';
    %ma tran nham lan
    confusionMatr = zeros(5,5);
    
    for j = 1: length(vowel)
        for i = 1 : length(people)
           filename = append(path,'\',people{i},'\',vowel{j},'.wav');
           detectedVowel = detectVowelFFT(filename,huanluyen);
           confusionMatr(j,detectedVowel) = confusionMatr(j,detectedVowel)+1;
        end
    end