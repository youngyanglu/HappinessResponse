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

///Robustness votefavprob Part A///

///2008///

	///RA1-RA3///
		
	preserve

	drop if diffeight2008==.
	drop if supportdummy2008==.
	drop if votefavprob2008==.
	drop if surprise39==.
	drop if time2008==.


//nl(diffeight2008={d0=0}+{d1=0}*supportdummy2008+{d2=0}*votefavprob2008+{d3=0}*surprise39+{d4=0}*supportdummy2008*votefavprob2008+/*
//*/{d5=0}*supportdummy2008*surprise39+{d6=0}*votefavprob2008*surprise39+{d7=0}*/*
//*/votefavprob2008*surprise39*supportdummy2008+({d8=0}*votefavprob2008*surprise39+{d9=0}*votefavprob2008*/*
//*/surprise39*supportdummy2008+{d10=0}+{d11=0}*supportdummy2008+{d12=0}*votefavprob2008+{d13=0}*/*
//*/surprise39+{d14=0}*supportdummy2008*votefavprob2008+{d15=0}*supportdummy2008*surprise39+{d16=0}*votefavprob2008^2/*
//*/+{d17=0}*surprise39^2+{d18=0}*votefavprob2008^2*supportdummy2008+{d19=0}*surprise39^2*supportdummy2008)*exp({d20=0}/*
//*/+{d21=0}*time2008+{d22=0}*time2008*supportdummy2008+{d23=0}*time2008*votefavprob2008+{d24=0}*time2008*surprise39/*
//*/+{d25=0}*time2008*votefavprob2008*supportdummy2008+{d26=0}*time2008*surprise39*supportdummy2008+{d27=0}*time2008*/*
//*/surprise39*votefavprob2008+{d28=0}*time2008*surprise39*votefavprob2008*supportdummy2008)), cluster(case_id)

//nl(diffeight2008={d0=0}+{d1=0}*supportdummy2008+{d2=0}*votefavprob2008+{d3=0}*surprise39+{d4=0}*supportdummy2008*abspa/*
//*/rt2008+{d5=0}*supportdummy2008*surprise39+{d6=0}*votefavprob2008*surprise39+{d7=0}*votefavprob2008*surprise39*supportdummy/*
//*/2008+({d8=0}*votefavprob2008*surprise39+{d9=0}*votefavprob2008*surprise39*supportdummy2008)*exp({d21=0}*adjtime2008)), clu/*
//*/ster(case_id)

//nl(diffeight2008={d0=2.157388}+{d1=-2.793502}*supportdummy2008+({d8=-226}*votefavprob2008*surprise39+{d9=350}*votefavprob2008*/*
//*/surprise39*supportdummy2008+{d10=-188}+{d11=222}*supportdummy2008+{d12=401}*votefavprob2008+{d13=230.896}*surprise39/*
//*/+{d14=-421}*supportdummy2008*votefavprob2008+{d15=-376.212}*supportdummy2008*surprise39+{d16=-232}*votefavprob2008^2+{d17=-89.34898}*/*
//*/surprise39^2+{d18=221}*votefavprob2008^2*supportdummy2008+{d19=194}*surprise39^2*supportdummy2008)*exp({d21=-1.3948}*time2008)), eps(0.001)

//nl(diffeight2008={d2=-2.121681}*votefavprob2008+{d4=5.177406}*supportdummy2008*votefavprob2008+({d8=-226}*votefavprob2008*surprise39+/*
//*/{d9=350}*votefavprob2008*surprise39*supportdummy2008+{d10=-188}+{d11=222}*supportdummy2008+{d12=401}*votefavprob2008+{d13=230.896}*/*
//*/surprise39+{d14=-421}*supportdummy2008*votefavprob2008+{d15=-376.212}*supportdummy2008*surprise39+{d16=-232}*votefavprob2008^2+{d17=-89.34898}*/*
//*/surprise39^2+{d18=221}*votefavprob2008^2*supportdummy2008+{d19=194}*surprise39^2*supportdummy2008)*exp({d21=-1.3948}*time2008)), eps(0.001)

