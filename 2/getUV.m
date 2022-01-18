function UV = getUV(y,fs)

%Độ dài khung theo giây
frameSizeT = 0.025;
%Độ dịch khung theo giây
shiftingSizeT = 0.01;
%Độ dài khung theo mẫu
frameSizeS = round(frameSizeT * fs);
%Độ dịch khung theo mẫu
shiftingSizeS = shiftingSizeT*fs;
%Đếm số khung
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
    if(ste(index)>0.0015)
        UV(index)=1;
    end
end

%Lọc các khoảng lặng ngắn
for index=2:frameNumber
    if (UV(index)>UV(index-1))
       startPoint = index;
   else
       if(UV(index)<UV(index-1))
           endPoint  = index;
           l = endPoint - startPoint + 1;
           if(l*shiftingSizeT < 0.1)
               UV(startPoint:endPoint) = zeros(1,l);
           end
       end
   end
end

%Vẽ đồ thị
hold on;
for index=2:frameNumber
    if((UV(index)~=UV(index-1)))
        plot([shiftingSizeT*index shiftingSizeT*index],[1 -1],'blue');
    end
end






