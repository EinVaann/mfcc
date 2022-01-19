function UV = getUV(y,fs,frameSizeS,shiftingSizeS)

frameNumber = round((length(y)-frameSizeS+shiftingSizeS)/shiftingSizeS);

startFrame = 1;
ste = zeros(1,frameNumber);
for index = 1:frameNumber
    %Lấy khung
    endFrame = min(startFrame + frameSizeS,length(y));
    frame = y(startFrame:endFrame);
    ste(index) = sum(frame.^2);
    startFrame = startFrame + shiftingSizeS;
end
%Chuẩn hóa
ste = ste./max(ste);

%Xét ngưỡng
UV = zeros(1,frameNumber);
for index=1:frameNumber
    if(ste(index)>0.015)
        UV(index)=1;
    end
end

%Lọc các khoảng lặng ngắn
startPoint = 1;
for index=2:frameNumber
    if (UV(index)>UV(index-1))
       startPoint = index;
   else
       if(UV(index)<UV(index-1))
           endPoint  = index;
           l = endPoint - startPoint + 1;
           if(l*shiftingSizeS/fs < 0.1)
               UV(startPoint:endPoint) = zeros(1,l);
           end
       end
   end
end
% hold on;
% for index=2:frameNumber
%     if((UV(index)~=UV(index-1)))
%         plot([shiftingSizeS/fs*index shiftingSizeS/fs*index],[1 -1],'blue');
%     end
% end