//nl(diffeight2008=({d8=-226}*votefavprob2008*surprise39+{d9=350}*votefavprob2008*surprise39*supportdummy2008+{d10=-188}+{d11=222}*supportdummy2008+/*
//*/{d12=401}*votefavprob2008+{d13=230.896}*surprise39+{d14=-421}*supportdummy2008*votefavprob2008+{d15=-376.212}*supportdummy2008*surprise39+{d16=-232}*/*
//*/votefavprob2008^2+{d17=-89.34898}*surprise39^2+{d18=221}*votefavprob2008^2*supportdummy2008+{d19=194}*surprise39^2*supportdummy2008)*exp({d21=-1.3948}*time2008)), eps(0.001)

	///with Adjtime///
	
	restore
	preserve
	
	drop if diffeight2008==.
	drop if supportdummy2008==.
	drop if votefavprob2008==.
	drop if surprise39==.
	drop if adjtime2008==.
	
nl(diffeight2008={d0=2.157388}+{d1=-2.793502}*supportdummy2008+({d8=-226}*votefavprob2008*surprise39+{d9=350}*votefavprob2008*/*
*/surprise39*supportdummy2008+{d10=-188}+{d11=222}*supportdummy2008+{d12=401}*votefavprob2008+{d13=230.896}*surprise39+{d14=-421}*/*
*/supportdummy2008*votefavprob2008+{d15=-376.212}*supportdummy2008*surprise39+{d16=-232}*votefavprob2008^2+{d17=-89.34898}*surprise39^2+/*
*/{d18=221}*votefavprob2008^2*supportdummy2008+{d19=194}*surprise39^2*supportdummy2008)*exp({d21=-1.3948}*adjtime2008)), cluster(case_id)

nl(diffeight2008={d2=-2.121681}*votefavprob2008+{d4=5.177406}*supportdummy2008*votefavprob2008+({d8=-226}*votefavprob2008*surprise39+{d9=350}*/*
*/votefavprob2008*surprise39*supportdummy2008+{d10=-188}+{d11=222}*supportdummy2008+{d12=401}*votefavprob2008+{d13=230.896}*surprise39+/*
*/{d14=-421}*supportdummy2008*votefavprob2008+{d15=-376.212}*supportdummy2008*surprise39+{d16=-232}*votefavprob2008^2+{d17=-89.34898}*/*
*/surprise39^2+{d18=221}*votefavprob2008^2*supportdummy2008+{d19=194}*surprise39^2*supportdummy2008)*exp({d21=-1.3948}*adjtime2008)),cluster(case_id)

nl(diffeight2008={d0=2.157388}+{d1=-2.793502}*supportdummy2008+{d2=-2.121681}*votefavprob2008+{d4=5.177406}*supportdummy2008*votefavprob2008+/*
*/({d8=-226}*votefavprob2008*surprise39+{d9=350}*votefavprob2008*surprise39*supportdummy2008+{d10=-188}+{d11=222}*supportdummy2008+{d12=401}*/*
*/votefavprob2008+{d13=230.896}*surprise39+{d14=-421}*supportdummy2008*votefavprob2008+{d15=-376.212}*supportdummy2008*surprise39+{d16=-232}*/*
*/votefavprob2008^2+{d17=-89.34898}*surprise39^2+{d18=221}*votefavprob2008^2*supportdummy2008+{d19=194}*surprise39^2*supportdummy2008)*/*
*/exp({d21=-1.3948}*adjtime2008)), cluster(case_id)

