select 
  u.login, 
  count(t.id) tickets
from 
  ticket t, 
  queue q, 
  users u, 
  customer_company cc 
  
where 
	cc.customer_id = t.customer_id and 
	t.customer_id in ($squad) and
	
  u.id = t.responsible_user_id and 
  q.id = t.queue_id and
  q.id in ($queue) and
  
  t.ticket_state_id in ($state) 
group by u.login