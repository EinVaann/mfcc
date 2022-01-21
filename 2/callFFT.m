function fftVector = callFFT(StableSignal,fs, frameTime, shiftTime)
       frameSize = frameTime*fs;
       frameShift = shiftTime*fs;
       L = length(StableSignal);
       numOfFrame = floor((L-frameSize+frameShift)/frameShift);
       S1= zeros(numOfFrame,512);
       for i=1: numOfFrame
           range = (i-1)*(frameShift) + 1:min(((i-1)*frameShift + 1 +frameSize),length(StableSignal)); 
           frame=StableSignal(range);
           framefft=abs(fft(frame,1024));
%            framefft=10*log10(framefft);
           framefft1=framefft(1:length(framefft)/2);
           S1(i,:) = framefft1.';
       end
       fftVector = mean(S1);

           
       