nl(diffeight2008=({d8=-226}*votefavprob2008*surprise39+{d9=350}*votefavprob2008*surprise39*supportdummy2008+{d10=-188}+{d11=222}*supportdummy2008/*
*/+{d12=401}*votefavprob2008+{d13=230.896}*surprise39+{d14=-421}*supportdummy2008*votefavprob2008+{d15=-376.212}*/*
*/supportdummy2008*surprise39+{d16=-232}*votefavprob2008^2+{d17=-89.34898}*surprise39^2+{d18=221}*votefavprob2008^2*supportdummy2008+/*
*/{d19=194}*surprise39^2*supportdummy2008)*exp({d21=-1.3948}*adjtime2008)), cluster(case_id)

	restore
	preserve 
	
	drop if diffeight2008==.
	drop if supportdummy2008==.
	drop if votefavprob2008==.
	drop if surprise39==.
	drop if adjtime2008==.
	
	///RA4///
	
	///with Adjtime///


nl(diffeight2008={d0=0}+{d1=0}*supportdummy2008+({d8=0}*votefavprob2008*surprise39+{d9=0}*votefavprob2008*surprise39*supportdummy2008)*/*
*/exp({d20=0}+{d21=0}*adjtime2008+{d22=0}*adjtime2008*supportdummy2008+{d23=0}*adjtime2008*votefavprob2008+{d24=0}*adjtime2008*/*
*/surprise39+{d25=0}*adjtime2008*votefavprob2008*supportdummy2008+{d26=0}*adjtime2008*surprise39*supportdummy2008+{d27=0}*/*
*/adjtime2008*surprise39*votefavprob2008+{d28=0}*adjtime2008*surprise39*votefavprob2008*supportdummy2008)), cluster(case_id)

nl(diffeight2008={d2=0}*votefavprob2008+{d4=0}*supportdummy2008*votefavprob2008+({d8=0}*votefavprob2008*surprise39+{d9=0}*votefavprob2008*/*
*/surprise39*supportdummy2008)*exp({d20=0}+{d21=0}*adjtime2008+{d22=0}*adjtime2008*supportdummy2008+{d23=0}*adjtime2008*/*
*/votefavprob2008+{d24=0}*adjtime2008*surprise39+{d25=0}*adjtime2008*votefavprob2008*supportdummy2008+{d26=0}*adjtime2008*surprise39*/*
*/supportdummy2008+{d27=0}*adjtime2008*surprise39*votefavprob2008+{d28=0}*adjtime2008*surprise39*votefavprob2008*supportdummy2008)), cluster(case_id)

nl(diffeight2008={d0=0}+{d1=0}*supportdummy2008+{d2=0}*votefavprob2008+{d4=0}*supportdummy2008*votefavprob2008+({d8=0}*votefavprob2008*/*
*/surprise39+{d9=0}*votefavprob2008*surprise39*supportdummy2008)*exp({d20=0}+{d21=0}*adjtime2008+{d22=0}*adjtime2008*/*
*/supportdummy2008+{d23=0}*adjtime2008*votefavprob2008+{d24=0}*adjtime2008*surprise39+{d25=0}*adjtime2008*votefavprob2008*supportdummy2008/*
*/+{d26=0}*adjtime2008*surprise39*supportdummy2008+{d27=0}*adjtime2008*surprise39*votefavprob2008+{d28=0}*adjtime2008*surprise39*votefavprob2008*supportdummy2008)), cluster(case_id)

nl(diffeight2008=({d8=0}*votefavprob2008*surprise39+{d9=0}*votefavprob2008*surprise39*supportdummy2008)*exp({d20=0}+{d21=0}*/*
*/adjtime2008+{d22=0}*adjtime2008*supportdummy2008+{d23=0}*adjtime2008*votefavprob2008+{d24=0}*adjtime2008*surprise39+{d25=0}*adjtime2008*/*
*/votefavprob2008*supportdummy2008+{d26=0}*adjtime2008*surprise39*supportdummy2008+{d27=0}*adjtime2008*surprise39*votefavprob2008/*
*/+{d28=0}*adjtime2008*surprise39*votefavprob2008*supportdummy2008)), cluster(case_id)


