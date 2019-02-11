function I = segmentationRGB(imageArray, threshold, colorMean)

[M,N,n] = size(imageArray); 

% Convert imageArray to vector format.

imageArray = double(reshape(imageArray, M*N, n));

% Initialize I as a column vector.  It will be reshaped later
% into an image.
I = zeros(M*N, 1); 

vectorlen = length(imageArray);
D = sqrt(sum(abs(imageArray - repmat(colorMean, vectorlen, 1)).^2, 2));

% D is a vector of size MN-by-1 containing the distance computations
% from all the color pixels to vector mean. Find the distances <= Threshold.
idx = find(D <= threshold);

% Set the values of I(idx) to 1.  These are the segmented color pixels.
I(idx) = 1;

% Reshape I into an M-by-N image.
I = reshape(I, M, N);  
