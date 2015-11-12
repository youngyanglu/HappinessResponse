******************************************************************
* This do-file 
* 	reads in the APL 2008/2012 Election Data
* 	Appends multiple waves of data for 2012 APL election data
* 	Created: 18/03/2015, by Collin Raymond and Yang Lu
* 	This version:
******************************************************************

/*
EDIT THE cd and globals BEFORE RUNNING THIS FILE
*/


cd "/Users/Young/Dropbox/Collin/Project_Code"

global raw_data     "/Users/Young/Dropbox/Collin/Project_Code/Raw_Data"
global data_pro 	"/Users/Young/Dropbox/Collin/Project_Code/Output_Data"

cap log close
set more off
 
/*Create 3 Waves of Data for 2012 representing 3 post-election surveys*/

use "$data_pro/clean2012", clear
gen wave2012=4
save "$data_pro/append1", replace

use "$data_pro/clean2012", clear
gen wave2012=9
save "$data_pro/append2", replace

use "$data_pro/clean2012", clear
gen wave2012=10
save "$data_pro/append3", replace

use "$data_pro/append1", clear
append using "$data_pro/append2"
append using "$data_pro/append3"

gen diffeight2012=.
replace diffeight2012=diffeight304_303 if wave2012==4
replace diffeight2012=diffeight309_303 if wave2012==9
replace diffeight2012=diffeight310_303 if wave2012==10

gen diffagghap2012=.
replace diffagghap2012=diff304_303 if wave2012==4
replace diffagghap2012=diff309_303 if wave2012==9
replace diffagghap2012=diff310_303 if wave2012==10

gen time2012=.
replace time2012=time304 if wave2012==4
replace time2012=time309 if wave2012==9
replace time2012=time310 if wave2012==10

gen adjtime2012=.
replace adjtime2012=time2012-1

gen inttimesupportdummy_2012=.
replace inttimesupportdummy_2012= time2012* supportdummy2012

gen yearwave= 2012
save "$data_pro/append12", replace

use "$data_pro/clean2008", clear
gen yearwave=2008
save "$data_pro/append08", replace

/*Create Data with 2008 and 2012's 3 Waves*/

append using "$data_pro/append12"

gen diffeight=.
replace diffeight=diffeight2008 if yearwave==2008
replace diffeight=diffeight2012 if yearwave==2012

gen diffagghap=.
replace diffagghap=diff2008 if yearwave==2008
replace diffagghap=diffagghap2012 if yearwave==2012

gen supportdummy=.
replace supportdummy=supportdummy2008 if yearwave==2008
replace supportdummy=supportdummy2012 if yearwave==2012

gen abspart=.
replace abspart=abspart2008 if yearwave==2008
replace abspart=abspart2012 if yearwave==2012

gen interabspartobamasup=.
replace interabspartobamasup= interabspartobamasup_2008 if yearwave==2008
replace interabspartobamasup= interabspartobamasup_2012 if yearwave==2012

gen timeoverall=.
replace timeoverall=time2008 if yearwave==2008
replace timeoverall=time2012 if yearwave==2012

gen surprise=.
replace surprise=surprise39 if yearwave==2008
replace surprise=surprise303 if yearwave==2012

gen surprisesupportinteraction=.
replace surprisesupportinteraction=surprisesupportinteraction_2008 if yearwave==2008
replace surprisesupportinteraction=surprisesupportinteraction_2012 if yearwave==2012

gen inttimesupportdummy=.
replace inttimesupportdummy=inttimesupportdummy_2008 if yearwave==2008
replace inttimesupportdummy=inttimesupportdummy_2012 if yearwave==2012

gen votefavprob=.
replace votefavprob=votefavprob2008 if yearwave==2008
replace votefavprob=votefavprob2012 if yearwave==2012

gen adjtimeoverall=.
replace adjtimeoverall=adjtime2008 if yearwave==2008
replace adjtimeoverall=adjtime2012 if yearwave==2012

gen intvotefavsupport= .
replace intvotefavsupport=intvotefavsupport2008 if yearwave==2008
replace intvotefavsupport=intvotefavsupport2012 if yearwave==2012

foreach num of numlist 1 2 3 {

gen dum`num'rep=.
replace dum`num'rep= dum`num'rep_2008 if yearwave==2008
replace dum`num'rep= dum`num'rep_2012 if yearwave==2012

gen dum`num'dem=.
replace dum`num'dem= dum`num'dem_2008 if yearwave==2008
replace dum`num'dem= dum`num'dem_2012 if yearwave==2012 
}

save "$data_pro/combined0812", replace