///2012///

	///RA1-3///
	
	restore
	preserve 
	
	drop if diffeight2012==.
	drop if supportdummy2012==.
	drop if votefavprob2012==.
	drop if surprise303==.
	drop if time2012==.
	
//nl(diffeight2012={d0=0}+{d1=0}*supportdummy2012+{d2=0}*votefavprob2012+{d3=0}*surprise303+{d4=0}*/*
//*/supportdummy2012*votefavprob2012+{d5=0}*supportdummy2012*surprise303+{d6=0}*votefavprob2012*surprise303+{d7=0}*/*
//*/votefavprob2012*surprise303*supportdummy2012+({d8=0}*votefavprob2012*surprise303+{d9=0}*votefavprob2012*/*
//*/surprise303*supportdummy2012+{d10=0}+{d11=0}*supportdummy2012+{d12=0}*votefavprob2012+{d13=0}*/*
//*/surprise303+{d14=0}*supportdummy2012*votefavprob2012+{d15=0}*supportdummy2012*surprise303+{d16=0}*votefavprob2012^2/*
//*/+{d17=0}*surprise303^2+{d18=0}*votefavprob2012^2*supportdummy2012+{d19=0}*surprise303^2*supportdummy2012)*exp({d20=0}/*
//*/+{d21=0}*time2012+{d22=0}*time2012*supportdummy2012+{d23=0}*time2012*votefavprob2012+{d24=0}*time2012*surprise303/*
//*/+{d25=0}*time2012*votefavprob2012*supportdummy2012+{d26=0}*time2012*surprise303*supportdummy2012+{d27=0}*time2012*/*
//*/surprise303*votefavprob2012+{d28=0}*time2012*surprise303*votefavprob2012*supportdummy2012)), cluster(case_id)

nl(diffeight2012={d0=0}+{d1=0}*supportdummy2012+{d2=0}*votefavprob2012+{d3=0}*surprise303+{d4=0}*supportdummy2012*votefavprob2012/*
*/+{d5=0}*supportdummy2012*surprise303+{d6=0}*votefavprob2012*surprise303+{d7=0}*votefavprob2012*surprise303*supportdummy2012/*
*/+({d8=0}*votefavprob2012*surprise303+{d9=0}*votefavprob2012*surprise303*supportdummy2012)*exp({d21=0}*time2012)), cluster(case_id)

nl(diffeight2012={d0=0}+{d1=0}*supportdummy2012+{d2=0}*votefavprob2012+{d4=0}*supportdummy2012*votefavprob2012+({d8=0}*votefavprob2012*/*
*/surprise303+{d9=0}*votefavprob2012*surprise303*supportdummy2012+{d10=0}+{d11=0}*supportdummy2012+{d12=0}*votefavprob2012+{d13=0}*/*
*/surprise303+{d14=0}*supportdummy2012*votefavprob2012+{d15=0}*supportdummy2012*surprise303+{d16=0}*votefavprob2012^2+{d17=0}*/*
*/surprise303^2+{d18=0}*votefavprob2012^2*supportdummy2012+{d19=0}*surprise303^2*supportdummy2012)*exp({d21=0}*time2012)), cluster(case_id)

nl(diffeight2012={d0=0}+{d1=0}*supportdummy2012+({d8=0}*votefavprob2012*surprise303+{d9=0}*votefavprob2012*surprise303*supportdummy2012+/*
*/{d10=0}+{d11=0}*supportdummy2012+{d12=0}*votefavprob2012+{d13=0}*surprise303+{d14=0}*supportdummy2012*votefavprob2012/*
*/+{d15=0}*supportdummy2012*surprise303+{d16=0}*votefavprob2012^2+{d17=0}*surprise303^2+{d18=0}*votefavprob2012^2*supportdummy2012/*
*/+{d19=0}*surprise303^2*supportdummy2012)*exp({d21=0}*time2012)), cluster(case_id)

