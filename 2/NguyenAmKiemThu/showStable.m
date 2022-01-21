function showStable()
path='NguyenAmHuanLuyen';
    
    people= {'01MDA' '02FVA' '03MAB' '04MHB' '05MVB' '06FTB' '07FTC' '08MLD' '09MPD' '10MSD' '11MVD' '12FTD' '14FHH' '15MMH' '16FTH' '17MTH' '18MNK' '19MXK' '20MVK' '21MTL' '22MHL'};
    vowel = {'a' 'e' 'i' 'o' 'u'};
%     vowel = 'a'

   for i = 1 : length(people)
        figure;
        for j = 1: length(vowel)
           filename = append(path,'\',people{i},'\',vowel{j},'.wav');
           [y,fs] = audioread(filename);
            subplot(5,2,2*j-1);
            plot(y);
           StableSignal = getStableSignal(y,fs);
            subplot(5,2,2*j);
            plot(StableSignal);
        end
   end