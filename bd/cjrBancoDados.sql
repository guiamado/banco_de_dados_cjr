--questao 1
update empresa.empregado set salario = 28000 where codemp = 3;

--questao2
select nome from empresa.empregado inner join empresa.projeto on empresa.empregado.coddepto = empresa.projeto.coddepto  where empresa.projeto.titulo = 'Transmogrifador';

--questao 4
SELECT distinct 
empregado.nome,endereco
FROM empresa.empregado
inner join empresa.projeto
on empresa.projeto.coddepto = empresa.empregado.coddepto
inner join empresa.departamento
on empresa.departamento.coddepto = empresa.projeto.coddepto
WHERE empresa.departamento.nome = 'Pesquisa';

--questao 5
select nome from empresa.empregado where nome like 'A%';

--questao 6
select upper(nome) from empresa.empregado;

--questao 7
select lower(nome) from empresa.empregado;

--questao 8
update empresa.empregado set nome = upper(nome);

--questao 9
select nome from empresa.empregado.nome;

--questao 10
select *
from empresa.empregado
where datanasc =  (select MIN(datanasc) from empresa.empregado);

--questao 11
select *
from empresa.empregado
where datanasc =  (select MAX(datanasc) from empresa.empregado);


--questao 13
select nome,datanasc
from empresa.empregado where datanasc between '1950-01-01' and '1970-01-01';

--questao 14
select titulo from empresa.projeto order by titulo;

--questao 15
select nome,horas from empresa.empregado 
inner join empresa.trabalhaem
on empresa.empregado.codemp = empresa.trabalhaem.codemp
inner join empresa.projeto
on empresa.projeto.codproj = empresa.trabalhaem.codproj 
where empresa.projeto.codproj = 3 
order by empresa.trabalhaem.horas DESC;

--questao 16
select distinct empresa.empregado.codemp from empresa.empregado
inner join empresa.trabalhaem
on empresa.empregado.codemp = empresa.trabalhaem.codemp 
where horas > 10;

--questao 17
select COUNT(empresa.empregado.coddepto)
from empresa.empregado
where coddepto=4;

--questao 18
select MIN(horas) as minimo, MAX(horas) as maximo, AVG(horas) as media
from empresa.trabalhaem
inner join empresa.empregado
on empresa.trabalhaem.codemp = empresa.empregado.codemp
inner join empresa.projeto
on empresa.projeto.codproj = empresa.trabalhaem.codproj
group by empresa.projeto.titulo

--questao 19
select empresa.trabalhaem.codproj
from empresa.trabalhaem
group by codproj
having AVG(empresa.trabalhaem.horas)>20;

--questao 20
select empresa.projeto.titulo
from empresa.projeto
where empresa.projeto.codproj = in ( SELECT empresa.trabalhaem.codproj FROM empresa.trabalhaem)
group by empresa.projeto.codproj
having AVG(horas) > 20;






