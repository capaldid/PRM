%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Function:
%   This function performs Parametric Response Mapping of Coregistered 
%   Positron Emission Tomography and Dynamic Contrast Enhanced Computed 
%   Tomography to Identify Radioresistant Subvolumes in Locally Advanced
%    Cervical Cancer
%
% Inputs:
%         PET/CT[SUV], DCE-CT[BF], contour
% 
% Outputs:
%         PRM results and image.
% 
% Author: Dante PI Capaldi
% Website: https://github.com/capaldid/PRM
% Citation: Capaldi, Hristov, Kidd, Int J Radiat Oncol Biol Phys. 2020
% Paper: https://doi.org/10.1016/j.ijrobp.2020.03.023
% Date: April 2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

% Prepare the Matlab workspace and specify software & data paths
clc; clear all; close all; warning off;

% Load test file (which contains PET/CT[SUV], DCE-CT[BF], contour)
% Note: This you will have to update to read in the appropriate registered
%       DCE CT BF, PET/CT SUV, and contour.

% % Example 1: Simple synthetic 2D square with equal compartments
% load('PRM_Test_Dataset_1.mat');

% Example 2: Synthetic 3D volume
load('PRM_Test_Dataset_2.mat');

% Set variables
mask = double(mask); % Contour 
x = double(PET_CT); % PET SUV
y = double(DCE_CT); % DCE CT BF

% Clear PRM variables
PRM_matrix = [];
PRM_matrix_1 = [];
PRM_matrix_2 = [];
PRM_matrix_3 = [];
PRM_matrix_4 = [];
tot = 0;
tot_1 = 0;
tot_2 = 0;
tot_3 = 0;
tot_4 = 0;

% Thresholds
thresh1 = 5.2; % SUV Threshold
thresh2 = 68.2; % BF Threshold

% 1,2,10,20 are arbitrary values chosen so that when PET and DCE CT are
%   summed together, they will produce four distincted result corresponding
%   to the four categories.

% Remove non-contour values from the evaluation
x(mask==0) = NaN; y(mask==0) = NaN; 

% Separate volume based on SUV threshold
[indrt1,indct1,indzt1] = ind2sub(size(x),find(x>thresh1));
[indrt2,indct2,indzt2] = ind2sub(size(x),find(x<=thresh1));
x(sub2ind(size(x),indrt1,indct1,indzt1)) = 1;
x(sub2ind(size(x),indrt2,indct2,indzt2)) = 2;

% Separate volume based on BF threshold
[indrt3,indct3,indzt3] = ind2sub(size(y),find(y>thresh2));
[indrt4,indct4,indzt4] = ind2sub(size(y),find(y<=thresh2));
y(sub2ind(size(y),indrt3,indct3,indzt3)) = 10;
y(sub2ind(size(y),indrt4,indct4,indzt4)) = 20;

% Combined into PRM
PRM_matrix = x + y;

% Metabolically active + hyperoxia = category1.
PRM_matrix(PRM_matrix==11)=1;
PRM_matrix_1(PRM_matrix==1)=1;
tot_1 = sum(sum(sum(PRM_matrix_1)));
% Metabolically inactive + hyperoxia = category4.
PRM_matrix(PRM_matrix==12)=4;
PRM_matrix_4(PRM_matrix==4)=1;
tot_4 = sum(sum(sum(PRM_matrix_4)));
% Metabolically active + hypoxia = category2.
PRM_matrix(PRM_matrix==21)=2;
PRM_matrix_2(PRM_matrix==2)=1;
tot_2 = sum(sum(sum(PRM_matrix_2)));
% Metabolically inactive + hypoxia = category3.
PRM_matrix(PRM_matrix==22)=3;
PRM_matrix_3(PRM_matrix==3)=1;
tot_3 = sum(sum(sum(PRM_matrix_3)));
% Contour volume.
tot = sum(sum(sum(mask)));

% Display PRM relative volume.
fprintf('    Metabolically active + hyperoxic:    %f \n', tot_1*100/tot);
fprintf('    Metabolically inactive + hyperoxic:  %f \n', tot_4*100/tot);
fprintf('    Metabolically active + hypoxic:      %f \n', tot_2*100/tot);
fprintf('    Metabolically inactive + hypoxic:    %f \n', tot_3*100/tot);

% Replace the NaN with 0 (the NaN was previously added above to remove 0
% values form the contour in the evaluation)
[indrf,indcf,indzf] = ind2sub(size(x),find(isnan(PRM_matrix)));
PRM_matrix(sub2ind(size(x),indrf,indcf,indzf)) = 0;

% Colormap changed for PRM
cmap=[0 0 0;...
      0 1 1;...
      1 0 1; ...
      1 0 0; ...
      0 1 0];
  
% Figure 1: displaying, PET, DCE, Contour and PRM
mid_slice = round(size(mask,3)/2);
figure, hFig=gcf;
subplot(2,2,1), imshow(PET_CT(:,:,mid_slice),[0 10]), title('PET (SUV)');
    colormap(gca,'hot'), hcb1=colorbar;
subplot(2,2,2), imshow(DCE_CT(:,:,mid_slice),[0 100]), title('DCE-CT (BF)');
    colormap(gca,'jet'), hcb2=colorbar;
subplot(2,2,3), imshow(mask(:,:,mid_slice),[0 1]), title('Contour');
    colormap(gca,'gray'), hcb3=colorbar;
subplot(2,2,4), imshow(PRM_matrix(:,:,mid_slice),[]), title('PRM');
    colormap(gca,cmap)
    hcb4=colorbar('Ticks',[1*4/10, 3*4/10,5*4/10,7*4/10,9*4/10],...
        'TickLabels',{['Background'],...
        ['\uparrow '  'SUV' '\uparrow ' 'BF'],...
        ['\uparrow '  'SUV' '\downarrow ' 'BF'],...
        ['\downarrow ' 'SUV' '\downarrow ' 'BF'],...
        ['\downarrow ' 'SUV' '\uparrow '  'BF']});

% Figure 2: displaying PRM 3D map (using imshow3D)
figure,imshow3D(PRM_matrix), colormap(cmap),
colorbar('Ticks',[1*4/10, 3*4/10,5*4/10,7*4/10,9*4/10],...
     'TickLabels',{['Background'],...
     ['\uparrow '  'SUV' '\uparrow ' 'BF'],...
     ['\uparrow '  'SUV' '\downarrow ' 'BF'],...
     ['\downarrow ' 'SUV' '\downarrow ' 'BF'],...
     ['\downarrow ' 'SUV' '\uparrow '  'BF']})