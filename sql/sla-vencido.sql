select 

	t.tn as TICKET,
	t.title as TÍTULO, 
	s.name as SLA, 
	q.name as FILA,
	t.create_time as ABERTURA


from 
	ticket t, 
	queue q, 
	ticket_state ts, 
	sla s
where 
	t.queue_id = q.id and 
	t.ticket_state_id = ts.id and
	t.sla_id = s.id and 
	q.name <> 'Lixo' and 
	ts.id not in (2,3,10) and 
	to_timestamp(t.escalation_time) < NOW() and 
  t.escalation_time > 0;