nl(diffeight2012={d2=0}*votefavprob2012+{d4=0}*supportdummy2012*votefavprob2012+({d8=0}*votefavprob2012*surprise303+{d9=0}*/*
*/votefavprob2012*surprise303*supportdummy2012+{d10=0}+{d11=0}*supportdummy2012+{d12=0}*votefavprob2012+{d13=0}*surprise303+{d1/*
*/4=0}*supportdummy2012*votefavprob2012+{d15=0}*supportdummy2012*surprise303+{d16=0}*votefavprob2012^2+{d17=0}*surprise303^2/*
*/+{d18=0}*votefavprob2012^2*supportdummy2012+{d19=0}*surprise303^2*supportdummy2012)*exp({d21=0}*time2012)), cluster(case_id)

nl(diffeight2012=({d8=0}*votefavprob2012*surprise303+{d9=0}*votefavprob2012*surprise303*supportdummy2012+{d10=0}+{d11=0}*/*
*/supportdummy2012+{d12=0}*votefavprob2012+{d13=0}*surprise303+{d14=0}*supportdummy2012*votefavprob2012+{d15=0}*supportdummy2012*/*
*/surprise303+{d16=0}*votefavprob2012^2+{d17=0}*surprise303^2+{d18=0}*votefavprob2012^2*supportdummy2012+{d19=0}*surprise303^2*/*
*/supportdummy2012)*exp({d21=0}*time2012)), cluster(case_id)

nl(diffeight={d0=0}+{d1=0}*supportdummy+{d2=0}*votefavprob+{d4=0}*supportdummy*votefavprob+({d8=0}*votefavprob*surprise+{d9=0}*/*
*/votefavprob*surprise*supportdummy+{d10=0}+{d11=0}*supportdummy+{d12=0}*votefavprob+{d13=0}*surprise+{d14=0}*supportdummy*/*
*/votefavprob+{d15=0}*supportdummy*surprise+{d16=0}*votefavprob^2+{d17=0}*surprise^2+{d18=0}*votefavprob^2*supportdummy+{d19=0}*/*
*/surprise^2*supportdummy)*exp({d21=0}*timeoverall)), cluster(case_id)

	///RA4///
	

nl(diffeight2012={d0=0}+{d1=0}*supportdummy2012+({d8=0}*votefavprob2012*surprise303+{d9=0}*votefavprob2012*surprise303*/*
*/supportdummy2012)*exp({d20=0}+{d21=0}*time2012+{d22=0}*time2012*supportdummy2012+{d23=0}*time2012*votefavprob2012+{d24=0}*/*
*/time2012*surprise303+{d25=0}*time2012*votefavprob2012*supportdummy2012+{d26=0}*time2012*surprise303*supportdummy2012+/*
*/{d27=0}*time2012*surprise303*votefavprob2012+{d28=0}*time2012*surprise303*votefavprob2012*supportdummy2012)), cluster(case_id)

nl(diffeight2012={d2=0}*votefavprob2012+{d4=0}*supportdummy2012*votefavprob2012+({d8=0}*votefavprob2012*surprise303+{d9=0}*/*
*/votefavprob2012*surprise303*supportdummy2012)*exp({d20=0}+{d21=0}*time2012+{d22=0}*time2012*supportdummy2012+{d23=0}*time2012*/*
*/votefavprob2012+{d24=0}*time2012*surprise303+{d25=0}*time2012*votefavprob2012*supportdummy2012+{d26=0}*time2012*surprise303*/*
*/supportdummy2012+{d27=0}*time2012*surprise303*votefavprob2012+{d28=0}*time2012*surprise303*votefavprob2012*supportdummy2012)), cluster(case_id)

