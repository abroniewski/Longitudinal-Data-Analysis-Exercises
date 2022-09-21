/* 	
create a library(location) called SASDATA that
can be used as a shrotcut to access data 	
*/
libname SASDATA "/home/u62247871/data/raw";

/* import schooldata into school a variable called school */
data school;
	set SASDATA.schooldata;
	diff_lang = post_lang - pre_lang;
run;





/* 	---------------
Create a one-way ANOVA
	---------------	
we use MIXED instead of ANOVA as the dataset is not
balanced (number of students is different in each class)
*/
PROC MIXED DATA=school METHOD=type3;
	CLASS class combi; /* here we set categorical variables */
	/* 	determine the post_lang as a result of class which is 
		nested within combi. We want to return the SOLUTION
		and set a CL (confidence limit)	*/
	MODEL diff_lang = combi;
	RANDOM class(combi); 	/* explicit about nested variable, but unnecessary	*/
	TITLE "One-way ANOVA";	/* title in the "reults" tab after running	*/
run;
	
	
	
	
/* 	---------------
Prediction of random effects
	---------------
Below is an example where I wanted to be explicit about the nested
variable "class". We need to use a more explicit syntax to do this.
BUT, as soon as we declare as nested variable, the type3 method of
estimation no longer works. We can change the method of calulating
estimators to ML (maximum liklihood) to get things working. We also
need to declare combi as being categorical (add to CLASS). Anything 
not in CLASS defaults to a continuous variable.
*/
PROC MIXED DATA=school METHOD=ML CL COVTEST;
	CLASS class combi girl;
	/*	DDFM -> how we want degrees of freedom to be calculated
			SAT is Satterthwaite’s method (aka a balanced approach)	
		OUTP -> saves the output to a variable PRED	
		Note: everything included on the right side of the equals sign
			is a fixed variable. The variables included after RANDOM are...
			random. Both fixed and random variables are used as the dependent
			variables for model building. I added "girl" as a fixed variables
			to see how it would respond	*/
	MODEL diff_lang = girl /SOLUTION CL DDFM=SAT OUTP=PRED;
	/*	We'll set the variable class as being random, and state
		that it is nested in the type of class (combi)	*/
/* 	RANDOM class; */
	RANDOM intercept/ subject=class(combi);		/* this is explicit way to express class(combi) */
	TITLE "Predicting Random Effects with Nested Variable [class(combi)]";
run;


/* 	---------------
Prediction of random effects
	---------------	
This is the "standard" way to do things
*/
PROC MIXED DATA=school METHOD=type3 CL COVTEST;
	CLASS class;
	/*	DDFM -> how we want degrees of freedom to be calculated
			SAT is Satterthwaite’s method (aka a balanced approach)	
		OUTP -> saves the output to a variable PRED		*/
	MODEL diff_lang =  /SOLUTION CL DDFM=SAT OUTP=prediction;
	/*	We'll set the variable class as being random, and state
		that it is nested in the type of class (combi)	*/
	RANDOM class;
	TITLE "Predicting Random Effects without Nested Variables";
run;




PROC MEANS DATA=prediction NOPRINT;
	BY class;
	VAR diff_lang pred;
	OUTPUT OUT=blups MEAN=diff_lang;
	WHERE diff_lang NE .;
run;




PROC SORT DATA=blups;
	BY diff_lang;
run;








