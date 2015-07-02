SELECT distinct T.name, SUM(IF(T.WsWin = "Y",1, 0)) as WS, SUM(IF(T.DivWin = "Y",1, 0)) as DW, SUM(IF(T.LGWin = "Y",1, 0)) as LC


FROM Teams T

GROUP BY T.name
ORDER BY WS desc
;