/*
Fit the two-way nested mixed effects model for the difference in language score using the ANOVA estimator
• Investigate the differences between TYPE 1 and TYPE 3 estimation
• Report the parameter estimates and their 95% confidence intervals
• Report the total variability and intraclass correlation coefficient with their 95%
confidence intervals
*/

/* 	---------------
Breaking the Problem Down
	---------------

two-way -> 2 factors will be used
nested -> 1 factor nested in the other (class is nested in combi (aka class type))
mixed effects -> factors are combination of random and fixed
ANOVA estimator -> estimators derived using the ANOVA method (e.g. type I or type III in SAS)
est. difference -> we can look at the results in the SOLUTION?
parameter estimates + confidence -> use CL to look at parameter confidence interval
total variability + correlation coefficient ->
*/

/* import data */
libname SASDATA "/home/u62247871/data/raw";

data school;
	set SASDATA.schooldata;
	diff_lang = post_lang - pre_lang;
run;


/* 	---------------
Two-way Nested ANOVA with Type I Estimators
	---------------	*/


PROC MIXED DATA=school METHOD=type1 COVTEST;
	CLASS class combi;
	MODEL diff_lang = combi /SOLUTION CL;
	RANDOM class(combi);
	TITLE "Two-way Nested ANOVA with Type I Estimators";
RUN;

/* 	---------------
Two-way Nested ANOVA with Type III Estimators
	---------------	*/

PROC MIXED DATA=school METHOD=type3 COVTEST;
	CLASS class combi;
	MODEL diff_lang = combi /SOLUTION CL;
	RANDOM class(combi);
	TITLE "Two-way Nested ANOVA with Type I estimators";
RUN;


/*
	MODEL RESULTS
	1) Investigate the differences between TYPE 1 and TYPE 3 estimation:
		the mean and confidence interval of fixed(???) effects is same:
			class = 6.0355 [5.2760; 6.7951]
			combi = 1.0632 [0.1301; 1.9962]
		the variance of class(combi) is the same:
			SS = 30608
			mean square = 165.448
			expected mean square = Var(Residual) + 18.253 Var(CLASS(COMBI)) + Q(COMBI)
		the variance of combi is DIFFERENT.
			TYPE 1:
				SS = 423.76
				mean square = 423.76
				expected mean square = Var(Residual) + 16.033 Var(CLASS(COMBI)) + Q(COMBI)(???)
				error = 0.8784 MS(CLASS(COMBI)) + 0.1216 MS(Residual)
			TYPE 3:
				SS = 767.66
				mean square = 767.66
				expected mean square = Var(Residual) + 12.647 Var(CLASS(COMBI))
				error = 0.6929 MS(CLASS(COMBI)) + 0.3071 MS(Residual)
	2) Report the parameter estimates and their 95% confidence intervals:
		see above
	3) Report the total variability and intraclass correlation coefficient with their 95% confidence intervals
		SSt for Type 1 and Type 3 are the same:
			7.3243+31.7593 [???]
			39.0836 [???]
		ICC = VAR(combi) / ( VAR(combi) + VAR(class) ) = 7.3243/39.0836
		ICC = 0.187

QUESTIONS
type 1 vs 3 -> fixed or random effect is same?
I expected mean of class to be different, as it is random
Q(COMBI)
upper lower bound of confidence interval for SSt and ICC

*/