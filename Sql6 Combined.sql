-- # Sql6

-- 1 Problem 1 : Game Play Analysis II	(https://leetcode.com/problems/game-play-analysis-ii/)

with CTE as(
select player_id, device_id, dense_rank() over (partition by player_id order by event_date ) rnk
from activity)

select player_id, device_id
from CTE
where rnk = 1

-- 2 Problem 2 : Game Play Analysis III		(https://leetcode.com/problems/game-play-analysis-iii/)



-- 3 Problem 3 : Shortest Distance in a Plane		(https://leetcode.com/problems/shortest-distance-in-a-plane/)




-- 4 Problem 4 : Combine Two Tables	(https://leetcode.com/problems/combine-two-tables/)




-- 5 Problem 5 : Customers with Strictly Increasing Purchases		(https://leetcode.com/problems/customers-with-strictly-increasing-purchases/)

select p.firstName, p.lastName, a.city, a.state
from person p
left join address a
on p.personId = a.personId