/*
- dpCampId: int, not null Pk
- camp: varchar(20), not null, doesn't allow blank
- arrivalDate: date, not null <= 1947
- departureDate: date, allows null
- dpFirstName: varchar(30), not null, doesn't allow blank
- dpLastName: varchar(30), not null, doesn't allow blank
- gender: char(1), not null, must be M or F
- dob: date, not null < arrival date
- address: varchar(50), not null, doesn't allow blank
- city: varchar(30), not null, doesn't allow blank
- country: varchar(20), not null, doesn't allow blank
- zipCode: varchar(10), not null, doesn't allow blank
- datedied: date, allows null
- cemetery: varchar(50), allows null
- birthplace: varchar(50), not null, doesn't allow blank
- motherFirstName: varchar(30), not null, doesn't allow blank
- motherLastName: varchar(30), not null, doesn't allow blank
- motherMaidenName: varchar(30), not null, doesn't allow blank
- fatherFirstName: varchar(30), not null, doesn't allow blank
- fatherLastName: varchar(30), not null, doesn't allow blank
- motherDateOfBirth: date, not null
- fatherDateOfBirth: date, not null
- motherAddress: varchar(50), not null, doesn't allow blank
- fatherAddress: varchar(50), not null, doesn't allow blank
- maternalGrandmotherFirstName: varchar(30), not null, doesn't allow blank
- maternalGrandmotherLastName: varchar(30), not null, doesn't allow blank
- maternalGrandfatherFirstName: varchar(30), not null, doesn't allow blank
- maternalGrandfatherLastName: varchar(30), not null, doesn't allow blank
- maternalGrandmotherTown: varchar(30), not null, doesn't allow blank
- maternalGrandfatherTown: varchar(30), not null, doesn't allow blank
- paternalGrandmotherFirstName: varchar(30), not null, doesn't allow blank
- paternalGrandmotherLastName: varchar(30), not null, doesn't allow blank
- paternalGrandfatherFirstName: varchar(30), not null, doesn't allow blank
- paternalGrandfatherLastName: varchar(30), not null, doesn't allow blank
- paternalGrandmotherTown: varchar(30), not null, doesn't allow blank
- paternalGrandfatherTown: varchar(30), not null, doesn't allow blank
- DpRegistrationNumber dpFirstName + dpLastName + year(DOB) + first 3 letters of camp unique
- BunkNumber 
    age 0-10 = bunk #1
    age 11-20 = bunk #2
    age 21-30 = bunk #3
    age 31-40 = bunk #4
    age 41-50 = bunk #5
    age 51-60 = bunk #6
    age 61+ = bunk #7 
- constraints:
    DepartureDate >= ArrivalDate
    DateDied null and Cemetery null or DateDied not null and Cemetery not null and DepartureDate not null
    MotherDateOfBirth to DOB >= 18
    FatherDateOfBirth to DOB >= 18
    DateDied >= DepartureDate
*/