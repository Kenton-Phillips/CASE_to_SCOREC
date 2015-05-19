## Information on Shading Look Up Tables (ShadLUT)

### Files Included
1. Generic 7x7
2. In-Studio 12 Modules in series for NYC


## Naming ConventionL: In-Studio 12 Modules in series for NYC


Bay #, Stack #, Module #

Note: All experimental data is from Bay II

#### Bay II Names
Stack 1 | Stack 2 | Stack 3 | Stack 4 
--- | --- | --- | ---
 m1 | m1 | m1 | m1 
 m2 | m2 | m2 | m2 
 m3 | m3 | m3 | m3 
 m4 | m4 | m4 | m4 
 m5 | m5 | m5 | m5  
 m6 | m6 | m6 | m6  

----


----

#### Bay II Heat Transfer Fluild Flow
Number corresponds to position in series. Start at s3m6 ends at s2m1

Stack 1 | Stack 2 | Stack 3 | Stack 4
--- | --- | --- | --- 
 x | 12 | 6 | x 
 x | 11 | 5 | x 
 x | 10 | 4 | x 
 x | 9 | 3 | x 
 x | 8 | 2 | x  
 x | 7 | 1 | x  

----


----

#### Bay II Module Correspondings Shading LUT
ShadLUT are tab separted TxT Files. 
Format of File is:
Pitch	Yaw		Viewfactor(VF) -> scalar multiplied by DNI to get Energy in per cell



`ICSolarmodule_xx_VF`


Stack 1 | Stack 2 | Stack 3 | Stack 4
--- | --- | --- | --- 
 x | 11 | 05 | x 
 x | 10 | 04 | x 
 x | 09 | 03 | x 
 x | 08 | 02| x 
 x | 07 | 01 | x  
 x | 06 | 00 | x  

 
  
 

#### Revision log
* 18-May-2015 In-Studio for experiment validation added
