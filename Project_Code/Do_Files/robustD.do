******************************************************************
* This do-file 
* 	reads in the APL 08 and 12 Election Data
* 	Runs Robustness Regressions 08 and 12 Data
* 	Created: 4/11/2015, by Collin Raymond and Yang Lu
* 	This version:
******************************************************************

/*
THIS FILE CREATES PROCESSED FILES FROM RAW FILES.
EDIT THE cd and globals BEFORE RUNNING THIS FILE
*/


cd "/Users/Young/Dropbox/Collin/Project_Code"

global raw_data     "/Users/Young/Dropbox/Collin/Project_Code/Raw_Data"
global data_pro 	"/Users/Young/Dropbox/Collin/Project_Code/Output_Data"

set more off 

use "$data_pro/combined0812", clear

///2008///

//Diffeight/Partisan
preserve 
drop if diffeight2008==.
drop if abspart2008==.
drop if surprise39==.
drop if supportdummy2008==.
drop if adjtime2008==.

nl(diffeight2008=({d8=0}*abspart2008*surprise39+{d9=0}*abspart2008*surprise39*supportdummy2008)*exp({d21=0}*adjtime2008)), cluster(case_id)

//Diffeight/Probvote
restore
preserve 
drop if diffeight2008==.
drop if votefavprob2008==.
drop if surprise39==.
drop if supportdummy2008==.
drop if adjtime2008==.

nl(diffeight2008=({d8=0}*votefavprob2008*surprise39+{d9=0}*votefavprob2008*surprise39*supportdummy2008)*exp({d21=0}*adjtime2008)), cluster(case_id)

//Agghap/Partisan
restore
preserve 
drop if diff2008==.
drop if abspart2008==.
drop if surprise39==.
drop if supportdummy2008==.
drop if adjtime2008==.
nl(diff2008 =({d8=0}*abspart2008*surprise39+{d9=0}*abspart2008*surprise39*supportdummy2008)*exp({d21=0}*adjtime2008)), cluster(case_id)

//Agghap/Probvote
restore
preserve 
drop if diff2008==.
drop if votefavprob2008==.
drop if surprise39==.
drop if supportdummy2008==.
drop if adjtime2008==.
nl(diff2008 =({d8=0}*votefavprob2008*surprise39+{d9=0}*votefavprob2008*surprise39*supportdummy2008)*exp({d21=0}*adjtime2008)), cluster(case_id)

///2012///

//Diffeight/Partisan
restore
preserve 
drop if diffeight2012==.
drop if abspart2012==.
drop if surprise303==.
drop if supportdummy2012==.
drop if time2012==.
nl(diffeight2012=({d8=0}*abspart2012*surprise303+{d9=0}*abspart2012*surprise303*supportdummy2012)*exp({d21=0}*time2012)), cluster(case_id)

//Diffeight/Probvote
restore
preserve 
drop if diffeight2012==.
drop if votefavprob2012==.
drop if surprise303==.
drop if supportdummy2012==.
drop if time2012==.
nl(diffeight2012=({d8=0}*votefavprob2012*surprise303+{d9=0}*votefavprob2012*surprise303*supportdummy2012)*exp({d21=0}*time2012)), cluster(case_id)

//Agghap/Partisan
restore
preserve 
drop if diffagghap2012==.
drop if abspart2012==.
drop if surprise303==.
drop if supportdummy2012==.
drop if time2012==.
nl(diffagghap2012 =({d8=0}*abspart2012*surprise303+{d9=0}*abspart2012*surprise303*supportdummy2012)*exp({d21=0}*time2012)), cluster(case_id)

//Agghap/Probvote
restore
preserve 
drop if diffagghap2012==.
drop if votefavprob2012==.
drop if surprise303==.
drop if supportdummy2012==.
drop if time2012==.
nl(diffagghap2012 =({d8=0}*votefavprob2012*surprise303+{d9=0}*votefavprob2012*surprise303*supportdummy2012)*exp({d21=0}*time2012))

///Overall 08 12///

//Diffeight/Partisan
restore
preserve 
drop if diffeight==.
drop if abspart==.
drop if surprise==.
drop if supportdummy==.
drop if timeoverall==.

nl(diffeight =({d8=0}*abspart*surprise+{d9=0}*abspart*surprise*supportdummy)*exp({d21=0}*timeoverall)), cluster(case_id)

//Diffeight/Probvote
restore
preserve 
drop if diffeight==.
drop if votefavprob==.
drop if surprise==.
drop if supportdummy==.
drop if timeoverall==.
nl(diffeight=({d8=0}*votefavprob*surprise+{d9=0}*votefavprob*surprise*supportdummy)*exp({d21=0}*timeoverall)), cluster(case_id)

//Agghap/Partisan
restore
preserve 
drop if diffagghap==.
drop if votefavprob==.
drop if surprise==.
drop if supportdummy==.
drop if timeoverall==.
nl(diffagghap =({d8=0}*votefavprob*surprise+{d9=0}*votefavprob*surprise*supportdummy)*exp({d21=0}*timeoverall)), cluster(case_id)

//Agghap/Probvote
restore
preserve 
drop if diffagghap==.
drop if votefavprob==.
drop if surprise==.
drop if supportdummy==.
drop if timeoverall==.
nl(diffagghap =({d8=0}*votefavprob*surprise+{d9=0}*votefavprob*surprise*supportdummy)*exp({d21=0}*timeoverall)), cluster(case_id)

