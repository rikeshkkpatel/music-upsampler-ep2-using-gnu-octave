clear all;

info = audioinfo('test.wav');
Input = audioread('test.wav');

NewSampleRate = 768000;
NewTotalSamples = ceil((info.TotalSamples*NewSampleRate)/info.SampleRate);
Output = zeros(NewTotalSamples,2);

NewInterval = 1/NewSampleRate;
NewTimeLine = (0:(NewTotalSamples-1))*NewInterval;
n = transpose(0:(info.TotalSamples-1));


for t = 1:NewTotalSamples
	Output(t,:) = sum(Input.*sinc((info.SampleRate*NewTimeLine(t))-n));
end

audiowrite('output.wav',Output,NewSampleRate,'BitsPerSample',32);