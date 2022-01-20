function fftVector = callFFT(StableSignal,fs, frameTime, shiftTime)
       frameSize = frameTime*fs;
       frameShift = shiftTime*fs;
       L = length(StableSignal);
       numOfFrame = floor((L-frameSize+frameShift)/frameShift);
       S=zeros(512,1);
       for i=1: numOfFrame
           range = (i-1)*(frameShift) + 1:i*(frameSize)-(i-1)*(frameSize-frameShift); 
           frame=StableSignal(range);
           framefft=abs(fft(frame,1024));
           framefft=10*log10(framefft);
           framefft1=framefft(1:512);
           S=S+framefft1;
       end
       fftVector=S/numOfFrame;
           
       

