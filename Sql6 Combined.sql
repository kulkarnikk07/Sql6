-- # Sql6

-- 1 Problem 1 : Game Play Analysis II	(https://leetcode.com/problems/game-play-analysis-ii/)

with CTE as(
select player_id, device_id, dense_rank() over (partition by player_id order by event_date ) rnk
from activity)

select player_id, device_id
from CTE
where rnk = 1

-- 2 Problem 2 : Game Play Analysis III		(https://leetcode.com/problems/game-play-analysis-iii/)

select player_id, event_date, sum(games_played) over (partition by player_id order by event_date) as 'games_played_so_far' 
from Activity

-- 3 Problem 3 : Shortest Distance in a Plane		(https://leetcode.com/problems/shortest-distance-in-a-plane/)

select min(round(sqrt(pow(p2.x-p1.x,2)+ pow(p2.y-p1.y,2)),2)) as 'shortest' 
from Point2D p1, Point2D p2
where p1.x != p2.x
or p1.y != p2.y

-- 4 Problem 4 : Combine Two Tables	(https://leetcode.com/problems/combine-two-tables/)

select p.firstName, p.lastName, a.city, a.state
from person p
left join address a
on p.personId = a.personId


-- 5 Problem 5 : Customers with Strictly Increasing Purchases		(https://leetcode.com/problems/customers-with-strictly-increasing-purchases/)

with CTE as(
    select customer_id, year(order_date) as 'year', sum(price) as 'price'
    from Orders
    group by customer_id, year
    order by customer_id, year
)

select c1.customer_id 
from CTE c1
left join CTE c2
on c1.customer_id = c2.customer_id
and c1.year = c2.year-1
and c1.price < c2.price
group by 1
having count(*)- count(c2.customer_id) =1