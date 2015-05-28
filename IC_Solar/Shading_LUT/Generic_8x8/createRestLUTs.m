% Given: a quadrant's worth of %shaded LUTs for ICSF
% This script creates % exposed LUTs, for the og LUTs, and for the other quadrants. 
%% 
filenam = 'ICSolarmodule_12_ShadLUT_Generic_Copy.txt';
shadModNum = filenam(15:16);

delimiterIn = '\t';
headerlinesIn = 1;
shadLUTdata = importdata(filenam,delimiterIn, headerlinesIn);

%complement: make this an LUT of "fraction exposed" 
% rather than "fraction shaded"
shadLUTdata.data(:,3) = 1-shadLUTdata.data(:,3);
% here is the original LUT from the file
ogLUT = rot90(reshape(shadLUTdata.data(:,3),[49 49]),-1);
%now flip left-right because the original file is (72,72)=(up,left)
ogLUT = fliplr(ogLUT);


%% xlswrite to confirm
% xlswrite('C:\Users\Nick\Documents\CASE_to_SCOREC\IC_Solar\Shading_LUT\Generic_8x8\testxlsLUTout.xlsx',ogLUT)
pitchVector = [72:-3:-72]';
yawVector = fliplr(pitchVector');
ssName = strcat('LUTmodule_',shadModNum,'.xlsx');
xlswrite(ssName,ogLUT,1,'b2')
xlswrite(ssName,pitchVector,1,'a2')
xlswrite(ssName,yawVector,1,'b1')

%% 
