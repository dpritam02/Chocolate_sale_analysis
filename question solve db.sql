create database company;
use company;

create table worker(
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    FIRST_NAME CHAR(25),
    LAST_NAME CHAR(25),
    SALARY INT(25),
    JOINING_DATE DATETIME,
    DEPARTMENT CHAR(25)
);

INSERT INTO worker
	(WORKER_ID,FIRST_NAME ,LAST_NAME ,SALARY,JOINING_DATE ,DEPARTMENT) values
    (001,'MONIKA','ARORA',1000,'12-02-24','HR'),
    (002,'BEBO','SINGH',4000,'15-07-24','ADMIN'),
    (003,'POO','GARV',1500,'12-06-24','ACCOUNT'),
    (004,'SIV','SINHA',2000,'19-01-24','HR'),
    (005,'NINJA','CHAUBE',1290,'12-09-24','ADMIN'),
    (006,'STAN','BHATI',3000,'32-10-24','HR'),
    (007,'ALEX','MISHRA',1000,'22-12-24','ACCOUNT');

SELECT * FROM WORKER;

create table bonus(
	WORKER_REF_ID INT ,
    BONUS_AMOUNT INT(10),
    BONUS_DATE DATETIME,
    FOREIGN KEY (WORKER_REF_ID)
		references WORKER(WORKER_ID)
        ON delete cascade
);

INSERT INTO BONUS
	(WORKER_REF_ID,BONUS_AMOUNT,BONUS_DATE ) values
    (001,500,'03-04-24'),
    (003,700,'07-09-24'),
    (002,500,'02-11-24'),
    (005,900,'03-12-24');
    
SELECT * FROM BONUS;

create table title(
	WORKER_REF_ID INT,
    WORKER_TITLE CHAR(25),
    AFFECTED_FROM DATETIME,
    FOREIGN KEY (WORKER_REF_ID)
		references WORKER(WORKER_ID)
        on delete cascade
);

insert into title
	(WORKER_REF_ID, WORKER_TITLE ,AFFECTED_FROM) values
    (001,'Manager','12-02-02 00:00:00'),
    (002,'Executive','12-02-02 00:00:00'),
    (005,'Manager','12-02-02 00:00:00'),
    (004,'Lead','12-02-02 00:00:00'),
    (006,'Asst. Manager','12-02-02 00:00:00'),
    (003,'Lead','12-02-02 00:00:00');

select * from title;