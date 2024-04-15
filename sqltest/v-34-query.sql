/*New TikTok users sign up with their emails. 
They confirmed their signup by replying to the text confirmation 
to activate their accounts. Users may receive multiple text
messages for account confirmation until they have confirmed 
their new account.
Write a query to find the activation rate of the users.
Round the percentage to 2 decimal places*/
select * from Email e inner join text t on
e.email_id = t.email_id
where sign_up_action = 'confirmed'

-- Now we want to find the percentage of the user who confirmed
-- the E-mail
with cte as
(select count(t.sign_up_action) as total_confirmed,
count(e.user_id) as total_user 
from Email e left join text t on 
e.email_id = t.email_id and
 t.sign_up_action = 'confirmed')

select cast((total_confirmed*1.00/total_user) as Decimal(3,2)) from cte