IF EXISTS 
(
      SELECT name from sysobjects 
      WHERE name =  'Emp_Svc_Cost'
)
      DROP Procedure Emp_Svc_Cost
GO
CREATE PROCEDURE [dbo].[Emp_Svc_Cost] 
@ServiceMonth  Int=NULL, 
@ServiceYear Int=NULL,
@BranchID Int=NULL,
@EmployeeTblID Int=NULL,
@ServicesLogCtgryID char(5)=NULL
AS
SELECT     
     Trx.PatID,
     RTRIM(RTRIM(Patient.LastName) + ',' + RTRIM(Patient.FirstName)) AS 
     [Patient Name],
     Branch.BranchName,
     Employee.EmployeeID, 
     RTRIM(RTRIM(Employee.LastName) + ',' + RTRIM(Employee.FirstName)) AS
     [Employee Name],
     Employee.EmployeeClassID, 
     ServicesLogCtgry.Service AS [Service Type], 
     SUM(ChargeInfo.Cost) AS [Estimated Cost], 
     COUNT(Trx.ServicesTblID) AS Visit_Count,
     Diag.Dscr AS Diagnosis, DATENAME(mm, Trx.ChargeServiceStartDate) AS [Month], 
     DATEPART(yy, Trx.ChargeServiceStartDate) AS [Year],
     Services.ServiceTypeID 
FROM
     Trx INNER JOIN
     Branch on Trx.Branchid = Branch.BranchID INNER JOIN
     ChargeInfo ON Trx.ChargeInfoID = ChargeInfo.ChargeInfoID 
     INNER JOIN  Patient ON Trx.PatID = Patient.PatID INNER JOIN
     Services ON Trx.ServicesTblID = Services.ServicesTblID INNER JOIN
     ServicesLogCtgry ON 
     Services.ServicesLogCtgryID = ServicesLogCtgry.ServicesLogCtgryID INNER JOIN
     Employee ON ChargeInfo.EmployeeTblID = Employee.EmployeeTblID INNER JOIN
     Diag ON ChargeInfo.DiagTblID = Diag.DiagTblID  
WHERE
     (Trx.TrxTypeID = 1) AND     
     (ISNULL(Branch.BranchID,0) = ISNULL(@BranchID,ISNULL(Branch.BranchID,0)))
AND
     (ISNULL(Services.ServicesLogCtgryID,0) = ISNULL(@ServicesLogCtgryID,
        ISNULL(Services.ServicesLogCtgryID,0)))  AND
     (ISNULL(Employee.EmployeeTblID,0) = ISNULL(@EmployeeTblID,
        ISNULL(Employee.EmployeeTblID,0))) AND

--Case to determine if Year and Month was passed in

     1=Case
          When ( @ServiceYear is  NULL) then 1
          When ( @ServiceYear is  NOT NULL)  
          AND @ServiceYear = Cast(DatePart(YY,ChargeServiceStartDate) as int)
Then 1
     ELSE 0
     End
AND 
     1=Case
          When (@ServiceMonth is NULL)  then 1     
          When (@ServiceMonth is NOT NULL)  
          AND @ServiceMonth = Cast(DatePart(MM,ChargeServiceStartDate) as int)
Then 1
     ELSE 0
     END
GROUP BY
     ServicesLogCtgry.Service, 
     Diag.Dscr, 
     Trx.PatID, 
     Branch.BranchName,
     RTRIM(RTRIM(Patient.LastName) + ',' + RTRIM(Patient.FirstName)), 
     RTRIM(RTRIM(Employee.LastName)  + ',' + RTRIM(Employee.FirstName)),
     Employee.EmployeeClassid,
     Employee.EmployeeID, 
     DATENAME(mm, Trx.ChargeServiceStartDate), 
     DATEPART(yy, Trx.ChargeServiceStartDate),
     Services.ServiceTypeID
ORDER BY 
     Trx.PatID
GO
