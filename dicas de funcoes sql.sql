select power(5, 3);

select sqrt(81); -- raiz

-- arredonda number
select round(5.65, 1) as arredonda;

select truncate(5.99, 1);

-- funções de data
select current_date() as dataatual;
select current_time() as timeatual;
select now() as aatual;
select day(now()) as datahoraatual;

select day(current_date()) as diadataatual;
select month(current_date()) as mesdaatual;
select monthname(current_date()) as mesdataatual;
select datediff(now(),'2024-10-27');
select year(current_date()) as anodataatual;
select year(now()) as anodatahoraatual;
select truncate(datediff(now(), '1978-07-21')/365,0);

