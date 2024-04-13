create table Transactions
(
Transaction_ID int,
Type nvarchar(max),
Amount decimal(18,2),
Transaction_date Date
)

--data inserting
INSERT INTO Transactions (Transaction_ID, Type, Amount, Transaction_date)
VALUES
(757995, 'Deposit', 7.5, '2022-06-30'),
(41515, 'Withdrawal', 426.31, '2022-06-01'),
(29776, 'Withdrawal', 25.9, '2022-07-08'),
(77134, 'Deposit', 32.6, '2022-07-10'),
(16461, 'Withdrawal', 45.99, '2022-07-08'),
(19153, 'Deposit', 65.9, '2022-07-10'),
(996414, 'Withdrawal', 67, '2022-06-05'),
(146641, 'Withdrawal', 100, '2022-07-13'),
(624804, 'Deposit', 165, '2022-06-17'),
(112465, 'Withdrawal', 295.95, '2022-06-28'),
(125614, 'Withdrawal', 300, '2022-07-02'),
(136414, 'Deposit', 599.3, '2022-07-02'),
(946461, 'Deposit', 815, '2022-06-01'),
(121245, 'Deposit', 500, '2021-06-15');



select * from Transactions

truncate table Transactions