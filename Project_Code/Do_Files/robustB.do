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

///Robust B///

///2008///

drop if diffeight2008==.
drop if supportdummy2008==.
drop if abspart2008==.
drop if surprise39==.
drop if adjtime2008==.

save "$data_pro/combined0812_nl08", replace

/*Strong Rep*/

preserve 
drop if dum3rep_2008==0.


nl (diffeight2008={d0=0}+{d1=0}*supportdummy2008+({d2=0}*abspart2008*surprise39+{d3=0}*abspart2008*surprise39*supportdummy2008)*exp({d4=0}*(adjtime2008))), cluster(case_id)

/*Med Rep*/

restore
preserve

drop if dum2rep_2008==0.

nl (diffeight2008={d0=0}+{d1=0}*supportdummy2008+({d2=0}*abspart2008*surprise39+{d3=0}*abspart2008*surprise39*supportdummy2008)*exp({d4=0}*(adjtime2008))), cluster(case_id)
nl (diffeight2008={d0=0}+{d1=0}*supportdummy2008+({d2=0}*abspart2008*surprise39+{d3=0}*abspart2008*surprise39*supportdummy2008)*exp({d4=0}*(time2008))), cluster(case_id)

/*Weak Rep*/

restore
preserve

drop if dum1rep_2008==0.


nl (diffeight2008={d0=0}+{d1=0}*supportdummy2008+({d2=0}*abspart2008*surprise39+{d3=0}*abspart2008*surprise39*supportdummy2008)*exp({d4=0}*(adjtime2008))), cluster(case_id)
nl (diffeight2008={d0=0}+{d1=0}*supportdummy2008+({d2=0}*abspart2008*surprise39+{d3=0}*abspart2008*surprise39*supportdummy2008)*exp({d4=0}*(time2008))), cluster(case_id)

/*Strong Dem*/

restore
preserve

drop if dum3dem_2008==0.


nl (diffeight2008={d0=0}+{d1=0}*supportdummy2008+({d2=0}*abspart2008*surprise39+{d3=0}*abspart2008*surprise39*supportdummy2008)*exp({d4=0}*(time2008))), cluster(case_id)
nl (diffeight2008={d0=0}+{d1=0}*supportdummy2008+({d2=0}*abspart2008*surprise39+{d3=0}*abspart2008*surprise39*supportdummy2008)*exp({d4=0}*(adjtime2008))), cluster(case_id)

/*Med Dem*/

restore
preserve

drop if dum2dem_2008==0.

nl (diffeight2008={d0=0}+{d1=0}*supportdummy2008+({d2=0}*abspart2008*surprise39+{d3=0}*abspart2008*surprise39*supportdummy2008)*exp({d4=0}*(adjtime2008))), cluster(case_id)
nl (diffeight2008={d0=0}+{d1=0}*supportdummy2008+({d2=0}*abspart2008*surprise39+{d3=0}*abspart2008*surprise39*supportdummy2008)*exp({d4=0}*(time2008))), cluster(case_id)

/*Weak Dem*/

restore

drop if dum1dem_2008==0.


nl (diffeight2008={d0=0}+{d1=0}*supportdummy2008+({d2=0}*abspart2008*surprise39+{d3=0}*abspart2008*surprise39*supportdummy2008)*exp({d4=0}*(time2008))), cluster(case_id)
nl (diffeight2008={d0=0}+{d1=0}*supportdummy2008+({d2=0}*abspart2008*surprise39+{d3=0}*abspart2008*surprise39*supportdummy2008)*exp({d4=0}*(adjtime2008))), cluster(case_id)


///2012///

use "$data_pro/combined0812", clear

drop if diffeight2012==.
drop if supportdummy2012==.
drop if abspart2012==.
drop if surprise303==.
drop if time2012==.

save "$data_pro/combined0812_nl12", replace


/*Strong Rep*/
preserve 
drop if dum3rep_2012==0.

