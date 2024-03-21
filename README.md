# Walmart_Sales_Data_Analysis - SQL Project 


# About
Here , i am going to analyze Walmart's sales data to identify high-performing branches and products, analyze the sales patterns of various products, and understand customer behavior. The primary objective is to enhance and optimize sales strategies. The dataset utilized in this project is sourced from the Kaggle Walmart Sales Forecasting Competition.

# Purposes of the Project
I sought to tackle Walmart's business challenge by analyzing their sales data, aiming to unravel the complexities influencing sales performance across diverse branches.

# About Data
This project's data was obtained from the Kaggle Walmart Sales Forecasting Competition and it encompasses sales transactions from three Walmart branches situated in Mandalay, Yangon, and Naypyitaw, respectively. The data contains 17 columns and 1000 rows:

 |Column| Description| Data Type |
|------------|-------------|-------|
|invoice_id	 | Invoice of the sales made	 |       VARCHAR(30)|
|branch	|  Branch at which sales were made	 |     VARCHAR(5)|
|city	   | The location of the branch	        |  VARCHAR(30)|
|customer_type	|The type of the customer	 |       VARCHAR(30)|
|gender|	Gender of the customer making purchase	|VARCHAR(10)|
|product_line	|Product line of the product sold	|VARCHAR(100)|
|unit_price|	The price of each product	|DECIMAL(10, 2)|
|quantity	|The amount of the product sold	|INT|
|VAT|	The amount of tax on the purchase	|FLOAT(6, 4)|
|total|	The total cost of the purchase	|DECIMAL(12, 4)|
|date|	The date on which the purchase was made	|DATETIME|
|time	|The time at which the purchase was made|	TIME|
|payment|	The total amount paid	|DECIMAL(10, 2)|
|cogs	|Cost Of Goods sold	|DECIMAL(10, 2)|
|gross_margin_pct	|Gross margin percentage|	FLOAT(11, 9)|
|gross_income	|Gross Income|	DECIMAL(12, 4)|
|rating	|Rating|	FLOAT(2, 1)|

# Analysis List:
# a) Product Analysis
Perform an analysis on the data to gain insights into different product lines, determine the top-performing product lines, and identify areas for improvement in other product lines.

# b) Sales Analysis
The objective of this analysis is to address the inquiry regarding the sales trends of the product. The outcomes of this analysis can assist in evaluating the efficiency of each applied sales strategy in the business and determining necessary modifications to increase sales.

# c) Customer Analysis
This analysis is focused on identifying various customer segments, understanding purchasing trends, and evaluating the profitability associated with each of these customer segments.

# Approach Used
## 1. Data Wrangling

During this initial phase, the data is examined to detect any NULL or missing values, and strategies for data replacement are implemented to address and substitute these values effectively.

Build a database
Create a table and insert the data.
Select columns with null values in them. Null values are not present in our database because, in creating the tables, NOT NULL was specified for each field, effectively filtering out any null values.
## 2. Feature Engineering

This will help use generate some new columns from existing ones.

Add a new column named time_of_day to give insight of sales in the Morning, Afternoon and Evening. This will help answer the question on which part of the day most sales are made.
Add a new column named day_name that contains the extracted days of the week on which the given transaction took place (Mon, Tue, Wed, Thur, Fri). This will help answer the question on which week of the day each branch is busiest.
Add a new column named month_name that contains the extracted months of the year on which the given transaction took place (Jan, Feb, Mar). Help determine which month of the year has the most sales and profit.
## 3. Exploratory Data Analysis (EDA)

Conducting exploratory data analysis is essential to address the project's listed questions and objectives.

### Business Questions to Answer
# a) Generic Questions
How many distinct cities are present in the dataset?

In which city is each branch situated?

# b) Product Analysis
How many distinct product lines are there in the dataset?

What is the most common payment method?

What is the most selling product line?

What is the total revenue by month?

Which month recorded the highest Cost of Goods Sold (COGS)?

Which product line generated the highest revenue?

Which city has the highest revenue?

Which product line incurred the highest VAT?

Retrieve each product line and add a column product_category, indicating 'Good' or 'Bad,' based on whether its sales are above the average.

Which branch sold more products than average product sold?

What is the most common product line by gender?

What is the average rating of each product line?

# c) Sales Analysis
Number of sales made in each time of the day per weekday

Identify the customer type that generates the highest revenue.

Which city has the largest tax percent/ VAT (Value Added Tax)?

Which customer type pays the most VAT?

# d) Customer Analysis
How many unique customer types does the data have?

How many unique payment methods does the data have?

Which is the most common customer type?

Which customer type buys the most?

What is the gender of most of the customers?

What is the gender distribution per branch?

Which time of the day do customers give most ratings?

Which time of the day do customers give most ratings per branch?

Which day of the week has the best avg ratings?

Which day of the week has the best average ratings per branch?
