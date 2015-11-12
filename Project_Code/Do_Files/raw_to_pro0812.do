******************************************************************
* This do-file 
* 	reads in the APL 2008/2012 Election Data
*	Raw Data found here: https://alpdata.rand.org/index.php?page=data
* 	Creates variables used to run regressions
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

cap log close
set more off

///2008///


use "$raw_data/ALP_MS53_2015_10_29_11_46_41.dta", clear
merge 1:1 primarykeymerge using "$raw_data/ALP_MS39_2015_10_29_10_04_52.dta"
drop _merge

foreach num of numlist 39 53 {

	gen mod`num'_f001 = . 
	gen mod`num'_f002 = . 
	gen mod`num'_f003 = . 
	gen mod`num'_f004 = .
	replace mod`num'_f001 = 1 if ms`num'_f001== 1
	replace mod`num'_f001 = 0 if ms`num'_f001== 2 

	replace mod`num'_f002 = 0 if ms`num'_f002== 1
	replace mod`num'_f002 = 1 if ms`num'_f002== 2 

	replace mod`num'_f003 = 1 if ms`num'_f003== 1
	replace mod`num'_f003 = 0 if ms`num'_f003== 2 

	replace mod`num'_f004 = 0 if ms`num'_f004== 1
	replace mod`num'_f004 = 1 if ms`num'_f004== 2 
	gen agghapp`num'=25*(mod`num'_f001+mod`num'_f002+mod`num'_f003+mod`num'_f004)
}

gen diff2008=.
replace diff2008=agghapp53-agghapp39

gen expwinn_39 =.
replace expwinn_39 = 1 if ms39_p002_m == 2
replace expwinn_39 = 0 if ms39_p002_m == 1
replace expwinn_39 = 1 if ms39_p002_o == 1
replace expwinn_39 = 0 if ms39_p002_o == 2

gen obwinprob_39=.
replace obwinprob_39 = ms39_p003 if expwinn_39==1
replace obwinprob_39 = 100-ms39_p003 if expwinn_39==0

gen votefavprob2008= .
replace votefavprob2008=  ms39_p006a if  ms39_p006 == 1
replace votefavprob2008=  100-ms39_p006a if  ms39_p006 == 2

gen aggexputilchange39= votefavprob2008/obwinprob_39

foreach num of numlist 39 53 {
	gen eightslhapp`num'= (9-ms`num'_f005)*12.5 
 }

gen diffeight2008=.
replace diffeight2008=eightslhapp53-eightslhapp39

gen polaff_39 = .
replace polaff_39 = -2 if  ms39_p001 == 1
replace polaff_39 = 2 if  ms39_p001 == 2
replace polaff_39 = -3 if ms39_p001r == 1
replace polaff_39 = 3 if ms39_p001d == 1
replace polaff_39 = -1 if ms39_p001o == 1
replace polaff_39 = 1 if ms39_p001o == 2

split  ms53_tsstart, generate(timestamp53)
split  timestamp531, generate(date53_) parse(-)

gen date53_3n = real(date53_3)
gen date53_2n = real(date53_2)
gen date53_1n = real(date53_1)

gen time2008=.

replace time2008 = date53_3n-4 if date53_2n==11
replace time2008= 26+date53_3n if date53_2n==12
replace time2008= 57+date53_3n if date53_2n==1
replace time2008= 87+date53_3n if date53_2n==2
replace time2008= 115+date53_3n if date53_2n==3

gen votedummy39= .
replace votedummy39 = 1 if  ms39_p006 == 2
replace votedummy39 = 0 if  ms39_p006 == 1

gen adjtime2008=.
replace adjtime2008 = time2008-1

gen dum3rep_2008=.
replace dum3rep_2008=1 if polaff_39==-3
replace dum3rep_2008=0 if polaff_39!=-3

gen dum2rep_2008=.
replace dum2rep_2008=1 if polaff_39==-2
replace dum2rep_2008=0 if polaff_39!=-2

gen dum1rep_2008=.
replace dum1rep_2008=1 if polaff_39==-1
replace dum1rep_2008=0 if polaff_39!=-1

gen dum3dem_2008=.
replace dum3dem_2008=1 if polaff_39==3
replace dum3dem_2008=0 if polaff_39!=3

gen dum2dem_2008=.
replace dum2dem_2008=1 if polaff_39==2
replace dum2dem_2008=0 if polaff_39!=2

gen dum1dem_2008=.
replace dum1dem_2008=1 if polaff_39==1
replace dum1dem_2008=0 if polaff_39!=1

gen surprise39=.
replace surprise39=(100-obwinprob_39)/100

gen intsur3rep_2008=.
replace intsur3rep_2008=surprise39*dum3rep_2008

