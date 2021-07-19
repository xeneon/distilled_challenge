--1. Determine the number of ads which have generated leads on the site per day.
select
	date_of_lead,
	count(distinct ad_id) as ads
from total_leads
group by 1
order by 1
;
	
--2. Determine the YoY growth of leads in county Dublin from 2018 to 2020 (use lag).
select
	date_part('year', date_of_lead) year_of_date,
	sum(leads) as leads,
	sum(leads) - LAG(SUM(leads)) OVER (order BY date_part('year', date_of_lead)) as yoy_growth
from total_leads
where 
	date_of_lead >= '2018-01-01' and date_of_lead <'2021-01-01'
	and lower(county) = 'dublin'
group by 1
order by 1
;