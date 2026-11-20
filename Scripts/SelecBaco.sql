select c.nmcliente, m.dtmov, m.vrmov, m.tpmov, m.nrconta 
from clientes c join clicontas
on c.cdcliente = clicontas.cdcliente
join movimentos m
on clicontas.nrconta = m.nrconta
where nmcliente = 'JOAO DA SILVA' and --tpmov = 'D'
order by dtmov desc;

/*insert into clientes 
values ('00011', 'GUSTAVO', 'R DOS ABOBADOS, 564', '7649-1028', 'M', '08/11/99', '734.917.376-28', '980172');*/

select c.nmcliente, co.nrconta
from clientes c left join clicontas co
on c.cdcliente = co.cdcliente
where c.cdcliente = '00011';

select a.nmagencia, sum(m.vrmov) as totaldepositos
from agencias a join contas c
on a.cdagencia = c.cdagencia
join movimentos m
on m.nrconta = c.nrconta
where dsmov = 'DEPOSITO'
group by a.nmagencia
having sum(m.vrmov) > 500;
