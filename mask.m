function [ outimage ] = mask( Black, White)

[imageHeight,imageWidth] = size(Black);

% Through the image, to create the pseudocolor segmentation image.

for i = 1:imageHeight
    for j = 1:imageWidth
        if (Black(i,j)==1)&&(White(i,j)==0)
            % Set the three channel value of the blue part. 
            outimage(i,j,1) = 255;
            outimage(i,j,2) = 255;
            outimage(i,j,3) = 255;
        elseif (Black(i,j)==0)&&(White(i,j)==1)
            outimage(i,j,1) = 255;
            outimage(i,j,2) = 255;
            outimage(i,j,3) = 255;
        else
            % This part is to show the pixels not been find and pixels have
            % been assigned into two colors or three color. it also help us
            % to compare which color space is better. 
            outimage(i,j,1) = 0;
            outimage(i,j,2) = 0;
            outimage(i,j,3) = 0;
        end
    end
end

end

