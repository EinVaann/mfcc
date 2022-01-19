function  getFile()
    path='NguyenAmHuanLuyen';
    
    people= {'01MDA' '02FVA' '03MAB' '04MHB' '05MVB' ' 06FTB' '07FTC' '08MLD' '09MPD' '10MSD' '11MVD' '12FTD' '14FHH' '15MMH' '16FTH' '17MTH' '18MNK' '19MXK' '20MVK' '21MTL' '22MHL'};
    vowel = {'a' 'e' 'i' 'o' 'u'};
    
    
    for i = 1 : length(people)
        for j = 1: length(vowel)
           file = append(path,'\',people{i},'\',vowel{j},'.wav');
%            showFigure(file);
        end
    end