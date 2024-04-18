create table User_Third_Transaction
(
User_ID int,
Spend int,
Transaction_Date date
)

select * from User_Third_Transaction
truncate table User_Third_Transaction
DECLARE @UserID INT;
DECLARE @Spend INT;
DECLARE @TransactionDate DATE;

-- Loop to insert random records
DECLARE @Counter INT = 1;
WHILE @Counter <= ABS(CHECKSUM(NEWID()) % 11 + 30) -- Generates random number between 30 and 40
BEGIN
    -- Generate random values for User_ID, Spend, and Transaction_Date
    SET @UserID = ABS(CHECKSUM(NEWID())) % 10000 + 100; -- Generates random number between 100 and 10100
    SET @Spend = ABS(CHECKSUM(NEWID())) % 2000 + 100; -- Generates random number between 100 and 2100
    SET @TransactionDate = DATEADD(DAY, ABS(CHECKSUM(NEWID())) % 365, '2019-01-01'); -- Generates random date between '2019-01-01' and '2019-12-31'

    -- Insert random record
    INSERT INTO User_Third_Transaction (User_ID, Spend, Transaction_Date)
    VALUES (@UserID, @Spend, @TransactionDate);

    -- Increment counter
    SET @Counter = @Counter + 1;
END;
