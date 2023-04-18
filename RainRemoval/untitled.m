clear;
clc;
close all;
% Load the image
img = imread('rainy.jpg');

% Create a video writer
writerObj = VideoWriter('video.avi', 'Uncompressed AVI');
writerObj.FrameRate = 1; % 1 frame per second
open(writerObj);

% Write the image to the video file
for i = 1:25 % 25 frames for 1 second
    writeVideo(writerObj, img);
end

% Close the video writer
close(writerObj);

% Load the video file and save it as a .mat file
videoObj = VideoReader('video.avi');
videoFrames = cell(1, videoObj.NumberOfFrames);
for i = 1:videoObj.NumberOfFrames
    videoFrames{i} = read(videoObj, i);
end
save('rainy.mat', 'videoFrames');