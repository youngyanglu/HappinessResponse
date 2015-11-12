******************************************************************
* This do-file 
* 	reads in the APL 08 and 12 Election Data
* 	Runs Linear Baseline Regressions on Data
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

/// Partisanship && Diffeight///

/// 2008 Alone ///

reg diffeight2008 supportdummy2008, cluster(case_id) 
reg diffeight2008 supportdummy2008 abspart2008  interabspartobamasup_2008, cluster(case_id)
reg diffeight2008 abspart2008  interabspartobamasup_2008, cluster(case_id) 
reg diffeight2008 supportdummy2008 surprise39 surprisesupportinteraction_2008, cluster(case_id)
reg diffeight2008 surprise39 surprisesupportinteraction_2008, cluster(case_id)
reg diffeight2008 supportdummy2008  inttimesupportdummy_2008 time2008, cluster(case_id)

reg  diffeight2008 supportdummy2008  inttimesupportdummy_2008 adjtime2008, cluster(case_id) $adjtime


/// 2012 Alone ///

reg diffeight2012 supportdummy2012, cluster(case_id)
reg diffeight2012  abspart2012  interabspartobamasup_2012, cluster(case_id)
reg diffeight2012 supportdummy2012 surprise303 surprisesupportinteraction_2012, cluster(case_id)
reg diffeight2012 surprise303 surprisesupportinteraction_2012, cluster(case_id)
reg  diffeight2012 supportdummy2012  inttimesupportdummy_2012 time2012, cluster(case_id)

reg  diffeight2012 supportdummy2012  inttimesupportdummy_2012 adjtime2012, cluster(case_id) $adjtime


/// 08 and 12 Combined ///

reg diffeight supportdummy, cluster(case_id)
reg diffeight supportdummy abspart interabspartobamasup, cluster(case_id)
reg diffeight abspart interabspartobamasup, cluster(case_id)
reg diffeight supportdummy surprise surprisesupportinteraction, cluster(case_id)
reg diffeight surprise surprisesupportinteraction, cluster(case_id)
reg diffeight supportdummy  inttimesupportdummy timeoverall, cluster(case_id)

reg  diffeight2012 supportdummy2012  inttimesupportdummy_2012 adjtimeoverall, cluster(case_id) $adjtime


/// Partisanship && DiffAggHap///

/// 2008 Alone ///

reg diff2008 supportdummy2008, cluster(case_id)
reg diff2008 supportdummy2008 abspart2008  interabspartobamasup_2008, cluster(case_id)
reg diff2008 abspart2008  interabspartobamasup_2008, cluster(case_id)
reg diff2008 supportdummy2008 surprise39 surprisesupportinteraction_2008, cluster(case_id)
reg diff2008 surprise39 surprisesupportinteraction_2008, cluster(case_id)
reg diff2008 supportdummy2008  inttimesupportdummy_2008 time2008, cluster(case_id)

/// 2012 Alone ///

reg diffagghap2012 supportdummy2012, cluster(case_id)
reg diffagghap2012 supportdummy2012 abspart2012  interabspartobamasup_2012, cluster(case_id)
reg diffagghap2012  abspart2012  interabspartobamasup_2012, cluster(case_id)
reg  diffagghap2012 supportdummy2012  inttimesupportdummy_2012 time2012, cluster(case_id)

/// 08 and 12 Combined ///

reg diffagghap supportdummy, cluster(case_id)
reg diffagghap supportdummy abspart interabspartobamasup, cluster(case_id)
reg diffagghap abspart interabspartobamasup, cluster(case_id)
reg diffagghap supportdummy surprise surprisesupportinteraction, cluster(case_id)
reg diffagghap surprise surprisesupportinteraction, cluster(case_id)
reg  diffagghap supportdummy  inttimesupportdummy timeoverall, cluster(case_id)

/// ProbVote && Diffeight///

/// 2008 Alone ///

reg diffeight2008 supportdummy2008 votefavprob2008  intvotefavsupport2008, cluster(case_id)
reg diffeight2008 votefavprob2008  intvotefavsupport2008, cluster(case_id)

/// 2012 Alone ///

reg diffeight2012 supportdummy2012 votefavprob2012  intvotefavsupport2012, cluster(case_id)
reg diffeight2012  votefavprob2012  intvotefavsupport2012, cluster(case_id)

/// 08 and 12 Combined ///

reg diffeight supportdummy votefavprob intvotefavsupport, cluster(case_id)
reg diffeight votefavprob intvotefavsupport, cluster(case_id)

/// ProbVote && DiffAggHap///

/// 2008 Alone ///
reg diff2008 supportdummy2008 votefavprob2008  intvotefavsupport2008, cluster(case_id)
reg diff2008 votefavprob2008  intvotefavsupport2008, cluster(case_id)

/// 2012 Alone ///

reg diffagghap2012 supportdummy2012 votefavprob2012  intvotefavsupport2012, cluster(case_id)
reg diffagghap2012  votefavprob2012  intvotefavsupport2012, cluster(case_id)

/// 08 and 12 Combined ///

reg diffagghap supportdummy votefavprob intvotefavsupport, cluster(case_id)
reg diffagghap  votefavprob intvotefavsupport, cluster(case_id)




