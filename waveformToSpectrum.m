function spectrum = waveformToSpectrum(waveform, numPoints)
% WAVEFORMTOSPECTRUM Calculates the spectrum for a waveform.
% The fft is performed on the columns of waveform.

if nargin < 2, numPoints = size(waveform,1); end

% take the fft
spectrum = fft(waveform, numPoints, 1);
% only keep those points out to the harmHi'th harmonic
harmHi = floor(numPoints / 2);
spectrum = spectrum(1:harmHi + 1,:);
% normalise the points
spectrum = spectrum * 2 / numPoints;
% fix up the dc component
spectrum(1,:) = spectrum(1,:) / 2;