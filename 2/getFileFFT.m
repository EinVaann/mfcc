function  huanluyen = getFileFFT()
    path='NguyenAmHuanLuyen';
    
    people= {'01MDA' '02FVA' '03MAB' '04MHB' '05MVB' '06FTB' '07FTC' '08MLD' '09MPD' '10MSD' '11MVD' '12FTD' '14FHH' '15MMH' '16FTH' '17MTH' '18MNK' '19MXK' '20MVK' '21MTL' '22MHL'};
    vowel = {'a' 'e' 'i' 'o' 'u'};
    
    huanluyen = cell(5,1);
    for j = 1: length(vowel)
        data = cell(length(people),1);
        for i = 1 : length(people)
           filename = append(path,'\',people{i},'\',vowel{j},'.wav');
           [y,fs] = audioread(filename);
           StableSignal = getStableSignal(y,fs);
           mfccVector = callFFT(StableSignal,fs,0.03,0.01);
           data{i} = mfccVector;
        end
        finalVector = zeros(size(data{1}));
        for i = 1:length(data)
            finalVector = finalVector + data{i};
        end
        finalVector = finalVector./length(data);
        huanluyen{j} = finalVector;
        subplot(5,1,j);
        plot(finalVector.','blue');
   end