nl(diffeight2012={d0=0}+{d1=0}*supportdummy2012+{d2=0}*votefavprob2012+{d4=0}*supportdummy2012*votefavprob2012+({d8=0}*votefavprob2012*/*
*/surprise303+{d9=0}*votefavprob2012*surprise303*supportdummy2012)*exp({d20=0}+{d21=0}*time2012+{d22=0}*time2012*/*
*/supportdummy2012+{d23=0}*time2012*votefavprob2012+{d24=0}*time2012*surprise303+{d25=0}*time2012*votefavprob2012*supportdummy2012+/*
*/{d26=0}*time2012*surprise303*supportdummy2012+{d27=0}*time2012*surprise303*votefavprob2012+{d28=0}*time2012*surprise303*votefavprob2012*supportdummy2012)), cluster(case_id)

nl(diffeight2012=({d8=0}*votefavprob2012*surprise303+{d9=0}*votefavprob2012*surprise303*supportdummy2012)*exp({d20=0}+{d21=0}*time2012/*
*/+{d22=0}*time2012*supportdummy2012+{d23=0}*time2012*votefavprob2012+{d24=0}*time2012*surprise303+{d25=0}*time2012*votefavprob2012*/*
*/supportdummy2012+{d26=0}*time2012*surprise303*supportdummy2012+{d27=0}*time2012*surprise303*votefavprob2012/*
*/+{d28=0}*time2012*surprise303*votefavprob2012*supportdummy2012)), cluster(case_id)

///Overall///

	///RA1-3///
	
	restore
	preserve 
	
	drop if diffeight==.
	drop if supportdummy==.
	drop if votefavprob==.
	drop if surprise==.
	drop if adjtimeoverall==.

//nl(diffeight={d0=0}+{d1=0}*supportdummy+{d2=0}*votefavprob+{d3=0}*surprise+{d4=0}*supportdummy*votefavprob+{d5=0}*supportdummy*/*
//*/surprise+{d6=0}*votefavprob*surprise+{d7=0}*votefavprob*surprise*supportdummy+({d8=0}*votefavprob*surprise+{d9=0}*votefavprob*/*
//*/surprise*supportdummy+{d10=0}+{d11=0}*supportdummy+{d12=0}*votefavprob+{d13=0}*surprise+{d14=0}*supportdummy*votefavprob+/*
//*/{d15=0}*supportdummy*surprise+{d16=0}*votefavprob^2+{d17=0}*surprise^2+{d18=0}*votefavprob^2*supportdummy+{d19=0}*surprise/*
//*/^2*supportdummy)*exp({d20=0}+{d21=0}*timeoverall+{d22=0}*timeoverall*supportdummy+{d23=0}*timeoverall*votefavprob+{d24/=0}*/*
//*/timeoverall*surprise+{d25=0}*timeoverall*votefavprob*supportdummy+{d26=0}*timeoverall*surprise*supportdummy+{d27=0}*/*
//*/timeoverall*surprise*votefavprob+{d28=0}*timeoverall*surprise*votefavprob*supportdummy)), cluster(case_id)

nl(diffeight={d0=0}+{d1=0}*supportdummy+{d2=0}*votefavprob+{d3=0}*surprise+{d4=0}*supportdummy*votefavprob+{d5=0}*supportdummy*/*
*/surprise+{d6=0}*votefavprob*surprise+{d7=0}*votefavprob*surprise*supportdummy+({d8=0}*votefavprob*surprise+{d9=0}*votefavprob*surprise*/*
*/supportdummy)*exp({d21=0}*timeoverall)), cluster(case_id)

nl(diffeight={d0=0}+{d1=0}*supportdummy+({d8=0}*votefavprob*surprise+{d9=0}*votefavprob*surprise*supportdummy+{d10=0}+{d11=0}*/*
*/supportdummy+{d12=0}*votefavprob+{d13=0}*surprise+{d14=0}*supportdummy*votefavprob+{d15=0}*supportdummy*surprise+{d16=0}*/*
*/votefavprob^2+{d17=0}*surprise^2+{d18=0}*votefavprob^2*supportdummy+{d19=0}*surprise^2*supportdummy)*exp({d21=0}*timeoverall)), cluster(case_id)

