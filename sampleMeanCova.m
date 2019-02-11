function [ sampleMean, covrance] =  sampleMeanCova( samplemask, imageRGB )

% Use the mask image multiply the image RGB components get the three
% channel information.
redDem = immultiply(samplemask,imageRGB(:,:,1));
greenDem = immultiply(samplemask,imageRGB(:,:,2));
blueDem = immultiply(samplemask,imageRGB(:,:,3));
samplemaskB = cat(3,redDem,greenDem,blueDem); 

[m,n,k] = size(samplemaskB);

% Transfer the array to vector which is more convenience to computer.
samplemaskB_vector = reshape(samplemaskB, m*n,3);
% Find the index which with the logical true value
idx = find(samplemask);
samplemaskB_vector = double(samplemaskB_vector(idx,1:3));
vectorSize = size(samplemaskB_vector, 1);

samplemaskB_vector = double(samplemaskB_vector);
% Compute an unbiased estimate of samplemaskB_vector.
sampleMean = sum(samplemaskB_vector, 1)/vectorSize;
% Subtract the mean from each row of samplemaskB_vector.
samplemaskB_vector = samplemaskB_vector - sampleMean(ones(vectorSize, 1), :);
% Compute an unbiased estimate of Covariance. 	
covrance = (samplemaskB_vector'*samplemaskB_vector)/(vectorSize - 1);

% These following part will help us to determine the value of the
% threshold.
% d = diag(covrance);
% sd = sqrt(d)'

end

