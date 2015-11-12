******************************************************************
* This do-file 
* 	reads in the APL 08 and 12 Election Data
* 	Runs Non-Linear Baseline Regressions on Data
* 	Created: 18/03/2015, by Collin Raymond and Yang Lu
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
preserve

///Diffeight///

	///Partisanship///

	///2008///
	
	drop if diffeight2008==.
	drop if supportdummy2008==.
	drop if abspart2008==.
	drop if surprise39==.
	drop if time2008==.

	//this regression stil won't run, so I commented it out
	//nl (diffeight2008={d0=0}+{d1=0}*supportdummy2008+({d2=0}*abspart2008*surprise39+{d3=0}*abspart2008*surprise39*supportdummy2008)*exp({d4=0}*(time2008))), cluster(case_id)
	
	///2012///
	
	restore 
	preserve 
	
	drop if diffeight2012==.
	drop if supportdummy2012==.
	drop if abspart2012==.
	drop if surprise303==.
	drop if time2012==.
	
	nl (diffeight2012={d0=0}+{d1=0}*supportdummy2012+({d2=0}*abspart2012*surprise303+{d3=0}*abspart2012*surprise303*	supportdummy2012)*exp({d4=0}*(time2012))), cluster(case_id)

	///Overall///
	
	restore 
	preserve
	
	drop if diffeight==.
	drop if supportdummy==.
	drop if abspart==.
	drop if surprise==.
	drop if timeoverall==.
	
	nl (diffeight={d0=0}+{d1=0}*supportdummy+({d2=0}*abspart*surprise+{d3=0}*abspart*surprise*supportdummy)*	exp({d4=0}*(timeoverall))), cluster(case_id)

	///Probvote///

	///2008///
	
	restore 
	preserve
	
	drop if diffeight2008==.
	drop if supportdummy2008==.
	drop if votefavprob2008==.
	drop if surprise39==.
	drop if adjtime2008==.

	nl (diffeight2008={d0=0}+{d1=0}*supportdummy2008+({d2=0}*votefavprob2008*surprise39+{d3=0}*votefavprob2008*surprise39*supportdummy2008)*exp({d4=0}*(adjtime2008))), cluster(case_id)

	///2012///
	
	restore 
	preserve
	
	drop if diffeight2012==.
	drop if supportdummy2012==.
	drop if votefavprob2012==.
	drop if surprise303==.
	drop if adjtime2012==.

	nl (diffeight2012={d0=0}+{d1=0}*supportdummy2012+({d2=0}*votefavprob2012*surprise303+{d3=0}*votefavprob2012*surprise303*supportdummy2012)*exp({d4=0}*(adjtime2012))), cluster(case_id)

	///Overall///
	
	restore 
	preserve
	
	drop if diffeight==.
	drop if supportdummy==.
	drop if votefavprob==.
	drop if surprise==.
	drop if adjtimeoverall==.

	nl (diffeight={d0=0}+{d1=0}*supportdummy+({d2=0}*votefavprob*surprise+{d3=0}*votefavprob*surprise*supportdummy)*exp({d4=0}*(adjtimeoverall))), cluster(case_id)

///AggHap///

	///Partisanship///

	///2008///
	
	restore 
	preserve
	
	drop if diff2008==.
	drop if supportdummy2008==.
	drop if abspart2008==.
	drop if surprise39==.
	drop if time2008==.
	
	nl (diff2008 ={d0=0}+{d1=0}*supportdummy2008+({d2=0}*abspart2008*surprise39+{d3=0}*abspart2008*surprise39*supportdummy2008)*exp({d4=0}*(time2008))), cluster(case_id)

	///2012///
	
	restore 
	preserve
	
	drop if diffagghap2012==.
	drop if supportdummy2012==.
	drop if abspart2012==.
	drop if surprise303==.
	drop if time2012==.
	
	nl (diffagghap2012 ={d0=0}+{d1=0}*supportdummy2012+({d2=0}*abspart2012*surprise303+{d3=0}*abspart2012*surprise303*supportdummy2012)*exp({d4=0}*(time2012))), cluster(case_id)

	///Overall///
	
	restore 
	preserve
	
	drop if diffagghap==.
	drop if supportdummy==.
	drop if abspart==.
	drop if surprise==.
	drop if timeoverall==.
	
	nl (diffagghap={d0=0}+{d1=0}*supportdummy+({d2=0}*abspart*surprise+{d3=0}*abspart*surprise*supportdummy)*exp({d4=0}*(timeoverall))), cluster(case_id)

	restore 
