%{
Method : This method extracts the characters from the data svt datsets
         provided.
Cite   : @InProceedings{Mishra12,
              author    = "Mishra, A. and Alahari, K. and Jawahar, C.~V.",
              title     = "Top-Down and Bottom-Up Cues for Scene Text Recognition",
              booktitle = "CVPR",
              year      = "2012"
            }


            Since this dataset is originally taken from: http://vision.ucsd.edu/~kai/svt/. 
            The following paper should be cited when using this dataset.

            @InProceedings{Wang11,
              author    = "Wang, K. and Babenko, B. and Belongie, S.",
              title     = "End-to-end Scene Text Recognition",
              booktitle = "ICCV",
              year      = "2011"
            }
Author : Suman Ghosh
         Sounak Dey
%}

clear all; close all; clc;
load testCharBound
if ~exist('./characters','dir')
    mkdir('./characters');
end
disp('The characters is generated ...');
for i =1:size(testCharBound, 2)
    for j =1:length(testCharBound(i).chars)
        file = fullfile(pwd, 'svt-word', testCharBound(i).ImgName);
        im_cropped = imcrop(imread(file), testCharBound(i).charBB(j,:));
        filename = ['./characters/' testCharBound(i).chars(j) num2str(i) num2str(j) '.png'];
        imwrite(im_cropped,filename); 
    end 
end
disp('Done ...');
