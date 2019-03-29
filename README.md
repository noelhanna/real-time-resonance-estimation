# real-time-resonance-estimation
Open-source software for estimating vocal tract resonances using broadband excitation at the lips
[![DOI](https://zenodo.org/badge/doi/10.5281.svg)](http://dx.doi.org/10.5281/zenodo.2616871)


This software is described in:

Jeanneteau, M., Hanna, N., Almeida, A., Smith, J., and Wolfe, J. (2019) *Open-source software for estimating vocal tract resonances using broadband excitation at the lips*, International Congress of Phonetic Sciences, Melbourne, Australia

For further details, and to download the necessary .fig file and/or compiled software, go to:

http://newt.phys.unsw.edu.au/jw/broadband.html

The software is a major GUI redevelopment of the real-time acoustic vocal tract excitation (RAVE) technique originally developed and published in:

Epps, J., Smith, J.R. and Wolfe, J. (1997) *A novel instrument to measure acoustic resonances of the vocal tract during speech* Measurement Science and Technology 8, 1112-1121.

Publications are available at http://newt.phys.unsw.edu.au/jw/publications.html


## New features
- True real-time interface, updates impedance ratio plot at the end of each cycle
- Customisable voice harmonic removal
- Averaging over a chosen number of cycles
- Piano keyboard to allow a target frequency to be displayed
- Resonance tuning indicators
- Second recording channel for EGG or accelerometer is displayed
- Automatic detection of available input and output devices, which can be selected independently
- Compatible with Windows 7+ and Mac OS 10.13+. Not tested on earlier versions.


## Known Issues
- The necessary GUI_RAVE.fig is too big for GitHub. It must be downloaded separately from http://newt.phys.unsw.edu.au/jw/broadband.html and placed in the same folder as the code or added to the Matlab path.
- Written using Matlab Guide function - the .fig and .m file are linked via callbacks. To change the filename it is necessary to make a new version in Guide rather than just editing the .m file
- A selection must be made before saving, otherwise only the first (empty) cycle is saved
- Real-time RAVE is not synched - so phase information is not accurate
- A non-realtime option (called ACUZ) is included in the code but commented out. It can be used if accurate phase information is necessary - in which case channel 2 must be used as direct feedback from the output. This version requires a modified version of pa_wavplayrecord, such as https://github.com/jgdsens/pa-wavplay
- It is possible to use a third (or more) synchronous recording channel but it will not be displayed. However, to use more than 2 channels you will need to modify the Matlab read only function *audiorecorder* by commenting out lines 309-311 and saving. This use of the *audiorecorder* function is not supported by Matlab and may cause unintended behaviour.


## Feature requests
- This software is not under active development. Please fork the repository and make your own changes in line with the software licence.


## Significant contributors

John Smith (original C/C++ code)
 
Maëva Garnier (translation to Matlab)
 
Marie Jeanneteau (GUI)
 
Noel Hanna (GUI)

Other contributors in the Acoustics lab at UNSW (https://newt.phys.unsw.edu.au/music/) include:
 
André Almeida, Henri Boutin, Jer-Ming Chen, Weicong Li
