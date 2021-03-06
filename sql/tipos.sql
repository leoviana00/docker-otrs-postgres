select 
  $__timeGroupAlias(t.create_time,$__interval),
	tp.name as estado, 
	count(*) as TICKETS 
	
from 
	ticket t, 
	queue q, 
	ticket_state ts,
	ticket_type tp,
	customer_company cc 
	
where 
	cc.customer_id = t.customer_id and 
	t.customer_id in ($squad) and
	t.queue_id = q.id and
	q.id in ($queue) and
	t.type_id = tp.id and
	tp.id in ($tipo) and
	t.ticket_state_id = ts.id and 
	ts.id in ($state) and
	date_part('month', t.create_time) IN ($MES) and
	$__timeFilter(t.create_time)
	
group by 
	t.customer_id ,
	tp.name ,
	t.create_time
	
order by 
	TICKETS desc 