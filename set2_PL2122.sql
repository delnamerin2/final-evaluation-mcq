---set 2---

CREATE TABLE Manufacturer(mfname varchar(20) primary key,city varchar(20),state varchar(20))

INSERT INTO Manufacturer(mfname,city,state) values('ravi','south dakota','delhi');
INSERT INTO Manufacturer(mfname,city,state) values('mathew','kozhikode','kerala'),('mat','kode','tamilnadu');

CREATE TABLE Employee(employeeid int primary key,employeename varchar(20),phone varchar(10),email varchar(20))
 
 CREATE TABLE computer(serialno int primary key, mfname  varchar(20) constraint pk foreign key(mfname)
 references manufacturer(mfname),model varchar(10),weight int,employeeid  int 
 constraint fk foreign key(employeeid)
 references employee(employeeid))


 insert into computer(serialno , mfname 
 ,model ,weight,employeeid ) values(112,'ravi','ce+',50,1),
 (113,'mathew','c+',89,2),
 (115,'ravi','e+',78,3)


 insert Employee(employeeid ,employeename 
 ,phone ,email ) values(1,'delna','9644566798','delna@2001'),(2,'anjali','864458273','anjali@2001')
 ,(3,'sndeep','7844566798','sandeepa@2001')
 select * from employee

alter table employee add  area_code varchar(10);
insert into employee(area_code) values('2344') where employeeid=1


 --Q1--
 select mfname from Manufacturer where city='south dakota'

 --Q2--
 select avg(weight) as  'Average Weight' from computer c
 inner join employee e ON c.employeeiD=e.employeeid group by C.weight
 --Q3--
SELECT EmployeeName
FROM Employee
WHERE area_code LIKE '2%';


--Q4--
select serialno from computer where weight <(select avg(weight) from computer)

--Q5--
SELECT MfName FROM MANUFACTURER WHERE MfName NOT IN (SELECT MfName FROM COMPUTER) 
--Q6--
select e.employeename, c.serialno,m.city FROM employee e
join computer c on e.employeeid = c.employeeid
join manufacturer m ON c.mfname = m.mfname

--Q7--
create procedure getcomputer
    @EmployeeId int
as
begin
    select Computer.Serialno, Manufacturer.mfname, Model, weight
    from computer
    join employee on Computer.EmployeeId = Employee.EmployeeId
    join manufacturer on Computer.MfName = Manufacturer.MfName
    WHERE Employee.EmployeeId =@EmployeeId;
END;
  exec getcomputer @employeeid=2