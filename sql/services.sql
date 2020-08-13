select
	sv.name as "SERVIÇO", 
	count(t.id) as "TICKETS"
from
	ticket t,
	queue q,
	ticket_state ts,
	service sv,
  customer_company cc 
  
where 
	cc.customer_id = t.customer_id and 
	t.customer_id in ($squad) and
	t.service_id = sv.id and
	t.queue_id = q.id and
	t.ticket_state_id = ts.id and
	q.id in ($queue) and
	ts.id in ($state)
group by
	sv.name
order by 
	count(t.id) desc 
limit 10;
