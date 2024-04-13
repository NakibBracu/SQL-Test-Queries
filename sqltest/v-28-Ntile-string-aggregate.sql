 with cte as (SELECT 
    category,
    item,
    CONCAT(Category, ' - ', Item) AS Category_Item,
    NTILE((SELECT COUNT(DISTINCT category) FROM purchase)) 
	OVER (ORDER BY category) AS number
FROM 
    purchase)

select STRING_AGG(Category_item,' , ') as All_category_Item
	from cte
	group by number