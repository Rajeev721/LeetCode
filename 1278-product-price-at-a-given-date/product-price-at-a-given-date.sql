-- Write your PostgreSQL query statement below
select distinct pp.product_id, coalesce(p.new_price,10) as price from products pp

left join (select distinct product_id, new_price, 
row_number() over(partition by product_id order by change_date desc) as rnk from products where change_date <= '2019-08-16'
) p
on pp.product_id = p.product_id

and rnk = 1