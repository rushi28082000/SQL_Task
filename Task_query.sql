

select * from customer

select * from membership

select * from tv_show



-- TASK 1 : Creating a new table using select query.
-- PROBLEM STATEMENT : Create a new table consisting CUSTOMER's details using select query.

CREATE TABLE new_customer as
select  customer_name , username , gender, location from customer

select * from new_customer



-- PROBLEM STATEMENT : Create a new table consisting membership details using select query.

CREATE TABLE new_membership AS
select subscription_plan  , payment_info , renewal_status from membership

select * from new_membership


-- PROBLEM STATEMENT : Create a new table consisting tv_show details using select query.

CREATE TABLE new_tv_show AS
select favorite_genres, device_used , rating , customer_support_interactions from tv_show

select * from new_tv_show


----------------------------------------------------------------------------------------------------------------


-- TASK 2 : JOIN 3 Tables of the dataset into 1

select * from customer AS C
 INNER JOIN membership AS M
 on C.customer_id = M.customer_id
 INNER JOIN tv_show AS TV
 on M.customer_id = TV.customer_id

---------------------------------------------------------------------------------------------------------------


-- TASK 3 : JOIN table and use WHERE clause

select * from customer AS C
 INNER JOIN tv_show AS TV
 on C.customer_id = TV.customer_id
 where favorite_genres = 'Action'

---------------------------------------------------------------------------------------------------------------


-- TASK 4 : Execute having , group by, order by together

select device_used ,rating from tv_show
group by device_used , rating
HAVING rating > 4.5
order by rating

---------------------------------------------------------------------------------------------------------------


-- Task 5 : join tables and execute 'having' and 'group by' func together

select subscription_plan , payment_info from membership AS M
 INNER JOIN customer AS C
 on C.customer_id = M.customer_id
 group by subscription_plan , payment_info 
 having payment_info = 'Mastercard'
 
 -------------------------------------------------------------------------------------------------------------
 
 
-- Task 6 : WINDOW Function (ROW_NUMBER)

select payment_info , ROW_NUMBER() 
over (
      Partition by payment_info
      ) 
from membership


--WINDOW Function (RANK)

select rating , favorite_genres , RANK()
over ( Partition by rating
       order by favorite_genres DESC ) from tv_show
 where rating BETWEEN 4.1 AND 4.8
 

--WINDOW Function (DENSE_RANK)

select favorite_genres , customer_support_interactions , DENSE_RANK()
over ( Partition by favorite_genres
       order by customer_support_interactions DESC ) from tv_show
 where customer_support_interactions BETWEEN 1 AND 10

-----------------------------------------------------------------------------------------------------------



-- TASK 7: SUBQUERY

select * from tv_show where customer_id 
	IN ( select customer_id from tv_show where rating Between 2.5 And 4.8
	     AND
	     customer_support_interactions > 1  
	   ) 
Order by device_used

-----------------------------------------------------------------------------------------------------------







 

