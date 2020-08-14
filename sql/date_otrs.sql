 SELECT
    $__timeGroupAlias(t.create_time,$__interval),
    case date_part('month', t.create_time) 
        when 1 then 'Janeiro'
        when 2 then 'Fevereiro'
        when 3 then 'Março'
        when 4 then 'Abril'
        when 5 then 'Maio'
        when 6 then 'Junho'
        when 7 then 'Julho'
        when 8 then 'Agosto'
        when 9 then 'Setembro'
        when 10 then 'Outubro'
        when 11 then 'Novembro'
        when 12 then 'Dezembro'
        else 'Indefinido'
    end AS "Meses",
    count(date_part('month', t.create_time)) as value
 from
  ticket t,
  queue q ,
  ticket_state ts,
  customer_company cc 
  
where 
  cc.customer_id = t.customer_id and 
  t.customer_id in ($squad) and
	
  t.queue_id = q.id and
  q.id in ($queue) and
  
  t.ticket_state_id = ts.id and
  ts.id in ($state) and
  
  date_part('month', t.create_time) IN ($MES) and
  
  $__timeFilter(t.create_time)
  
 GROUP BY
 t.create_time,
 date_part('month', t.create_time)
 
 ORDER BY  date_part('month', t.create_time) 