nl(diffeight={d2=0}*votefavprob+{d4=0}*supportdummy*votefavprob+({d8=0}*votefavprob*surprise+{d9=0}*votefavprob*surprise*supportdummy/*
*/+{d10=0}+{d11=0}*supportdummy+{d12=0}*votefavprob+{d13=0}*surprise+{d14=0}*supportdummy*votefavprob+{d15=0}*supportdummy*/*
*/surprise+{d16=0}*votefavprob^2+{d17=0}*surprise^2+{d18=0}*votefavprob^2*supportdummy+{d19=0}*surprise^2*supportdummy)*exp({d21=0}*timeoverall)), cluster(case_id)

nl(diffeight=({d8=0}*votefavprob*surprise+{d9=0}*votefavprob*surprise*supportdummy+{d10=0}+{d11=0}*supportdummy+{d12=0}*votefavprob+/*
*/{d13=0}*surprise+{d14=0}*supportdummy*votefavprob+{d15=0}*supportdummy*surprise+{d16=0}*votefavprob^2+{d17=0}*surprise^2/*
*/+{d18=0}*votefavprob^2*supportdummy+{d19=0}*surprise^2*supportdummy)*exp({d21=0}*timeoverall)), cluster(case_id)

	///RA4///

nl(diffeight={d0=0}+{d1=0}*supportdummy+({d8=0}*votefavprob*surprise+{d9=0}*votefavprob*surprise*supportdummy)*exp({d20=0}+{d21=0}*/*
*/timeoverall+{d22=0}*timeoverall*supportdummy+{d23=0}*timeoverall*votefavprob+{d24=0}*timeoverall*surprise+{d25=0}*timeoverall*/*
*/votefavprob*supportdummy+{d26=0}*timeoverall*surprise*supportdummy+{d27=0}*timeoverall*surprise*votefavprob/*
*/+{d28=0}*timeoverall*surprise*votefavprob*supportdummy)), cluster(case_id)

nl(diffeight={d2=0}*votefavprob+{d4=0}*supportdummy*votefavprob+({d8=0}*votefavprob*surprise+{d9=0}*votefavprob*surprise*supportdummy)*/*
*/exp({d20=0}+{d21=0}*timeoverall+{d22=0}*timeoverall*supportdummy+{d23=0}*timeoverall*votefavprob+{d24=0}*timeoverall*/*
*/surprise+{d25=0}*timeoverall*votefavprob*supportdummy+{d26=0}*timeoverall*surprise*supportdummy+{d27=0}*timeoverall*/*
*/surprise*votefavprob+{d28=0}*timeoverall*surprise*votefavprob*supportdummy)), cluster(case_id)

nl(diffeight={d0=0}+{d1=0}*supportdummy+{d2=0}*votefavprob+{d4=0}*supportdummy*votefavprob+({d8=0}*votefavprob*surprise+{d9=0}*/*
*/votefavprob*surprise*supportdummy)*exp({d20=0}+{d21=0}*timeoverall+{d22=0}*timeoverall*supportdummy+{d23=0}*timeoverall*/*
*/votefavprob+{d24=0}*timeoverall*surprise+{d25=0}*timeoverall*votefavprob*supportdummy+{d26=0}*timeoverall*surprise*/*
*/supportdummy+{d27=0}*timeoverall*surprise*votefavprob+{d28=0}*timeoverall*surprise*votefavprob*supportdummy)), cluster(case_id)

nl(diffeight=({d8=0}*votefavprob*surprise+{d9=0}*votefavprob*surprise*supportdummy)*exp({d20=0}+{d21=0}*timeoverall+{d22=0}*/*
*/timeoverall*supportdummy+{d23=0}*timeoverall*votefavprob+{d24=0}*timeoverall*surprise+{d25=0}*timeoverall*votefavprob*supportdummy/*
*/+{d26=0}*timeoverall*surprise*supportdummy+{d27=0}*timeoverall*surprise*votefavprob+{d28=0}*timeoverall*surprise*votefavprob*supportdummy)), cluster(case_id)




