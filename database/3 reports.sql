use DpCampDB
go

-- 1) Leah Burstein is searching for her twin. She wants to know in which camp she is in now and how many days she has been there for.
-- SM I'm doing december 31 1947 because you say current year is 1947 but I have no idea the date.
select d.DpFirstName, d.DpLastName, d.Camp, NumOfDaysInCamp = datediff(day,d.ArrivalDate,'19471231')
from DpCamp d
where d.DpLastName = 'Burstein'
and d.DepartureDate is null
and d.DpFirstName <> 'Leah'
-- 2) show a list of how many people are currently in each dp camp.
select d.Camp, NumOfPeopleInCamp = count(*)
from DpCamp d
where d.DepartureDate is null
group by d.Camp
-- 3) Show a list of the Gombos family. 
select *
from DpCamp d
where d.DpLastName = 'Gombos'
-- 4) Show a list of how many people are arriving to each dpcamp monthly.
select NumPeople = count(*), d.Camp, YearArrived = year(d.ArrivalDate), MonthArrived = month(d.ArrivalDate)
from DpCamp d
group by d.Camp, year(d.ArrivalDate), month(d.ArrivalDate)
order by YearArrived, MonthArrived
-- 5) Show a list of the number of camps each person went to. Also show which camps they went to.
-- SM I'm splitting this in 2 statements because if I get the number of camps there's no point showing the camp because that will need the group by camp.
-- The real way to do this is by doing CTE with joins which is tought in session 24+
select d.DpFirstName, d.DpLastName, d.DOB, d.Camp
from DpCamp d
order by d.DpFirstName, d.DOB

select d.DpFirstName, d.DpLastName, d.DOB, NumberOfCamps = count(*)
from DpCamp d
group by d.DpFirstName, d.DpLastName, d.DOB
order by d.DpLastName
-- 6) Leo Sandor is sitting in bunk #4 and mourning after his daughter. Someone just told him that she thinks she saw Dr. Mengele ימ"ש point to the left for his daughter. 
-- We need to find Leo's daughter and show him the records that show that she's alive and in which camp she is in now.
select *
from DpCamp d
where d.DpLastName = 'Sandor'
and d.FatherFirstName = 'Leo'
and d.DepartureDate is null
-- 7) The records are all messed up. Order it by the dp's last name and then by the dp camp.
select *
from DpCamp d
order by d.DpLastName, d.Camp