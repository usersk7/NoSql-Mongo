Drop table PUBLISHERS;
Drop table SUBJECTS;
Drop table AUTHORS;
Drop table TITLES;
Drop table TITLEAUTHORS;

CREATE TABLE PUBLISHERS
(
    PUBID      NUMBER(3)   PRIMARY KEY,
    PNAME      VARCHAR(30),
    EMAIL      VARCHAR(50)  UNIQUE,
    PHONE      VARCHAR(30)
);


CREATE TABLE  SUBJECTS
(
    SUBID      VARCHAR(5) PRIMARY KEY,
    SNAME      VARCHAR(30)
);


CREATE TABLE  AUTHORS
(
    AUID     NUMBER(5)  PRIMARY KEY,
    ANAME      VARCHAR(30),
    EMAIL      VARCHAR(50)  UNIQUE,
    PHONE      VARCHAR(30)
);



CREATE TABLE  TITLES
(
    TITLEID    NUMBER(5) PRIMARY KEY,
    TITLE      VARCHAR(30),
    PUBID      NUMBER(3),
    SUBID      VARCHAR(5),
    PUBDATE    DATE,
    COVER      CHAR(1)  CHECK ( COVER IN ('P','H','p','h')),
    PRICE      NUMBER(4),
	CONSTRAINT TITLES_PUBID_FK FOREIGN KEY (PUBID) REFERENCES PUBLISHERS(PUBID),
	CONSTRAINT TITLES_SUBID_FK FOREIGN KEY (SUBID) REFERENCES SUBJECTS(SUBID)
);



CREATE TABLE  TITLEAUTHORS
(
    TITLEID    NUMBER(5) ,
    AUID       NUMBER(5) ,
    IMPORTANCE NUMBER(2),
   PRIMARY KEY(TITLEID,AUID),
   CONSTRAINT  TITLESAUTHORS_TITLEID_FK FOREIGN KEY (TITLEID) REFERENCES TITLES(TITLEID),
   CONSTRAINT  TITLESAUTHORS_AUTHID_FK FOREIGN KEY (AUID) REFERENCES AUTHORS(AUID)
);

CREATE TABLE  SUBJECTS_BACKUP
(
    SUBID      VARCHAR(5) PRIMARY KEY,
    SNAME      VARCHAR(30)
);

INSERT INTO SUBJECTS VALUES ('ORA','ORACLE DATABASE 10g');
INSERT INTO SUBJECTS VALUES ('JAVA','JAVA LANGUAGE');
INSERT INTO SUBJECTS VALUES ('JEE','JAVA ENTEPRISE EDITION');
INSERT INTO SUBJECTS VALUES ('VB','VISUAL BASIC.NET');
INSERT INTO SUBJECTS VALUES ('ASP','ASP.NET');



INSERT INTO PUBLISHERS VALUES (1,'WILLEY','WDT@VSNL.NET','91-11-23260877');
INSERT INTO PUBLISHERS VALUES (2,'WROX','INFO@WROX.COM',NULL);
INSERT INTO PUBLISHERS VALUES (3,'TATA MCGRAW-HILL','FEEDBACK@TATAMCGRAWHILL.COM','91-11-33333322');
INSERT INTO PUBLISHERS VALUES (4,'TECHMEDIA','BOOKS@TECHMEDIA.COM','91-11-33257660');



INSERT INTO AUTHORS VALUES (101, 'HERBERT SCHILD','HERBERT@YAHOO.COM',NULL);
INSERT INTO AUTHORS VALUES (102, 'JAMES GOODWILL','GOODWILL@HOTMAIL.COM',NULL);
INSERT INTO AUTHORS VALUES (103, 'DAVAID HUNTER','HUNTER@HOTMAIL.COM',NULL);
INSERT INTO AUTHORS VALUES (104, 'STEPHEN WALTHER','WALTHER@GMAIL.COM',NULL);
INSERT INTO AUTHORS VALUES (105, 'KEVIN LONEY','LONEY@ORACLE.COM',NULL);
INSERT INTO AUTHORS VALUES (106, 'ED. ROMANS','ROMANS@THESERVERSIDE.COM',NULL);



INSERT INTO TITLES VALUES (1001,'ASP.NET UNLEASHED',4,'ASP','12-APR-02','P',540);
INSERT INTO TITLES VALUES (1002,'ORACLE10G COMP. REF.',3,'ORA','1-MAY-05','P',575);
INSERT INTO TITLES VALUES (1003,'MASTERING EJB',1,'JEE','3-FEB-05','P',475);
INSERT INTO TITLES VALUES (1004,'JAVA COMP. REF',3,'JAVA','3-APR-05','P',499);
INSERT INTO TITLES VALUES (1005,'PRO. VB.NET',2,'VB','15-JUN-05','P',450);



INSERT INTO TITLEAUTHORS VALUES (1001,104,1);
INSERT INTO TITLEAUTHORS VALUES (1002,105,1);

INSERT INTO TITLEAUTHORS VALUES (1003,106,1);

INSERT INTO TITLEAUTHORS VALUES (1004,101,1);

INSERT INTO TITLEAUTHORS VALUES (1005,103,1);
INSERT INTO TITLEAUTHORS VALUES (1005,102,2);