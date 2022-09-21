
libname SASDATA "/home/u62247871/data/raw";

/* import schooldata into school */
data school;
	set SASDATA.schooldata;
run;



/* Running one-way ANOVA */
PROC MIXED
	DATA=school METHOD=TYPE3; 	/* setting the dataset="school" */
	CLASS class;				/* "class" parameter is treated as a categorical */
	MODEL iqv= /SOLUTION CL; 	/* "iqv" is the result we want to calculate for */
								/* SOLUTION and CL are the thigns we want to return */
	RANDOM class; 				/* "class" is treated as a random variable */
RUN;

/* "solution for fixed effects" is giving the mean */





/* import schooldata into school */
data iq;
	set SASDATA.iq_data_sas_tutorial;
run;


