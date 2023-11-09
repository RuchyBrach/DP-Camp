use DpCampDB
go
drop table if exists DpCamp
go
create table dbo.DpCamp(
    DpCampId int not null identity primary key,
    Camp varchar(20) not null constraint ck_DpCamp_camp_cannot_be_blank check (camp > ''),
    ArrivalDate date not null constraint ck_DpCamp_arrivaldate_cannot_be_in_future check(year(ArrivalDate) <= 1947),
    DepartureDate date constraint ck_DpCamp_departuredate_cannot_be_in_future check(DepartureDate < getdate()),
    DpFirstName varchar(30) not null constraint ck_DpCamp_dpfirstname_cannot_be_blank check (dpFirstName > ''),
    DpLastName varchar(30) not null constraint ck_DpCamp_dplastname_cannot_be_blank check (dpLastName > ''),
    Gender char(1) not null constraint ck_DpCamp_gender_must_be_m_or_f check (Gender IN ('M', 'F')),
    DOB date not null,
    DpAddress varchar(60) not null constraint ck_DpCamp_dpaddress_cannot_be_blank check (DpAddress > ''),
    City varchar(30) not null constraint ck_DpCamp_city_cannot_be_blank check (city > ''),
    Country varchar(20) not null constraint ck_DpCamp_country_cannot_be_blank check (country > ''),
    ZipCode varchar(10) not null constraint ck_DpCamp_zipcode_cannot_be_blank check (zipCode > ''),
    Datedied date,
    Cemetery varchar(50),
    Birthplace varchar(50) not null constraint ck_DpCamp_birthplace_cannot_be_blank check (birthplace > ''),
    MotherFirstName varchar(30) not null constraint ck_DpCamp_motherfirstname_cannot_be_blank check (motherFirstName > ''),
    MotherLastName varchar(30) not null constraint ck_DpCamp_motherlastname_cannot_be_blank check (motherLastName > ''),
    MotherMaidenName varchar(30) not null constraint ck_DpCamp_mothermaidenname_cannot_be_blank check (motherMaidenName > ''),
    FatherFirstName varchar(30) not null constraint ck_DpCamp_fatherfirstname_cannot_be_blank check (fatherFirstName > ''),
    FatherLastName varchar(30) not null constraint ck_DpCamp_fatherlastname_cannot_be_blank check (fatherLastName > ''),
    MotherDateOfBirth date not null,
    FatherDateOfBirth date not null,
    MotherAddress varchar(100) not null constraint ck_DpCamp_motheraddress_cannot_be_blank check (motherAddress > ''),
    FatherAddress varchar(100) not null constraint ck_DpCamp_fatheraddress_cannot_be_blank check (fatherAddress > ''),
    MaternalGrandmotherFirstName varchar(30) not null constraint ck_DpCamp_maternalgrandmotherfirstname_cannot_be_blank check (maternalGrandmotherFirstName > ''),
    MaternalGrandmotherLastName varchar(30) not null constraint ck_DpCamp_maternalgrandmotherlastname_cannot_be_blank check (maternalGrandmotherLastName > ''),
    MaternalGrandfatherFirstName varchar(30) not null constraint ck_DpCamp_maternalgrandfatherfirstname_cannot_be_blank check (maternalGrandfatherFirstName > ''),
    MaternalGrandfatherLastName varchar(30) not null constraint ck_DpCamp_maternalgrandfatherlastname_cannot_be_blank check (maternalGrandfatherLastName > ''),
    MaternalGrandmotherTown varchar(30) not null constraint ck_DpCamp_maternalgrandmothertown_cannot_be_blank check (maternalGrandmotherTown > ''),
    MaternalGrandfatherTown varchar(30) not null constraint ck_DpCamp_maternalgrandfathertown_cannot_be_blank check (maternalGrandfatherTown > ''),
    PaternalGrandmotherFirstName varchar(30) not null constraint ck_DpCamp_paternalgrandmotherfirstname_cannot_be_blank check (paternalGrandmotherFirstName > ''),
    PaternalGrandmotherLastName varchar(30) not null constraint ck_DpCamp_paternalgrandmotherlastname_cannot_be_blank check (paternalGrandmotherLastName > ''),
    PaternalGrandfatherFirstName varchar(30) not null constraint ck_DpCamp_paternalgrandfatherfirstname_cannot_be_blank check (paternalGrandfatherFirstName > ''),
    PaternalGrandfatherLastName varchar(30) not null constraint ck_DpCamp_paternalgrandfatherlastname_cannot_be_blank check (paternalGrandfatherLastName > ''),
    PaternalGrandmotherTown varchar(30) not null constraint ck_DpCamp_paternalgrandmothertown_cannot_be_blank check (paternalGrandmotherTown > ''),
    PaternalGrandfatherTown varchar(30) not null constraint ck_DpCamp_paternalgrandfathertown_cannot_be_blank check (paternalGrandfatherTown > ''),
    DpRegistrationNumber as concat(dpFirstName,dpLastName,year(DOB),left(Camp,3)) constraint u_DpCamp_DpRegistrationNumber unique,
    BunkNumber as 
        case 
            when 1947 - year(DOB) between 0 and 10 then 1 
            when 1947 - year(DOB) between 11 and 20 then 2 
            when 1947 - year(DOB) between 21 and 30 then 3 
            when 1947 - year(DOB) between 31 and 40 then 4 
            when 1947 - year(DOB) between 41 and 50 then 5 
            when 1947 - year(DOB) between 51 and 60 then 6 
            when 1947 - year(DOB) >= 61 then 7 
        end,
-- SM I can combine both with between, but I would like to know if it's the DOB that's the issue or the departure date.
    constraint ck_DpCamp_dob_must_be_before_arrive_date check(DOB < ArrivalDate),
    constraint ck_DpCamp_departure_date_must_be_on_or_after_arrive_date check(DepartureDate >= ArrivalDate),
    constraint ck_DpCamp_date_died_and_cemetery_must_be_either_null_or_not_with_departure_date check((DateDied is null and Cemetery is null) or (DateDied is not null and Cemetery is not null and DepartureDate is not null)),
    constraint ck_DpCamp_motherdob_must_be_at_least_18_years_before_dp_dob check(datediff(year,MotherDateOfBirth,DOB) >= 18),
    constraint ck_DpCamp_fatherdob_must_be_at_least_18_years_before_dp_dob check(datediff(year,FatherDateOfBirth,DOB) >= 18),
    constraint ck_DpCamp_departure_date_must_be_on_or_before_datedied check(DateDied >= DepartureDate)
)
