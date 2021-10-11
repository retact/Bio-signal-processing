import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import scipy.io as io


if __name__ == "__main__":

    eeg_file = '../EEG-sample/close.mat'
    frame_size = 256
    frame_shift = 66
    out_plot = './image/spectrogram.png'
    data = io.loadmat(eeg_file)
    data = data['y']
    eeg_sample = data[1]
    print(eeg_sample)
    num_samples = len(eeg_sample)
    sample_frequency = 256

    # Convert milliseconds to number of sample
    frame_size = int(sample_frequency \
                     * frame_size * 0.001)
    # Convert milliseconds to number of amples
    frame_shift = int(sample_frequency * frame_shift * 0.001)

    fft_size = 1
    while fft_size < frame_size:
        fft_size *= 2

    # Calculate the total number of frames
    num_frames = (num_samples - frame_size) // frame_shift + 1
    # Prepare the spectrogram matrix
    spectrogram = np.zeros((num_frames, int(fft_size/2)+1))

    # Calculate the amptitude spectrum
    for frame_idx in range(num_frames):
        start_index = frame_idx * frame_shift

        frame = eeg_sample[start_index:start_index + frame_size].copy()
        frame = frame * np.hamming(frame_size)
        spectrum = np.fft.fft(frame, n=fft_size)
        absolute = np.abs(spectrum)
        absolute = absolute[:int(fft_size/2) + 1]
        log_absolute = np.log(absolute + 1E-7)
        spectrogram[frame_idx, :] = log_absolute

    # plotting
    plt.figure(figsize=(10, 10))
    plt.subplot(2, 1, 1)
    time_axis = np.arange(num_samples) / sample_frequency
    plt.plot(time_axis, eeg_sample)

    plt.title('closeEEG 1ch')
    plt.xlabel('Time [sec]')
    plt.ylabel('value')
    plt.xlim([0, num_samples / sample_frequency])

    plt.subplot(2, 1, 2)

    # Set the range of the color map.
    spectrogram -= np.max(spectrogram)
    vmax = np.abs(np.min(spectrogram)) * 0.0
    vmin = - np.abs(np.min(spectrogram)) * 0.7

    plt.imshow(spectrogram.T[-1::-1, :],
               extent=[0, num_samples / sample_frequency,
                       0, sample_frequency / 2],
               cmap='gray',
               vmax=vmax,
               vmin=vmin,
               aspect='auto')

    plt.title('spectrogram')
    plt.xlabel('Time [sec]')
    plt.ylabel('Frequency [Hz]')

    plt.savefig(out_plot)