gen intsur2rep_2008=.
replace intsur2rep_2008=surprise39*dum2rep_2008

gen intsur1rep_2008=.
replace intsur1rep_2008=surprise39*dum1rep_2008

gen intsur3dem_2008=.
replace intsur3dem_2008=surprise39*dum3dem_2008

gen intsur2dem_2008=.
replace intsur2dem_2008=surprise39*dum2dem_2008

gen intsur1dem_2008=.
replace intsur1dem_2008=surprise39*dum1dem_2008

gen partisanminustoplusone_2008=.
replace partisanminustoplusone_2008=polaff_39/3

gen partisanzerotoone_2008=.
replace partisanzerotoone_2008= (1+partisanminustoplusone_2008)/2 if partisanminustoplusone_2008<0

replace partisanzerotoone_2008= 0.5+partisanminustoplusone_2008/2 if partisanminustoplusone_2008>=0

gen surprisepartisaninteraction_2008=.
replace surprisepartisaninteraction_2008= partisanminustoplusone_2008*surprise39

gen supportdummy2008=. 
replace supportdummy2008=0 if ms39_p006==2
replace supportdummy2008=1 if ms39_p006==1

gen surprisesupportinteraction_2008=.
replace surprisesupportinteraction_2008=supportdummy2008*surprise39

gen partisansquared_2008=.
replace partisansquared_2008=partisanminustoplusone_2008^2

gen surprisepartisanintzeroone_2008=.
replace surprisepartisanintzeroone_2008=partisanzerotoone_2008*surprise39

gen partisanzeroonesquared_2008=.
replace partisanzeroonesquared_2008= partisanzerotoone_2008^2

gen abspart2008=abs(partisanminustoplusone_2008)

generate interabspartobamasup_2008=abspart2008*supportdummy2008

gen voteprob2008=  ms39_p006a/100

gen countryworse2008= (5-ms39_p009)/5

gen inttimesupportdummy_2008=.
replace inttimesupportdummy_2008= supportdummy2008*time2008

gen intvotefavsupport2008= .
replace intvotefavsupport2008= votefavprob2008*supportdummy2008

sort primarykeymerge
gen case_id = _n //generate case ID
save "$data_pro/clean2008", replace

///2012///


use "$raw_data/ALP_MS310_2015_10_29_11_48_18.dta", clear
merge 1:1 primarykeymerge using "$raw_data/ALP_MS309_2015_10_29_11_48_14.dta"
drop _merge
merge 1:1 primarykeymerge using "$raw_data/ALP_MS308_2015_10_29_11_48_07.dta"
drop _merge
merge 1:1 primarykeymerge using "$raw_data/ALP_MS304_2015_10_29_11_47_30.dta"
drop _merge
merge 1:1 primarykeymerge using "$raw_data/ALP_MS303_2015_10_29_11_47_20.dta"

foreach num of numlist 303 304 308 309 310  {
	gen mod`num'_f001 = . 
	gen mod`num'_f002 = . 
	gen mod`num'_f003 = . 
	gen mod`num'_f004 = .
	replace mod`num'_f001 = 1 if ms`num'_f001== 1
	replace mod`num'_f001 = 0 if ms`num'_f001== 2 
	replace mod`num'_f002 = 0 if ms`num'_f002== 1
	replace mod`num'_f002 = 1 if ms`num'_f002== 2 
	replace mod`num'_f003 = 1 if ms`num'_f003== 1
	replace mod`num'_f003 = 0 if ms`num'_f003== 2 
	replace mod`num'_f004 = 0 if ms`num'_f004== 1
	replace mod`num'_f004 = 1 if ms`num'_f004== 2 
	gen agghapp`num'=25*(mod`num'_f001+mod`num'_f002+mod`num'_f003+mod`num'_f004)
}


foreach num of numlist 304 308 309 310  {
	gen diff`num'_303=.
	replace diff`num'_303=agghapp`num'-agghapp303
}

//expected winner - 1 if democrat, 0 if republican
gen expwinn_303 =.
replace expwinn_303 = 1 if ms303_p002_m == 2
replace expwinn_303 = 0 if ms303_p002_m == 1
replace expwinn_303 = 1 if ms303_p002_o == 1
replace expwinn_303 = 0 if ms303_p002_o == 2
gen obwinprob_303=.
replace obwinprob_303 = ms303_p003 if expwinn_303==1
replace obwinprob_303 = 100-ms303_p003 if expwinn_303==0

gen votefavprob303 = .
replace votefavprob303 =  ms303_p006a if  ms303_p006 == 1
replace votefavprob303 =  100-ms303_p006a if  ms303_p006 == 2
rename votefavprob303 votefavprob2012

gen aggexputilchange303 = votefavprob2012/obwinprob_303

