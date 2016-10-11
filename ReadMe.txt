-------------------------------------
-    Pro SQL Reporting Services     -
-  Code Installations Instructions  -
-   Rodney Landrum, Shawn McGeHee, Walter Voytek   -
-------------------------------------

In order to run the reports used in this book, you will need to restore the
Pro_SSRS and HW_Analysis databases from the root folder of this download to your instance of
SQL Server (SS) 2008. In Chapter 10, we include a datamart database called
HW_Analysis to populate an Analysis Services cube Patient Referral. You can use the following 
instructions to attach both the Pro_SSRS and HW_Analysis databases. To restore the
Patient Referral cube, follow the instructions for "Restoring the Patient Referral Cube" section
of this document.

*********************************************************
* Restoring the Pro_SSRS and HW_ANalysis databases *
*********************************************************
Pro_SSRS

1.) Extract the contents of the zip file to a location on your SS 2005 system.
2.) If you are using Winzip, make sure you select to "Use Folder Names".
3.) On your SS 2008 server, open SS Management Studio.
4.) Connect to your server, navigate to Databases, right click the Databases folder
    and select Restore Database.
	The database must be named Pro_SSRS
5.) Select "From Device" and navigate to the Pro_SSRS.bak file you extracted in step 1.
6.) Click OK and the database should restore successfully and be ready for use for the book.

HW_Analysis

1.) Extract the contents of the zip file to a location on your SS 2008 system.
2.) If you are using Winzip, make sure you select to "Use Folder Names".
3.) On your SS 2008 server, open SS Management Studio.
4.) Connect to your server, navigate to Databases, right click the Databases folder 
    and select Restore Database.
	The Database name must be HW_Analysis
5.) Select "From Device" and navigate to the HW_Analysis.bak file you extracted in step 1.
6.) Click OK and the database should restore almost immediately as it is fairly small.

*********************************************
* Setting Up the Pro_SSRS_Project Solution *
*********************************************

All of the reports and content from Chapters 3,4,10 and 11 can be found in the Pro_SSRS_Project
solution in the download. Simply extract the entire zip file to a location on your local hard drive, 
preferrably c:\Pro_SSRS_Project maintaining the folder structure in the zip file.
For Chapters 5,6,7 and the last part of 8, the code will be located in a seperate solution and 
added from the zip to folders named after the chapters, "Chapter 5" for example. You can open
the solution for each of the chapters for 5,6,7 and 8 where applicable.
All of the report files (RDLs) will be contained in the solutions provided and referenced in the
text of the book.

*** Note ****
For Chapters 8 and 9, there is a referenced report, Daily Activity, but really there are two reports:
Daily Activity and Daily Activity Ch 9. Though the Daily Activity report can be used successfully for
both chapters, to see the use of the UserID filter in Chapter 9, the Daily Activity CH 9 report should
be used.
************

***************************************
* Restoring the Patient Referral Cube *
***************************************

1.) With the Hw_Analysis database restored (see above) right click the Patient Referral SSAS project 
    and select "Process" to make sure it processes on your installation successfully.
2.) Next, Right click the entire Patient Referral project in BIDs and click "Deploy" which will process
    and deploy the Patient Referral SSAS database to use with reports that use the Patient Referral
    cube in Chapter 10.


*******************************
* Running the Code Samples *
*******************************
For specific details on setting up the code samples for Chapters 5,6,7 and 8 see the ReadMe.htm
included in each chapter's folder. 

*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*

We hope you enjoy the book. 
If you have any questions or concerns or comments please feel free to write me.

Rodney Landrum





