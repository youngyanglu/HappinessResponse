******************************************************************
* This Master do-file 
* 	reads in the APL 2008/2012 Election Data
* 	Links all other do-files
*	Raw Data found here: https://alpdata.rand.org/index.php?page=data
*	Run this for Output Regressions in Log file
* 	Created: 29/10/2015, by Yang Lu
* 	This version:
******************************************************************

/*
EDIT THE cd and globals BEFORE RUNNING THIS FILE
*/

set more off
cap log close

/*
THIS FILE CREATES PROCESSED FILES FROM RAW FILES.
EDIT THE cd and globals BEFORE RUNNING THIS FILE
*/


cd "/Users/Young/Dropbox/Collin/Project_Code"

global raw_data     "/Users/Young/Dropbox/Collin/Project_Code/Raw_Data"
global data_pro 	"/Users/Young/Dropbox/Collin/Project_Code/Output_Data"
global log_file		"/Users/Young/Dropbox/Collin/Project_Code/Log"



do "/Users/Young/Dropbox/Collin/Project_Code/Do_Files/raw_to_pro0812.do" 
do "/Users/Young/Dropbox/Collin/Project_Code/Do_Files/Append.do"

cap log close
log using "$log_file/results.txt", replace
log on

do "/Users/Young/Dropbox/Collin/Project_Code/Do_Files/baseline_linear.do"
do "/Users/Young/Dropbox/Collin/Project_Code/Do_Files/baseline_nonlinear.do"

do "/Users/Young/Dropbox/Collin/Project_Code/Do_Files/robustAbspartA.do"
do "/Users/Young/Dropbox/Collin/Project_Code/Do_Files/robustProbvoteA.do"
do "/Users/Young/Dropbox/Collin/Project_Code/Do_Files/robustB.do"
do "/Users/Young/Dropbox/Collin/Project_Code/Do_Files/robustD.do"

log off 
