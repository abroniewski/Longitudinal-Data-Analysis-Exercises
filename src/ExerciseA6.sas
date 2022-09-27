
/* Data analytical questions REML: */
/* Fit one-way random effects model with REML (see exercise A3) */
/*		A3: Perform a one-way ANOVA on the difference in language test scores for all children with class a random effect*/
/* • Estimate the model parameters */
/* • Obtain the confidence intervals */
/* • Calculate the intraclass correlation coefficient and a 95% confidence interval
/* • Calculate the total variability and a 95% confidence interval */


/* import data */
libname SASDATA "/home/u62247871/data/raw";

data school;
	set SASDATA.schooldata;
	diff_lang = post_lang - pre_lang;
run;


/* 	---------------
One-way random effects model with REML
	---------------
*/
PROC MIXED DATA=school METHOD=REML CL ASYCOV;
	CLASS class;
	/*	DDFM -> how we want degrees of freedom to be calculated. SAT is Satterthwaite’s method.
		OUTP -> saves the output to a variable PRED		*/
	MODEL diff_lang =  /SOLUTION CL DDFM=SAT OUTP=PRED;
	RANDOM class;
	TITLE "One-way random effects model with REML";
run;




/* MODEL RESULTS */
/*	Estimate the model parameters: mean of lang_diff = 6.6890 ADD VARIENCE for between + within */
/*	Obtain the confidence intervals: Lower=6.2460 Upper=7.1319 (with 95% confidence interval) */
/*	Calculate the intraclass correlation coefficient (ICC) and a 95% confidence interval: sigmaG/ (sigmaG+sigmaE)*/
/*	Calculate the total variability : mean is fixed, so variability comes only from the within + between variability. This only works because we assume everything in this population model is normally distributed.*/
/*		and a 95% confidence interval: need to recalculate the confidence interval -> output is the upper and lower limit
/*
Solution for fixed effects in results -> what is this representing?
What is total variability?
*/