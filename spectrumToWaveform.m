function waveform = spectrumToWaveform(spectrum, numPoints)
% WAVEFORMTOSPECTRUM Calculates the waveform for a spectrum.
% The ifft is performed on the columns of spectrum.

harmHi = floor(numPoints / 2);
% throw out any frequency components that will not contribute
if size(spectrum,1) > harmHi + 1
    spectrum(harmHi + 2 : end, :) = [];
    warning('Some spectrum points have been thrown out!');
end
% fill the spectrum out to the Nyquist limit
if size(spectrum,1) < harmHi + 1
    spectrum(end + 1 : harmHi + 1,:) = 0;
end    
    
% fix up the dc component
spectrum(1,:) = spectrum(1,:) * 2; % First harmonic
% un-normalise the points
spectrum = spectrum * numPoints / 2; % Why ?
% add the extra points
newPoints = spectrum(2:ceil(numPoints / 2),:); % Spectrum without dc component
newPoints = conj(newPoints);
newPoints = flipud(newPoints);
spectrum = [spectrum;newPoints];
% take the ifft
waveform = ifft(spectrum, numPoints, 1);
waveform = real(waveform);