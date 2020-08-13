select 
  $__timeGroupAlias(t.create_time,$__interval),
	cc.name as CLIENTE, 
	count(*) as TICKETS 
from 
	ticket t, 
	queue q, 
	ticket_state ts, 
	customer_company cc 
where 
	cc.customer_id = t.customer_id and 
	t.customer_id in ($squad) and
	
	t.queue_id = q.id and
	q.id in ($queue) and
	
	t.ticket_state_id = ts.id and 
	ts.id in ($state) and
	
	
	$__timeFilter(t.create_time)
group by 
	t.customer_id ,
	cc.name ,
	t.create_time
order by 
	TICKETS desc 
