CREATE PROCEDURE sp_FieldInfo 
(
 @column_name nvarchar(384) = NULL
 )
AS
SELECT  
     Object_Name(id) as "Table Name",
     rtrim(name) as "Field Name"
FROM 
     syscolumns 
WHERE  
     Name like @column_name  
