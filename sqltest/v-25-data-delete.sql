-- This is the query when we want to keep the oldest record as right one and 
-- want to delete the duplicate
With DuplicateEmployeeCTE As(
  SELECT 
            EmployeeId,
			Name, Department,
            ROW_NUMBER() OVER (PARTITION BY Name, Department ORDER BY EmployeeId ) AS RowNumber
        FROM EmployeeNew 
)
delete  from DuplicateEmployeeCTE where RowNumber > 1


truncate table EmployeeNew

select * from EmployeeNew

-- The below sql is used for if we want to keep the latest record and delete the old data
With DuplicateEmployeeCTE2 As(
  SELECT 
            EmployeeId,
			Name, Department,
            ROW_NUMBER() OVER (PARTITION BY Name, Department ORDER BY EmployeeId desc) AS RowNumber
        FROM EmployeeNew 
)
delete  from DuplicateEmployeeCTE2 where RowNumber > 1