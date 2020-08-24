SELECT 
case
when create_time BETWEEN date'2020-07-01' and date'2020-07-31'  = 7 then 'JULHO'
when create_time BETWEEN date'2020-08-01' and date'2020-08-31'  = 8 then 'AGOSTO'
else Indefinido
end as Mes,
count (*) as tickets
FROM ticket
group by Mes
order by Mes;