nl (diffeight2012={d0=0}+{d1=0}*supportdummy2012+({d2=0}*abspart2012*surprise303+{d3=0}*abspart2012*surprise303*supportdummy2012)*exp({d4=0}*(time2012))), cluster(case_id)

/*Med Rep*/

restore
preserve

drop if dum2rep_2012==0.

nl (diffeight2012={d0=0}+{d1=0}*supportdummy2012+({d2=0}*abspart2012*surprise303+{d3=0}*abspart2012*surprise303*supportdummy2012)*exp({d4=0}*(time2012))), cluster(case_id)

/*Weak Rep*/

restore
preserve

drop if dum1rep_2012==0.

nl (diffeight2012={d0=0}+{d1=0}*supportdummy2012+({d2=0}*abspart2012*surprise303+{d3=0}*abspart2012*surprise303*supportdummy2012)*exp({d4=0}*(time2012))), cluster(case_id)

/*Strong Dem*/

restore
preserve

drop if dum3dem_2012==0.

nl (diffeight2012={d0=0}+{d1=0}*supportdummy2012+({d2=0}*abspart2012*surprise303+{d3=0}*abspart2012*surprise303*supportdummy2012)*exp({d4=0}*(time2012))), cluster(case_id)

/*Med Dem*/

restore
preserve

drop if dum2dem_2012==0.

nl (diffeight2012={d0=0}+{d1=0}*supportdummy2012+({d2=0}*abspart2012*surprise303+{d3=0}*abspart2012*surprise303*supportdummy2012)*exp({d4=0}*(time2012))), cluster(case_id)

/*Weak Dem*/

restore

drop if dum1dem_2012==0.

nl (diffeight2012={d0=0}+{d1=0}*supportdummy2012+({d2=0}*abspart2012*surprise303+{d3=0}*abspart2012*surprise303*supportdummy2012)*exp({d4=0}*(time2012))), cluster(case_id)



///Combined 08 and 12///

use "$data_pro/combined0812", clear


drop if diffeight==.
drop if supportdummy==.
drop if abspart==.
drop if surprise==.
drop if timeoverall==.

save "$data_pro/combined0812_nl", replace

/*Strong Rep*/

preserve

drop if dum3rep==0.

nl (diffeight={d0=0}+{d1=0}*supportdummy+({d2=0}*abspart*surprise+{d3=0}*abspart*surprise*supportdummy)*exp({d4=0}*(timeoverall))), cluster(case_id)

/*Med Rep*/

restore
preserve

drop if dum2rep==0.

nl (diffeight={d0=0}+{d1=0}*supportdummy+({d2=0}*abspart*surprise+{d3=0}*abspart*surprise*supportdummy)*exp({d4=0}*(timeoverall))), cluster(case_id)

/*Weak Rep*/

restore
preserve

drop if dum1rep==0.

nl (diffeight={d0=0}+{d1=0}*supportdummy+({d2=0}*abspart*surprise+{d3=0}*abspart*surprise*supportdummy)*exp({d4=0}*(timeoverall))), cluster(case_id)

/*Strong Dem*/

restore
preserve

drop if dum3dem==0.

nl (diffeight={d0=0}+{d1=0}*supportdummy+({d2=0}*abspart*surprise+{d3=0}*abspart*surprise*supportdummy)*exp({d4=0}*(timeoverall))), cluster(case_id)

/*Med Dem*/

restore
preserve

drop if dum2dem==0.

nl (diffeight={d0=0}+{d1=0}*supportdummy+({d2=0}*abspart*surprise+{d3=0}*abspart*surprise*supportdummy)*exp({d4=0}*(timeoverall))), cluster(case_id)

/*Weak Dem*/

restore
preserve

drop if dum1dem==0.

nl (diffeight={d0=0}+{d1=0}*supportdummy+({d2=0}*abspart*surprise+{d3=0}*abspart*surprise*supportdummy)*exp({d4=0}*(timeoverall))), cluster(case_id)



