select * from dbo.[appoint.DIM_counter];
select * from dbo.[appoint.DIM_day];
select * from dbo.[appoint.DIM_hour];
select * from dbo.[appoint.DIM_doctor];
select * from dbo.[appoint.DIM_medical_center];
select * from dbo.[appoint.DIM_patient];
select * from dbo.[appoint.DIM_payment];
select * from dbo.[appoint.DIM_prescription];
select * from dbo.[appoint.FACT_appointment];
select * from dbo.[appoint.FACT_bookappointment];


select p.drug, count(p.quantity) from dbo.[appoint.DIM_prescription] p
group by p.drug
order by count(p.quantity) desc;






