select * 
from sales2;


-- max income by day 
select country,   max(profit) AS MAX_profit
from sales2
group by 1
order by 2 desc
limit 1;


-- max income by month
select country, month(date),  max(profit) AS MAX_profit
from sales2
group by 1,2
order by 3 desc
limit 1;



SELECT MONTHNAME(date) AS month_name, 
       SUM(profit) AS total_profit
FROM sales2
GROUP BY month_name
ORDER BY FIELD(month_name, 
  'January','February','March','April','May','June',
  'July','August','September','October','November','December');


-- Profit trend over months
SELECT year, month, SUM(profit) AS total_profit
FROM sales2
GROUP BY year, month
ORDER BY year, month;



SELECT year, 
       SUM(revenue) AS total_revenue,
       SUM(cost) AS total_cost,
       SUM(profit) AS total_profit
FROM sales2
GROUP BY year
ORDER BY year;


SELECT 
  product_category,
  SUM(profit) / NULLIF(SUM(revenue), 0) AS profit_margin
FROM sales2
GROUP BY product_category
ORDER BY profit_margin DESC;



-- which category is high-demand

select Product_category, sum(order_quantity) as sum_order
from sales2
group by 1
order by 2 desc;


-- which sub_category is high-demand
select sub_category, sum(order_quantity) as sum_order
from sales2
group by 1
order by 2 desc;


-- which product is high-demand
select product, sum(order_quantity) as sum_order
from sales2
group by 1
order by 2 desc;


select Product, sum(Order_Quantity), sum(profit)
from sales2
group by 1
order by 2 desc , 3 ;


-- Price vs Quantity
SELECT 
  product_category,
  round(AVG(unit_price),2) AS avg_price,
  SUM(order_quantity) AS total_quantity
FROM sales2
GROUP BY product_category
ORDER BY avg_price DESC;


-- sum of sales by country
select country, sum(profit) as profit, sum(revenue) as revenue
from sales2 
group by 1
order by 2 desc;


-- countries and states with their profit
select country,
		state,
        sum(profit) as profit,
		row_number() over(partition by country order by state) as r_n
from sales2
group by 1,2
;


with state_profits as (
	select 
		country,
		state,
		sum(profit) as profit,
		row_number() over(partition by country order by sum(profit) desc) as rn
    from sales2
    group by 1,2
)
select country, state , profit
from state_profits
where rn=1
order by 3 desc;



SELECT 
  country,
  SUM(revenue) AS revenue,
  SUM(cost) AS cost,
  SUM(profit) AS profit,
  COUNT(DISTINCT state) AS state_count,
  COUNT(DISTINCT product) AS product_variety
FROM sales2
GROUP BY country
ORDER BY profit DESC;


-- Top 5 Products per Country
with TOP_cte as (
	select country, product, sum(profit) as profit,
		rank() over(partition by country order by sum(profit) desc) as r_N
	from sales2
    group by 1,2
)

select * from top_cte
where r_N<=5;

-- profit by years
with profit  as(

	select country , year, sum(profit) as profit, sum(Revenue) as revenue,
	row_number() over(partition by Country order by year) as r_n
	from sales2
	group by 1,2
    )
select *, 
profit-lag(profit) over(partition by country order by year) as profit_change
from profit;


SELECT age_group, customer_gender, SUM(profit) AS profit
FROM sales2
GROUP BY age_group, customer_gender
ORDER BY age_group, profit DESC;


-- what gender are majority of 	clients
select
	Count(case when customer_gender='F' Then 1 END) as Female,
    Count(case when customer_gender='M' then 1 END) as Male
from sales2;


-- which gender is more profitable
select customer_gender, sum(profit) as profit
from sales2
group by 1
order by 2 desc; 



select Age_group, sum(profit) as profit
from sales2
group by 1
order by 2 desc;



