function [output, alpha] = randomisePhase(output, numTrials)

if nargin < 2, numTrials = 25; end
numPoints = length(output.waveform);

ampSum = sum(abs(output.spectrum));

for trial = 1:numTrials
    % calculate a random phase change
    phaseChange = (rand(size(output.spectrum)) - 0.5) * 2*pi;
    % apply the phase change
    newSpectrum = output.spectrum .* exp(i * phaseChange);
    % calculate the new output waveform
    newWaveform = spectrumToWaveform(newSpectrum, numPoints);
    % calculate alpha for the new waveform
    newAlpha = ampSum / max(abs(newWaveform));
    if newAlpha > output.alpha
        output.waveform = newWaveform;
        output.alpha = newAlpha;
    end
end

% Normalise the output waveform to 99%
output.waveform = 0.99 * output.waveform / max(abs(output.waveform));

% Recalculate the output spectrum
output.spectrum = waveformToSpectrum(output.waveform, numPoints);