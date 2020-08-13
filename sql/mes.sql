select 
  $__timeGroupAlias(t.create_time,$__interval),
	count(*) as JULHO
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
	
	t.create_time BETWEEN '2020-07-01' and '2020-07-31' and
	
	$__timeFilter(t.create_time)
group by 
	
	t.create_time
order by 
	JULHO desc 