function  huanluyen = getFileMFCC(NumCoeffs,NumCluster)
    path='NguyenAmHuanLuyen';
    
    people= {'01MDA' '02FVA' '03MAB' '04MHB' '05MVB' '06FTB' '07FTC' '08MLD' '09MPD' '10MSD' '11MVD' '12FTD' '14FHH' '15MMH' '16FTH' '17MTH' '18MNK' '19MXK' '20MVK' '21MTL' '22MHL'};
    vowel = {'a' 'e' 'i' 'o' 'u'};
    color={'blue' 'red' 'yellow' 'black' 'green'};
      
    huanluyen = cell(5,1);
    for j = 1: length(vowel)
        data = zeros(length(people),NumCoeffs);
        for i = 1 : length(people)
           filename = append(path,'\',people{i},'\',vowel{j},'.wav');
           [y,fs] = audioread(filename);
           StableSignal = getStableSignal(y,fs);
           mfccVectors = v_melcepst(StableSignal, fs, 'E', NumCoeffs-1, floor(3*log(fs)), 0.03*fs, 0.01*fs);
           mfccVector = mean(mfccVectors);
            data(i,:) = mfccVector;
        end

        finalVector = v_kmeans(data,NumCluster);
        huanluyen{j} = finalVector;
        hold on;
        plot(finalVector.',color{j});
        
    end
   legend('a','e','i','o','u');