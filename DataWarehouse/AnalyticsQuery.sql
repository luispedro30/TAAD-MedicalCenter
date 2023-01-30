--Medicamentos mais prescritos
select p.drug, count(p.quantity) from dbo.[appoint.DIM_prescription] p
group by p.drug
order by count(p.quantity) desc;

--Tentativas de marcação de consultas falhadas
select count(*) quantity from dbo.[appoint.FACT_bookappointment] b
where b.appointment_done = 0;

--Tentativas de marcação de consultas efetuadas
select count(*) quantity from dbo.[appoint.FACT_bookappointment] b
where b.appointment_done = 1;


--Dia da semana em que se registam mais consultas
select distinct d.[Day of Week Portuguese], count(*) quantity from dbo.[appoint.FACT_appointment] a, dbo.[appoint.DIM_day] d
where a.sk_day = d.sk_day
group by d.[Day of Week Portuguese]
order by quantity desc;

--Altura dos dias em que se registam mais consultas
select distinct d.DayTimeBucket, count(*) quantity from dbo.[appoint.FACT_appointment] a, dbo.[appoint.DIM_hour] d
where a.sk_hour = d.sk_hour
group by d.DayTimeBucket
order by quantity desc;

--Médicos que efetuam mais consultas
select distinct d.full_name, count(*) quantity from dbo.[appoint.FACT_appointment] a, dbo.[appoint.DIM_doctor] d
where a.sk_doctor = d.sk_doctor
group by d.full_name
order by quantity desc;


--Pacientes por idade
select distinct d.age, count(*) quantity from dbo.[appoint.FACT_appointment] a, dbo.[appoint.DIM_patient] d
where a.sk_patient = d.sk_patient
group by d.age
order by quantity desc;

--Pacientes por profissão
select distinct d.occupation, count(*) quantity from dbo.[appoint.FACT_appointment] a, dbo.[appoint.DIM_patient] d
where a.sk_patient = d.sk_patient
group by d.occupation
order by quantity desc;

--Pacientes por estado de isenção
select distinct d.free, count(*) quantity from dbo.[appoint.FACT_appointment] a, dbo.[appoint.DIM_patient] d
where a.sk_patient = d.sk_patient
group by d.free
order by quantity desc;




