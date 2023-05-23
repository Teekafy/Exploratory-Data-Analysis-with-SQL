-- A little cleaning with SQL Queries
-- I wanted to tweak a few extra things with SQL after using EXCEL

-- View data
select *
from mar_ddata;

-- Let's arrange the data ordering it by the ID
select * 
from mar_ddata
order by ID;

-- Check for blank values (It is best to do this with excel by using the filter function) 
-- SQL can't run an operation for all values with that are blank/null
-- The 'Income' column in this table is the only column with null values
select * from mar_ddata
where Income is null;

-- The Income column is a type (number/currency or integer data)
-- Let's fill it with zeros
update mar_ddata
set Income = 0
where Income IS NULL;

select Income from mar_ddata
order by Income asc;

select * from mar_ddata
order by ID;

--rename table
alter table mar_ddata
rename to maven_marketing_data;


-- Let's do some analysis

-- Which campaign is the most successsful?
select count(acceptedcmp1)
from maven_marketing_data
where acceptedcmp1 = 1;

select count(acceptedcmp2)
from maven_marketing_data
where acceptedcmp2 = 1;

select count(acceptedcmp3)
from maven_marketing_data
where acceptedcmp3 = 1;

select count(acceptedcmp4)
from maven_marketing_data
where acceptedcmp4 = 1;

select count(acceptedcmp5)
from maven_marketing_data
where acceptedcmp5 = 1;

-- Which channels are best performing and under performing?
select sum(numwebpurchases), 
sum(numstorepurchases), 
sum(numcatalogpurchases)
from maven_marketing_data;

-- Which products are performing best?
select sum(MNTWINES), 
sum(MNTFRUITS), sum(MNTMEATPRODUCTS), 
sum(MNTFISHPRODUCTS), sum(MNTSWEETPRODUCTS), 
sum(MNTGOLDPRODS)
from maven_marketing_data;

-- What does the average customer look like?
select marital_status, count(marital_status) as marital_stat_count
from maven_marketing_data
group by marital_status
order by marital_status;

select avg(Income)
from maven_marketing_data;

select count(Complain)
from maven_marketing_data
where Complain >= 1;

select sum(numwebvisitsmonth)
from maven_marketing_data;

select Country, count(Country) as country_count
from maven_marketing_data
group by Country
order by Country;
-- Spain has the highest number of individuals that make purchaes

select Education, sum(Income) as income_by_education
from maven_marketing_data
group by Education;
-- Graduates earn the most annually


select marital_status, sum(numwebpurchases) as web_purchases
from maven_marketing_data
group by marital_status
order by marital_status;
-- Individuals who are married spend the most on web purchases

select year_birth, sum(numwebpurchases) as web_purchases
from maven_marketing_data
group by year_birth 
order by year_birth;
-- There are 59 birth years in this dataset, 
-- the highest birth year is 1996 while the lowest is 1893, 
-- let's group them in 6 groups. We would be grouping in tens.
-- Note - there are no purchases from individuals with birth year between 1901 and 1939, 
-- so there won't be groups for that

select year_birth, sum(numwebpurchases) as web_purchases
from maven_marketing_data 
group by year_birth 
having year_birth between 1893 and 1900
order by year_birth; 

select year_birth, sum(numwebpurchases) as web_purchases
from maven_marketing_data 
group by year_birth                 
having year_birth between 1936 and 1945
order by year_birth;
-- 7 individuals

select year_birth, sum(numwebpurchases) as web_purchases
from maven_marketing_data 
group by year_birth 
having year_birth between 1946 and 1955
order by year_birth;
-- 1556 individuals

select year_birth, sum(numwebpurchases) as web_purchases
from maven_marketing_data 
group by year_birth 
having year_birth between 1956 and 1965
order by year_birth;
-- 2162 individuals

select year_birth, sum(numwebpurchases) as web_purchases
from maven_marketing_data 
group by year_birth 
having year_birth between 1966 and 1975
order by year_birth;
-- 2773 individuals

select year_birth, sum(numwebpurchases) as web_purchases
from maven_marketing_data 
group by year_birth 
having year_birth between 1976 and 1985
order by year_birth; 
-- 1843 individuals

select year_birth, sum(numwebpurchases) as web_purchases
from maven_marketing_data 
group by year_birth 
having year_birth between 1986 and 1996
order by year_birth;
-- 650 individuals

