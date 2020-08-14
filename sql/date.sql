SELECT
  SUM(Janeiro) as "Janeiro",
  SUM(Fevereiro) as "Fevereiro",
  SUM(Marco) as "Março",
  SUM(Abril) as "Abril",
  SUM(Maio) as "Maio",
  SUM(Junho) as "Junho",
  SUM(Julho) as "Julho",
  SUM(Agosto) as "Agosto",
  SUM(Setembro) as "Setembro",
  SUM(Outubro) as "Outubro",
  SUM(Novembro) as "Novembro",
  SUM(Dezembro) as "Dezembro"
FROM
(
  SELECT 
    CASE Mes WHEN 1 THEN Tickets ELSE 0 END AS Janeiro,
    CASE Mes WHEN 2 THEN Tickets ELSE 0 END AS Fevereiro,
    CASE Mes WHEN 3 THEN Tickets ELSE 0 END AS Marco,
    CASE Mes WHEN 4 THEN Tickets ELSE 0 END AS Abril,
    CASE Mes WHEN 5 THEN Tickets ELSE 0 END AS Maio,
    CASE Mes WHEN 6 THEN Tickets ELSE 0 END AS Junho,
    CASE Mes WHEN 7 THEN Tickets ELSE 0 END AS Julho,
    CASE Mes WHEN 8 THEN Tickets ELSE 0 END AS Agosto,
    CASE Mes WHEN 9 THEN Tickets ELSE 0 END AS Setembro,
    CASE Mes WHEN 10 THEN Tickets ELSE 0 END AS Outubro,
    CASE Mes WHEN 11 THEN Tickets ELSE 0 END AS Novembro,
    CASE Mes WHEN 12 THEN Tickets ELSE 0 END AS Dezembro
  FROM
  (
     SELECT
--        $__timeGroupAlias(create_time,$__interval),
        date_part('month', create_time) AS Mes,
        count(id) as Tickets
     FROM ticket
--     WHERE $__timeFilter(create_time)
     GROUP BY
        date_part('month', create_time)
--        , create_time
  ) AS A
) AS B