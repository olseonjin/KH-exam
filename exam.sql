SELECT * FROM PROFESSOR;

SELECT substr(email,instr(email,'@') +1) "DOMAIN"
     , count(*) "EA"
     , (SELECT COUNT(*) FROM PROFESSOR) "SUM_DOMAIN"
     , ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) from PROFESSOR),2) "%"
  from professor
  GROUP BY SUBSTR(EMAIL,INSTR(EMAIL,'@')+1)
  ORDER BY DOMAIN asc;
     