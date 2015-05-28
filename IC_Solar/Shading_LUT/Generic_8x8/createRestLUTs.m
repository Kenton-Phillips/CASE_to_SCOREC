% Given: a quadrant's worth of %shaded LUTs for ICSF
% This script creates % exposed LUTs, for the og LUTs, and for the other quadrants. 
%% 
filenam = 'ICSolarmodule_09_ShadLUT_Generic.txt';
% filenam = 'ICSolarmodule_12_ShadLUT_Generic_Copy.txt';
shadModNum = filenam(15:16);
delimiterIn = '\t';
headerlinesIn = 1;
shadLUTdata = importdata(filenam,delimiterIn, headerlinesIn);
L = 49;
%complement: make this an LUT of "fraction exposed" 
% rather than "fraction shaded"
fractExposed = 1-shadLUTdata.data(:,3);
% put the pitch and yaw vectors through same transforms as the data
og_pitchVec = shadLUTdata.data(:,1);
og_yawVec = shadLUTdata.data(:,2);
 
% reshape the original data vector from the file
%now flip left-right because the original file is (72,72)=(up,left)
%and here's the original LUT:
ogLUT = fliplr(rot90(reshape(fractExposed,[L L]),-1));
% now flip it left-right
ogLUTPrime = fliplr(ogLUT);
%reshape the piutch and yaw vectors to match
og_pitchtable = reshape(og_pitchVec,[L L]);
og_yawtable = reshape(og_yawVec,[L L]);
% and shove the tables back into vectors
fractExposedPrime = reshape(rot90(ogLUTPrime,1),[L*L 1]);

what = fractExposed-fractExposedPrime

ogLUTPrimePrime = flipud(ogLUTPrime);
ogLUTPrimePrimePrime = flipud(ogLUTPrimePrime);


%% xlswrite to confirm
% xlswrite('C:\Users\Nick\Documents\CASE_to_SCOREC\IC_Solar\Shading_LUT\Generic_8x8\testxlsLUTout.xlsx',ogLUT)
pitchVector = [72:-3:-72]';
yawVector = fliplr(pitchVector');
ssName = strcat('pctExposedLUT_module_',shadModNum,'.xlsx');
sstag = {strcat('Mod_',shadModNum)};
xlswrite(ssName,sstag,1,'a1');
xlswrite(ssName,ogLUT,1,'b2');
xlswrite(ssName,pitchVector,1,'a2');
xlswrite(ssName,yawVector,1,'b1');

%% 