select 
	cc.name as SQUAD, 
	count(*) as TICKETS 
from 
	ticket t, 
	queue q, 
	ticket_state ts, 
	customer_company cc 
where 
	cc.customer_id = t.customer_id and 
	t.queue_id = q.id and 
	t.ticket_state_id = ts.id and 
	q.name <> 'Lixo' and 
	t.ticket_state_id in (1,4)
group by 
	cc.name
order by 
	TICKETS desc 
limit 10;