foreach num of numlist 303 304 308 309 310  {
	gen eightslhapp`num'= (9-ms`num'_f005)*12.5
 }

foreach num of numlist 304 308 309 310{
	gen diffeight`num'_303=.
	replace diffeight`num'_303=eightslhapp`num'-eightslhapp303
}

//republican is negative, democrat is positive
gen polaff_303 = .
replace polaff_303 = -2 if  ms303_p001 == 1
replace polaff_303 = 2 if  ms303_p001 == 2
replace polaff_303 = -3 if ms303_p001r == 1
replace polaff_303 = 3 if ms303_p001d == 1
replace polaff_303 = -1 if ms303_p001o == 1
replace polaff_303 = 1 if ms303_p001o == 2

foreach num of numlist 304 308 309 310 {
	split  ms`num'_tsstart, generate(timestamp`num')
	split  timestamp`num'1, generate(date`num'_) parse(-)
	gen time`num'=.
	gen date`num'_3n = real(date`num'_3)
	gen date`num'_1n = real(date`num'_1)
	gen date`num'_2n = real(date`num'_2)
	replace time`num' = date`num'_3n-6 if date`num'_2n==11
}

replace time309=24+date309_3n if date309_1n==2012 & date309_2n==12
replace time310=24+date310_3n if date310_1n==2012 & date310_2n==12

foreach num of numlist 304 308 309 310 {
	gen adjtime`num'=.
	replace adjtime`num' = time`num'-1
}

gen votedummy303 = .
replace votedummy303 = 1 if  ms303_p006 == 2
replace votedummy303 = 0 if  ms303_p006 == 1

foreach num of numlist 304 308 309 310  {
	replace diffeight`num'=eightslhapp`num'-eightslhapp303
 }

gen dum3rep_2012=.
replace dum3rep_2012=1 if polaff_303==-3
replace dum3rep_2012=0 if polaff_303!=-3

gen dum2rep_2012=.
replace dum2rep_2012=1 if polaff_303==-2
replace dum2rep_2012=0 if polaff_303!=-2

gen dum1rep_2012=.
replace dum1rep_2012=1 if polaff_303==-1
replace dum1rep_2012=0 if polaff_303!=-1

gen dum3dem_2012=.
replace dum3dem_2012=1 if polaff_303==3
replace dum3dem_2012=0 if polaff_303!=3

gen dum2dem_2012=.
replace dum2dem_2012=1 if polaff_303==2
replace dum2dem_2012=0 if polaff_303!=2

gen dum1dem_2012=.
replace dum1dem_2012=1 if polaff_303==1
replace dum1dem_2012=0 if polaff_303!=1

gen surprise303=.
replace surprise303=(100-obwinprob_303)/100

gen intsur3rep_2012=.
replace intsur3rep_2012=surprise303*dum3rep_2012

gen intsur2rep_2012=.
replace intsur2rep_2012=surprise303*dum2rep_2012

gen intsur1rep_2012=.
replace intsur1rep_2012=surprise303*dum1rep_2012

gen intsur3dem_2012=.
replace intsur3dem_2012=surprise303*dum3dem_2012

gen intsur2dem_2012=.
replace intsur2dem_2012=surprise303*dum2dem_2012

gen intsur1dem_2012=.
replace intsur1dem_2012=surprise303*dum1dem_2012

gen partisanminustoplusone_2012=.
replace partisanminustoplusone_2012=polaff_303/3

gen partisanzerotoone_2012=.
replace partisanzerotoone_2012= (1+partisanminustoplusone_2012)/2 if partisanminustoplusone_2012<0

replace partisanzerotoone_2012= 0.5+partisanminustoplusone_2012/2 if partisanminustoplusone_2012>=0

gen surprisepartisaninteraction_2012=.
replace surprisepartisaninteraction_2012= partisanminustoplusone_2012*surprise303

gen supportdummy2012=.
replace supportdummy2012=0 if ms303_p006==2
replace supportdummy2012=1 if ms303_p006==1

gen surprisesupportinteraction_2012=.
replace surprisesupportinteraction_2012=supportdummy2012*surprise303

gen partisansquared_2012=.
replace partisansquared_2012=partisanminustoplusone_2012^2

gen surprisepartisanintzeroone_2012=.
replace surprisepartisanintzeroone_2012=partisanzerotoone_2012*surprise303

gen partisanzeroonesquared_2012=.
replace partisanzeroonesquared_2012= partisanzerotoone_2012^2

gen abspart2012=abs(partisanminustoplusone_2012)

gen interabspartobamasup_2012=abspart2012*supportdummy2012

gen intvotefavsupport2012= .
replace intvotefavsupport2012= votefavprob2012*supportdummy2012

sort primarykeymerge
gen case_id = _n //generate case ID
save "$data_pro/clean2012", replace

