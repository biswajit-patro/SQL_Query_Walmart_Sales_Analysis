create database walmart_sales;
use walmart_sales;
CREATE table if not exists sales(
invoice_id varchar(30) not null primary key,
branch varchar(5) not null,
city varchar(30) not null,
customer_type varchar(30) not null,
gender varchar(10) not null,
product_line varchar(100) not null,
unit_price decimal(10 , 2) not null,
quantity int not null,
vat float(6,4) not null,
total decimal(12, 4) not null,
date datetime not null,
time time not null,
payment_method varchar(15) not null,
cogs decimal(10,2) not null,
gross_margin_pct float(11,9) ,
gross_income decimal(12,4) not null,
rating float(2,1)
);



select * from walmart_sales.sales;
select count(*) from walmart_sales.sales;


-- --------------------------------------------------------------------------------------------------------------------
-- -------------------------------------- Feature Engineering----------------------------------------------------------
-- i) time_of_delay

select 
   time ,
   ( case 
		when 'time' between "00:00:00" and "12:00:00" then "Morning" 
        when 'time' between "12:01:00" and "16:00:00" then "Afternoon"
		else "Evening"
	end
    ) as time_of_date
from sales;

alter table sales add column time_of_day varchar(20);
select * from sales;
   
update sales
set time_of_day = (
	case 
		when time between "00:00:00" and "12:00:00" then "Morning" 
        when time between "12:01:00" and "16:00:00" then "Afternoon"
		else "Evening"
	end
);

-- Checking for the updates

select * from sales;
   
-- ii) day_name

select 
	date ,
    dayname(date) as day_name
    from sales;

alter table sales add column day_name varchar(10);
select * from sales;
update sales
	set day_name = 
    (
    dayname(date)
    );

select * from sales;

-- iii) month_name

select date , monthname(date) from sales; 

alter table sales add column month_name varchar(20);
update sales 
	set month_name = monthname(date);
    
select * from sales;

-- ------------------------------------------------------------------------------------------------------------------------

-- ------------------------------------------------------------------------------------------------------------------------
-- ---------------------------------- Exploratory Data Analysis --------------------------------------------------------------------------------
-- --------------------------------------------Generic Questions---------------------------------------------------

-- 1) How many unique cities does the data have?

select distinct city from sales;

-- 2) In which city is each branch?

select distinct branch from sales;

select 
	distinct city ,
    branch
from sales;
-- ------------------------ Produt ------------------------------------------------
-- 1) How many unique product lines does the data have?

select count(distinct product_line) from sales;

-- 2) What is the most common payment method?

select payment_method,count(payment_method) as count from sales 
	group by payment_method 
    order by count desc;
    

-- 3) What is the most selling product line?

select product_line , count(product_line) as count from sales
	group by product_line
    order by count desc  limit 1;

-- 4) What is the total revenue by month?

select 
	month_name as month ,
    sum(total) as total_revenue
from sales
group by month
order by total_revenue desc;

-- 5) What month had the largest COGS?

select month_name as month , sum(cogs) as cogs
from sales 
group by month
order by cogs desc;

-- 6) What product line had the largest revenue?

select 
	product_line , 
    sum(total) as revenue
    from sales
    group by product_line
    order by revenue desc limit 1 ;
    
-- 7) What is the city with the largest revenue?

select
	city ,
    branch , 
    sum(total) as revenue
    from sales
    group by city , branch
    order by revenue desc ;

-- 8) What product line had the largest VAT?

select
	product_line,
    avg(vat) as avg_tax
from sales
group by product_line
order by avg_tax desc;

-- 9) Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales
-- 10) Which branch sold more products than average product sold?

select
	branch,
    sum(quantity) as qty
from sales
group by branch
having sum(quantity) > (select avg(quantity) from sales) ;

-- 11) What is the most common product line by gender?

select
	gender,
    product_line,
    count(gender) as total_count
from sales 
group by gender , product_line
order by total_count desc;

-- 12) What is the average rating of each product line?

select
	product_line,
    round(avg(rating), 2) as avg_rating
from sales
group by product_line
order by avg_rating desc;


-- ------------------------------------------------------------------------------------------------------------------------
-- ------------------------------------   Sales   ------------------------------------------------------------------------

-- 1) Number of sales made in each time of the day per weekday.

select
	time_of_day,
    count(*) as total_sales
from sales
where day_name = "Sunday"
group by time_of_day
order by total_sales desc;

-- 2) Which of the customer types brings the most revenue?

select
	customer_type,
    sum(total) as total_revenue
from sales
group by customer_type
order by total_revenue desc;

-- 3) Which city has the largest tax percent/ VAT (Value Added Tax)?

select
	city ,
    sum(vat) as total_vat
from sales
group by city
order by total_vat desc;

-- 4) Which customer type pays the most in VAT?

select
	customer_type,
    sum(vat) as vat
from sales
group by customer_type
order by vat desc;

-- ------------------------------------------------------------------------------------------------------------------------
-- ---------------------------------  Customer  -------------------------------------------------------

-- 1) How many unique customer types does the data have?

select
	count(distinct customer_type) as No_Of_Customer_Types
from sales;

-- 2) How many unique payment methods does the data have?

select
	count( distinct payment_method ) as No_Of_Unique_Payment_Methods
from sales;

-- 3) What is the most common customer type?

select
	customer_type,
    count(*) as most_common
from sales
group by customer_type
order by most_common desc limit 1;

-- 4) Which customer type buys the most?

select
	customer_type,
    count(*) as customer_count
from sales
group by customer_type
order by customer_count desc limit 1;

-- 5) What is the gender of most of the customers?

select
	gender ,
    count(*) as gender_count
from sales
group by gender
order by gender_count desc;

-- 6) What is the gender distribution per branch?

select
	branch,
    gender,
    count(*) as gender_count
from sales
group by branch , gender
order by gender_count desc;

-- 7) Which time of the day do customers give most ratings?

select
	time_of_day,
    avg(rating) as average_rating
from sales
group by time_of_day
order by average_rating desc;

-- 8) Which time of the day do customers give most ratings per branch?

select
	branch,
    time_of_day,
    avg(rating) as average_rating
from sales
group by branch , time_of_day
order by average_rating desc ;

-- 9) Which day of the week has the best avg ratings?

select
	day_name,
    avg(rating) as Avg_Rating
from sales
group by day_name
order by Avg_Rating desc;

-- 10) Which day of the week has the best average ratings per branch?

select
	branch,
    day_name,
    avg(rating) as Avg_Rating
from sales
group by day_name , branch
order by Avg_Rating desc;
    