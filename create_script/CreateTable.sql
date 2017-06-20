-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2017-06-08 17:00:54.937

-- tables
-- Table: Committee_Board
CREATE TABLE Committee_Board (
    Member_ID integer  NOT NULL,
    Title varchar2(20)  NOT NULL,
    CONSTRAINT Committee_Board_pk PRIMARY KEY (Title)
) ;

-- Table: Committee_History
CREATE TABLE Committee_History (
    Title varchar2(20)  NOT NULL,
    Old_Member_ID integer  NOT NULL,
    New_Member_ID integer  NOT NULL,
    Change_Date date  NOT NULL
) ;

-- Table: Contributions
CREATE TABLE Contributions (
    Member_ID integer  NOT NULL,
    Project_ID integer  NOT NULL,
    Role_ID integer  NOT NULL,
    Contribution_ID integer  NOT NULL,
    CONSTRAINT Contributions_pk PRIMARY KEY (Contribution_ID)
) ;

-- Table: Members
CREATE TABLE Members (
    Member_ID integer  NOT NULL,
    First_Name varchar2(20)  NOT NULL,
    Last_Name varchar2(20)  NOT NULL,
    Join_Date date  NOT NULL,
    Email varchar2(25)  NOT NULL,
    CONSTRAINT Members_pk PRIMARY KEY (Member_ID)
) ;

-- Table: Project_Statuses
CREATE TABLE Project_Statuses (
    Status_ID integer  NOT NULL,
    Status_Name varchar2(20)  NOT NULL,
    CONSTRAINT Project_Statuses_pk PRIMARY KEY (Status_ID)
) ;

-- Table: Projects
CREATE TABLE Projects (
    Project_ID integer  NOT NULL,
    Project_Name varchar2(20)  NOT NULL,
    Status_ID integer  NOT NULL,
    Description varchar2(200)  NULL,
    Start_Date date  NOT NULL,
    CONSTRAINT Projects_pk PRIMARY KEY (Project_ID)
) ;

-- Table: Roles
CREATE TABLE Roles (
    Role_ID integer  NOT NULL,
    Role_Name varchar2(20)  NOT NULL,
    CONSTRAINT Roles_pk PRIMARY KEY (Role_ID)
) ;

-- views
-- View: Committee_View
CREATE VIEW Committee_View AS
select cb.Title, m.First_Name, m.Last_Name, m.Email, m.Member_Id
from Members m, Committee_Board cb
where m.Member_ID=cb.Member_ID;

-- foreign keys
-- Reference: Contributions_Members (table: Contributions)
ALTER TABLE Contributions ADD CONSTRAINT Contributions_Members
    FOREIGN KEY (Member_ID)
    REFERENCES Members (Member_ID);

-- Reference: Contributions_Projects (table: Contributions)
ALTER TABLE Contributions ADD CONSTRAINT Contributions_Projects
    FOREIGN KEY (Project_ID)
    REFERENCES Projects (Project_ID);

-- Reference: Members_Committee_Board (table: Committee_Board)
ALTER TABLE Committee_Board ADD CONSTRAINT Members_Committee_Board
    FOREIGN KEY (Member_ID)
    REFERENCES Members (Member_ID);

-- Reference: Members_Committee_History (table: Committee_History)
ALTER TABLE Committee_History ADD CONSTRAINT Members_Committee_History
    FOREIGN KEY (Old_Member_ID)
    REFERENCES Members (Member_ID);

-- Reference: Projects_Statuses (table: Projects)
ALTER TABLE Projects ADD CONSTRAINT Projects_Statuses
    FOREIGN KEY (Status_ID)
    REFERENCES Project_Statuses (Status_ID);

-- Reference: Roles_Contributions (table: Contributions)
ALTER TABLE Contributions ADD CONSTRAINT Roles_Contributions
    FOREIGN KEY (Role_ID)
    REFERENCES Roles (Role_ID);

-- End of file[Vertabelo].

--Add triger

--moved to another file, becouse of errors

--Create ID Sequences
CREATE SEQUENCE Member_ID_Sequence
 START WITH     0
 INCREMENT BY   1
 MINVALUE 0
 MAXVALUE 300
 NOCACHE
 NOCYCLE;

 
 CREATE SEQUENCE Project_Status_ID_Sequence
 START WITH     0
 INCREMENT BY   1
 MINVALUE 0
 MAXVALUE 300
 NOCACHE
 NOCYCLE;

 CREATE SEQUENCE Role_ID_Sequence
 START WITH     0
 INCREMENT BY   1
 MINVALUE 0
 MAXVALUE 300
 NOCACHE
 NOCYCLE;
 
 CREATE SEQUENCE Contribution_ID_Sequence
 START WITH     0
 INCREMENT BY   1
 MINVALUE 0
 MAXVALUE 300
 NOCACHE
 NOCYCLE;

--Create enums for project statuses

INSERT INTO PROJECT_STATUSES VALUES (1, 'Idea');
INSERT INTO PROJECT_STATUSES VALUES (2, 'In Progress');
INSERT INTO PROJECT_STATUSES VALUES (3, 'Prototype');
INSERT INTO PROJECT_STATUSES VALUES (4, 'Realeased');
INSERT INTO PROJECT_STATUSES VALUES (-1, 'Abandoned');

--Create enums for roles in projects

INSERT INTO ROLES VALUES (1, 'Programmer');
INSERT INTO ROLES VALUES (2, 'Designer');
INSERT INTO ROLES VALUES (3, 'Graphic Artist');
INSERT INTO ROLES VALUES (4, 'Sound Designer');
INSERT INTO ROLES VALUES (5, 'Manager');


--Create some membmers(random data from www.mockaroo.com)

insert into MEMBERS (Member_ID, FIRST_NAME, LAST_NAME, JOIN_DATE, EMAIL) values (Member_ID_Sequence.nextval, 'Miguelita', 'Antognazzi', '2013-06-20', 'mantognazzi0@umich.edu');
insert into MEMBERS (Member_ID, FIRST_NAME, LAST_NAME, JOIN_DATE, EMAIL) values (Member_ID_Sequence.nextval, 'Page', 'Jauncey', '2016-04-24', 'pjauncey1@unesco.org');
insert into MEMBERS (Member_ID, FIRST_NAME, LAST_NAME, JOIN_DATE, EMAIL) values (Member_ID_Sequence.nextval, 'Shelly', 'Geelan', '2015-09-12', 'sgeelan2@mysql.com');
insert into MEMBERS (Member_ID, FIRST_NAME, LAST_NAME, JOIN_DATE, EMAIL) values (Member_ID_Sequence.nextval, 'Goddard', 'Handscombe', '2014-07-16', 'ghandscombe3@nhs.uk');
insert into MEMBERS (Member_ID, FIRST_NAME, LAST_NAME, JOIN_DATE, EMAIL) values (Member_ID_Sequence.nextval, 'Lowell', 'Ksandra', '2016-02-28', 'lksandra4@rediff.com');
insert into MEMBERS (Member_ID, FIRST_NAME, LAST_NAME, JOIN_DATE, EMAIL) values (Member_ID_Sequence.nextval, 'Dorrie', 'Swadlen', '2013-06-16', 'dswadlen5@unc.edu');
insert into MEMBERS (Member_ID, FIRST_NAME, LAST_NAME, JOIN_DATE, EMAIL) values (Member_ID_Sequence.nextval, 'Leona', 'Biggin', '2013-04-16', 'lbiggin6@bluehost.com');
insert into MEMBERS (Member_ID, FIRST_NAME, LAST_NAME, JOIN_DATE, EMAIL) values (Member_ID_Sequence.nextval, 'Sarajane', 'Geraghty', '2013-01-07', 'sgeraghty7@mtv.com');
insert into MEMBERS (Member_ID, FIRST_NAME, LAST_NAME, JOIN_DATE, EMAIL) values (Member_ID_Sequence.nextval, 'Tynan', 'Papierz', '2015-08-14', 'tpapierz8@chron.com');
insert into MEMBERS (Member_ID, FIRST_NAME, LAST_NAME, JOIN_DATE, EMAIL) values (Member_ID_Sequence.nextval, 'Winifield', 'Arnell', '2013-04-18', 'warnell9@latimes.com');
insert into MEMBERS (Member_ID, FIRST_NAME, LAST_NAME, JOIN_DATE, EMAIL) values (Member_ID_Sequence.nextval, 'Kally', 'Wittleton', '2013-06-19', 'kwittletona@facebook.com');
insert into MEMBERS (Member_ID, FIRST_NAME, LAST_NAME, JOIN_DATE, EMAIL) values (Member_ID_Sequence.nextval, 'Clem', 'Ornils', '2014-12-12', 'cornilsb@shutterfly.com');
insert into MEMBERS (Member_ID, FIRST_NAME, LAST_NAME, JOIN_DATE, EMAIL) values (Member_ID_Sequence.nextval, 'Zed', 'Cowser', '2014-03-17', 'zcowserc@dropbox.com');
insert into MEMBERS (Member_ID, FIRST_NAME, LAST_NAME, JOIN_DATE, EMAIL) values (Member_ID_Sequence.nextval, 'Webster', 'Lenoir', '2013-04-13', 'wlenoird@multiply.com');
insert into MEMBERS (Member_ID, FIRST_NAME, LAST_NAME, JOIN_DATE, EMAIL) values (Member_ID_Sequence.nextval, 'Waylan', 'Enston', '2013-06-25', 'wenstone@parallels.com');
insert into MEMBERS (Member_ID, FIRST_NAME, LAST_NAME, JOIN_DATE, EMAIL) values (Member_ID_Sequence.nextval, 'Delly', 'Sudron', '2015-08-03', 'dsudronf@imgur.com');
insert into MEMBERS (Member_ID, FIRST_NAME, LAST_NAME, JOIN_DATE, EMAIL) values (Member_ID_Sequence.nextval, 'Garfield', 'Dominick', '2013-02-07', 'gdominickg@webeden.co.uk');
insert into MEMBERS (Member_ID, FIRST_NAME, LAST_NAME, JOIN_DATE, EMAIL) values (Member_ID_Sequence.nextval, 'Libbie', 'Bonass', '2014-08-11', 'lbonassh@yahoo.com');
insert into MEMBERS (Member_ID, FIRST_NAME, LAST_NAME, JOIN_DATE, EMAIL) values (Member_ID_Sequence.nextval, 'Davida', 'Conen', '2015-04-16', 'dconeni@technorati.com');
insert into MEMBERS (Member_ID, FIRST_NAME, LAST_NAME, JOIN_DATE, EMAIL) values (Member_ID_Sequence.nextval, 'Delphinia', 'Prise', '2013-11-15', 'dprisej@facebook.com');
insert into MEMBERS (Member_ID, FIRST_NAME, LAST_NAME, JOIN_DATE, EMAIL) values (Member_ID_Sequence.nextval, 'Rustie', 'Wilde', '2015-11-26', 'rwildek@usnews.com');
insert into MEMBERS (Member_ID, FIRST_NAME, LAST_NAME, JOIN_DATE, EMAIL) values (Member_ID_Sequence.nextval, 'Marion', 'Worsell', '2014-04-20', 'mworselll@indiegogo.com');
insert into MEMBERS (Member_ID, FIRST_NAME, LAST_NAME, JOIN_DATE, EMAIL) values (Member_ID_Sequence.nextval, 'Harley', 'McLucas', '2014-01-04', 'hmclucasm@tmall.com');
insert into MEMBERS (Member_ID, FIRST_NAME, LAST_NAME, JOIN_DATE, EMAIL) values (Member_ID_Sequence.nextval, 'Thomas', 'Vuitton', '2016-11-23', 'tvuittonn@mediafire.com');
insert into MEMBERS (Member_ID, FIRST_NAME, LAST_NAME, JOIN_DATE, EMAIL) values (Member_ID_Sequence.nextval, 'Franky', 'McCullogh', '2017-04-05', 'Franky@tmall.com');
insert into MEMBERS (Member_ID, FIRST_NAME, LAST_NAME, JOIN_DATE, EMAIL) values (Member_ID_Sequence.nextval, 'Olivie', 'Scemp', '2016-04-11', 'oscempp@about.me');
insert into MEMBERS (Member_ID, FIRST_NAME, LAST_NAME, JOIN_DATE, EMAIL) values (Member_ID_Sequence.nextval, 'Corabel', 'Mercer', '2013-11-29', 'cmercerq@sciencedaily.com');
insert into MEMBERS (Member_ID, FIRST_NAME, LAST_NAME, JOIN_DATE, EMAIL) values (Member_ID_Sequence.nextval, 'Tomi', 'Agett', '2015-12-12', 'tagettr@blogger.com');
insert into MEMBERS (Member_ID, FIRST_NAME, LAST_NAME, JOIN_DATE, EMAIL) values (Member_ID_Sequence.nextval, 'Vittorio', 'Laming', '2013-11-09', 'vlamings@nbcnews.com');
insert into MEMBERS (Member_ID, FIRST_NAME, LAST_NAME, JOIN_DATE, EMAIL) values (Member_ID_Sequence.nextval, 'Seward', 'Lamperti', '2014-09-12', 'slampertit@psu.edu');
insert into MEMBERS (Member_ID, FIRST_NAME, LAST_NAME, JOIN_DATE, EMAIL) values (Member_ID_Sequence.nextval, 'Marlene', 'Nicholl', '2015-04-03', 'mnichollu@china.com.cn');
insert into MEMBERS (Member_ID, FIRST_NAME, LAST_NAME, JOIN_DATE, EMAIL) values (Member_ID_Sequence.nextval, 'Germain', 'Hannaby', '2016-08-19', 'ghannabyv@google.es');
insert into MEMBERS (Member_ID, FIRST_NAME, LAST_NAME, JOIN_DATE, EMAIL) values (Member_ID_Sequence.nextval, 'Charmine', 'Migheli', '2013-03-19', 'cmigheliw@nydailynews.com');
insert into MEMBERS (Member_ID, FIRST_NAME, LAST_NAME, JOIN_DATE, EMAIL) values (Member_ID_Sequence.nextval, 'Bald', 'Bonnar', '2013-07-18', 'bbonnarx@rambler.ru');
insert into MEMBERS (Member_ID, FIRST_NAME, LAST_NAME, JOIN_DATE, EMAIL) values (Member_ID_Sequence.nextval, 'Gavra', 'Cella', '2016-06-26', 'gcellay@a8.net');
insert into MEMBERS (Member_ID, FIRST_NAME, LAST_NAME, JOIN_DATE, EMAIL) values (Member_ID_Sequence.nextval, 'Devy', 'Defrain', '2014-01-21', 'ddefrainz@dagondesign.org');
insert into MEMBERS (Member_ID, FIRST_NAME, LAST_NAME, JOIN_DATE, EMAIL) values (Member_ID_Sequence.nextval, 'Carmine', 'Crook', '2013-05-02', 'ccrook10@dagondesign.com');
insert into MEMBERS (Member_ID, FIRST_NAME, LAST_NAME, JOIN_DATE, EMAIL) values (Member_ID_Sequence.nextval, 'Chrissy', 'Falco', '2013-12-23', 'cfalco11@xrea.com');
insert into MEMBERS (Member_ID, FIRST_NAME, LAST_NAME, JOIN_DATE, EMAIL) values (Member_ID_Sequence.nextval, 'Kerr', 'Casol', '2013-10-30', 'kcasol12@miitbeian.gov.cn');
insert into MEMBERS (Member_ID, FIRST_NAME, LAST_NAME, JOIN_DATE, EMAIL) values (Member_ID_Sequence.nextval, 'Stirling', 'Barber', '2016-08-23', 'sbarber13@cloudflare.com');
insert into MEMBERS (Member_ID, FIRST_NAME, LAST_NAME, JOIN_DATE, EMAIL) values (Member_ID_Sequence.nextval, 'Marshal', 'Allardyce', '2015-03-25', 'mallardyce14@ucla.edu');
insert into MEMBERS (Member_ID, FIRST_NAME, LAST_NAME, JOIN_DATE, EMAIL) values (Member_ID_Sequence.nextval, 'Parrnell', 'Archanbault', '2017-03-27', 'archanbault15@vinaora.com');
insert into MEMBERS (Member_ID, FIRST_NAME, LAST_NAME, JOIN_DATE, EMAIL) values (Member_ID_Sequence.nextval, 'Jolene', 'Eckley', '2014-12-23', 'jeckley16@paginegialle.it');
insert into MEMBERS (Member_ID, FIRST_NAME, LAST_NAME, JOIN_DATE, EMAIL) values (Member_ID_Sequence.nextval, 'Sayers', 'Clemetts', '2017-05-25', 'sclemetts17@cbc.ca');
insert into MEMBERS (Member_ID, FIRST_NAME, LAST_NAME, JOIN_DATE, EMAIL) values (Member_ID_Sequence.nextval, 'Tasha', 'Hollier', '2015-05-09', 'thollier18@google.ru');
insert into MEMBERS (Member_ID, FIRST_NAME, LAST_NAME, JOIN_DATE, EMAIL) values (Member_ID_Sequence.nextval, 'Cordell', 'Gorhardt', '2014-05-30', 'cgorhardt19@amazon.co.uk');
insert into MEMBERS (Member_ID, FIRST_NAME, LAST_NAME, JOIN_DATE, EMAIL) values (Member_ID_Sequence.nextval, 'Amby', 'Woolard', '2016-04-14', 'awoolard1a@reuters.com');
insert into MEMBERS (Member_ID, FIRST_NAME, LAST_NAME, JOIN_DATE, EMAIL) values (Member_ID_Sequence.nextval, 'Morena', 'Kilrow', '2015-12-29', 'mkilrow1b@economist.com');
insert into MEMBERS (Member_ID, FIRST_NAME, LAST_NAME, JOIN_DATE, EMAIL) values (Member_ID_Sequence.nextval, 'Shane', 'Potteridge', '2015-10-19', 'spotteridge1c@jigsy.com');
insert into MEMBERS (Member_ID, FIRST_NAME, LAST_NAME, JOIN_DATE, EMAIL) values (Member_ID_Sequence.nextval, 'Roderick', 'Gringley', '2014-11-16', 'rgringley1d@google.ca');


--make commitee 
insert into COMMITTEE_BOARD values (1, 'President');
insert into COMMITTEE_BOARD values (4, 'Vice President');
insert into COMMITTEE_BOARD values (13, 'Social Media Ninja');
insert into COMMITTEE_BOARD values (2, 'Programming Tutor');
insert into COMMITTEE_BOARD values (4, 'Game Art Tutor');

--pretend  it's alive
insert into COMMITTEE_HISTORY values ('Social Media Ninja',1,13,'2015-08-14');

--create some projects(mockaroo)

insert into PROJECTS (PROJECT_ID, PROJECT_NAME, STATUS_ID, DESCRIPTION, START_DATE) values (Project_Status_ID_Sequence.nextval, 'Sonair', 1, 'a ipsum integer a nibh in', '2017-02-04');
insert into PROJECTS (PROJECT_ID, PROJECT_NAME, STATUS_ID, DESCRIPTION, START_DATE) values (Project_Status_ID_Sequence.nextval, 'Latlux', 2, 'ultricies eu nibh', '2016-10-08');
insert into PROJECTS (PROJECT_ID, PROJECT_NAME, STATUS_ID, DESCRIPTION, START_DATE) values (Project_Status_ID_Sequence.nextval, 'Mat Lam Tam', 1, 'maecenas tristique est et tempus semper est quam', '2016-05-06');
insert into PROJECTS (PROJECT_ID, PROJECT_NAME, STATUS_ID, DESCRIPTION, START_DATE) values (Project_Status_ID_Sequence.nextval, 'Tin', -1, 'justo in blandit ultrices', '2015-10-02');
insert into PROJECTS (PROJECT_ID, PROJECT_NAME, STATUS_ID, DESCRIPTION, START_DATE) values (Project_Status_ID_Sequence.nextval, 'Vagram', 1, 'turpis sed ante', '2014-02-09');
insert into PROJECTS (PROJECT_ID, PROJECT_NAME, STATUS_ID, DESCRIPTION, START_DATE) values (Project_Status_ID_Sequence.nextval, 'Tresom', 1, 'libero nullam sit amet turpis elementum ligula vehicula consequat', '2016-02-28');
insert into PROJECTS (PROJECT_ID, PROJECT_NAME, STATUS_ID, DESCRIPTION, START_DATE) values (Project_Status_ID_Sequence.nextval, 'Lotlux', 1, 'arcu sed augue aliquam erat volutpat in congue etiam', '2016-11-22');
insert into PROJECTS (PROJECT_ID, PROJECT_NAME, STATUS_ID, DESCRIPTION, START_DATE) values (Project_Status_ID_Sequence.nextval, 'Tin', 2, 'magna vestibulum aliquet ultrices erat', '2013-07-28');
insert into PROJECTS (PROJECT_ID, PROJECT_NAME, STATUS_ID, DESCRIPTION, START_DATE) values (Project_Status_ID_Sequence.nextval, 'Sub-Ex', 2, 'posuere nonummy integer non velit donec diam neque', '2015-07-08');
insert into PROJECTS (PROJECT_ID, PROJECT_NAME, STATUS_ID, DESCRIPTION, START_DATE) values (Project_Status_ID_Sequence.nextval, 'Cardguard', 3, 'lorem id ligula suspendisse ornare consequat lectus in est risus', '2015-06-17');
insert into PROJECTS (PROJECT_ID, PROJECT_NAME, STATUS_ID, DESCRIPTION, START_DATE) values (Project_Status_ID_Sequence.nextval, 'Hatity', 3, 'dictumst etiam faucibus cursus urna ut tellus nulla ut', '2013-11-16');
insert into PROJECTS (PROJECT_ID, PROJECT_NAME, STATUS_ID, DESCRIPTION, START_DATE) values (Project_Status_ID_Sequence.nextval, 'Alphazap', 2, 'volutpat in congue etiam justo etiam pretium iaculis justo', '2014-04-13');
insert into PROJECTS (PROJECT_ID, PROJECT_NAME, STATUS_ID, DESCRIPTION, START_DATE) values (Project_Status_ID_Sequence.nextval, 'Domainer', 4, 'orci vehicula condimentum curabitur in libero ut massa', '2015-08-26');
insert into PROJECTS (PROJECT_ID, PROJECT_NAME, STATUS_ID, DESCRIPTION, START_DATE) values (Project_Status_ID_Sequence.nextval, 'Flexidy', 1, 'vestibulum ante ipsum primis in faucibus orci', '2014-11-27');
insert into PROJECTS (PROJECT_ID, PROJECT_NAME, STATUS_ID, DESCRIPTION, START_DATE) values (Project_Status_ID_Sequence.nextval, 'Cardguard', 3, 'eget vulputate ut ultrices vel augue vestibulum ante ipsum primis', '2015-06-29');
insert into PROJECTS (PROJECT_ID, PROJECT_NAME, STATUS_ID, DESCRIPTION, START_DATE) values (Project_Status_ID_Sequence.nextval, 'Fintone', 3, 'massa id nisl venenatis', '2015-02-22');
insert into PROJECTS (PROJECT_ID, PROJECT_NAME, STATUS_ID, DESCRIPTION, START_DATE) values (Project_Status_ID_Sequence.nextval, 'Cardguard', 3, 'neque sapien placerat', '2015-09-24');
insert into PROJECTS (PROJECT_ID, PROJECT_NAME, STATUS_ID, DESCRIPTION, START_DATE) values (Project_Status_ID_Sequence.nextval, 'Tres-Zap', 1, 'lobortis vel dapibus at diam nam tristique tortor eu', '2015-12-10');
insert into PROJECTS (PROJECT_ID, PROJECT_NAME, STATUS_ID, DESCRIPTION, START_DATE) values (Project_Status_ID_Sequence.nextval, 'Zontrax', -1, 'urna pretium nisl ut volutpat sapien arcu', '2015-03-28');
insert into PROJECTS (PROJECT_ID, PROJECT_NAME, STATUS_ID, DESCRIPTION, START_DATE) values (Project_Status_ID_Sequence.nextval, 'Kanlam', 3, 'tellus nulla ut erat id mauris vulputate elementum nullam', '2016-01-15');
insert into PROJECTS (PROJECT_ID, PROJECT_NAME, STATUS_ID, DESCRIPTION, START_DATE) values (Project_Status_ID_Sequence.nextval, 'Span', -1, 'aliquet massa id lobortis convallis tortor risus dapibus augue vel', '2014-03-12');
insert into PROJECTS (PROJECT_ID, PROJECT_NAME, STATUS_ID, DESCRIPTION, START_DATE) values (Project_Status_ID_Sequence.nextval, 'Lotstring', 2, 'etiam pretium iaculis', '2016-05-07');
insert into PROJECTS (PROJECT_ID, PROJECT_NAME, STATUS_ID, DESCRIPTION, START_DATE) values (Project_Status_ID_Sequence.nextval, 'Holdlamis', 3, 'proin eu mi nulla', '2017-01-05');
insert into PROJECTS (PROJECT_ID, PROJECT_NAME, STATUS_ID, DESCRIPTION, START_DATE) values (Project_Status_ID_Sequence.nextval, 'Rank', 1, 'orci luctus et', '2016-12-19');
insert into PROJECTS (PROJECT_ID, PROJECT_NAME, STATUS_ID, DESCRIPTION, START_DATE) values (Project_Status_ID_Sequence.nextval, 'Sub-Ex', 3, 'consequat ut nulla sed accumsan felis ut at', '2014-04-22');
insert into PROJECTS (PROJECT_ID, PROJECT_NAME, STATUS_ID, DESCRIPTION, START_DATE) values (Project_Status_ID_Sequence.nextval, 'Rank', 1, 'at turpis a pede posuere nonummy integer non', '2015-03-30');
insert into PROJECTS (PROJECT_ID, PROJECT_NAME, STATUS_ID, DESCRIPTION, START_DATE) values (Project_Status_ID_Sequence.nextval, 'Pannier', 3, 'lacus morbi sem', '2015-07-05');
insert into PROJECTS (PROJECT_ID, PROJECT_NAME, STATUS_ID, DESCRIPTION, START_DATE) values (Project_Status_ID_Sequence.nextval, 'Duobam', 2, 'venenatis lacinia aenean sit amet justo', '2015-10-21');
insert into PROJECTS (PROJECT_ID, PROJECT_NAME, STATUS_ID, DESCRIPTION, START_DATE) values (Project_Status_ID_Sequence.nextval, 'Wrapsafe', 2, 'enim leo rhoncus sed vestibulum', '2015-02-20');
insert into PROJECTS (PROJECT_ID, PROJECT_NAME, STATUS_ID, DESCRIPTION, START_DATE) values (Project_Status_ID_Sequence.nextval, 'Subin', 2, 'aliquet ultrices erat tortor sollicitudin mi sit amet', '2014-04-07');


--add contributors to em(mockaroo again)
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (13, 7, 3, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (31, 21, 1, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (46, 12, 1, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (24, 2, 5, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (3, 22, 4, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (25, 8, 3, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (12, 16, 5, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (12, 1, 2, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (27, 8, 5, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (25, 26, 4, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (43, 1, 1, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (39, 19, 1, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (24, 9, 3, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (14, 19, 1, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (33, 19, 2, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (21, 24, 2, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (21, 15, 1, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (32, 3, 5, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (21, 9, 2, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (29, 21, 4, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (33, 7, 3, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (25, 9, 5, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (20, 8, 4, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (26, 18, 3, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (48, 21, 4, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (48, 22, 1, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (10, 2, 5, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (43, 18, 5, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (40, 27, 2, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (36, 8, 1, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (34, 27, 3, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (4, 20, 3, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (8, 25, 3, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (8, 6, 3, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (4, 22, 3, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (27, 12, 4, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (8, 7, 5, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (36, 28, 2, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (44, 27, 4, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (38, 19, 4, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (11, 21, 3, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (35, 24, 1, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (42, 4, 2, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (28, 11, 5, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (41, 15, 3, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (8, 7, 1, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (32, 16, 3, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (3, 16, 3, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (2, 22, 1, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (20, 5, 3, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (43, 21, 2, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (12, 22, 4, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (11, 3, 4, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (18, 18, 5, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (46, 20, 2, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (27, 10, 4, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (15, 24, 4, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (17, 23, 5, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (20, 29, 3, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (20, 18, 2, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (7, 4, 1, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (23, 22, 4, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (4, 22, 4, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (11, 25, 5, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (3, 8, 3, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (29, 24, 4, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (34, 11, 5, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (21, 9, 2, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (46, 18, 1, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (35, 8, 1, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (24, 8, 4, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (32, 20, 2, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (49, 13, 4, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (15, 5, 1, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (0, 18, 5, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (7, 2, 5, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (1, 19, 4, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (32, 5, 2, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (49, 12, 2, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (7, 18, 5, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (35, 16, 5, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (20, 10, 3, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (18, 20, 5, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (35, 21, 3, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (29, 18, 3, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (36, 18, 2, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (7, 29, 1, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (30, 5, 3, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (28, 3, 2, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (34, 5, 4, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (21, 18, 1, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (1, 15, 3, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (45, 26, 3, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (48, 27, 1, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (24, 18, 1, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (47, 4, 5, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (16, 1, 4, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (29, 21, 3, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (17, 21, 1, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (44, 19, 2, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (7, 18, 4, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (42, 12, 4, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (8, 3, 4, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (9, 2, 2, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (4, 1, 3, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (43, 8, 2, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (30, 5, 4, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (16, 7, 2, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (8, 6, 5, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (26, 28, 5, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (12, 1, 5, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (37, 3, 1, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (9, 20, 4, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (41, 26, 3, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (28, 16, 3, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (44, 22, 3, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (4, 26, 2, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (47, 25, 5, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (32, 8, 4, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (14, 29, 3, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (5, 18, 4, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (14, 10, 1, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (19, 2, 5, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (36, 24, 3, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (22, 7, 2, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (33, 7, 5, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (1, 12, 3, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (47, 16, 1, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (35, 8, 2, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (48, 27, 4, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (2, 27, 2, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (26, 13, 4, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (3, 2, 2, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (40, 20, 5, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (6, 25, 1, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (32, 24, 4, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (33, 8, 1, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (30, 16, 4, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (39, 21, 1, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (16, 29, 4, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (46, 24, 5, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (46, 7, 3, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (44, 26, 1, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (19, 4, 4, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (29, 1, 2, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (21, 18, 5, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (26, 2, 5, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (18, 16, 3, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (28, 10, 4, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (13, 6, 4, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (49, 2, 5, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (38, 23, 2, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (7, 13, 2, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (48, 14, 1, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (38, 29, 3, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (10, 5, 1, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (42, 11, 3, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (44, 25, 1, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (8, 10, 5, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (27, 4, 3, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (26, 14, 2, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (32, 8, 1, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (48, 8, 4, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (6, 28, 1, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (30, 29, 1, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (6, 22, 2, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (4, 17, 1, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (9, 10, 5, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (27, 9, 2, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (32, 24, 2, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (46, 2, 5, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (44, 26, 2, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (3, 12, 4, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (31, 27, 4, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (47, 20, 5, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (36, 18, 1, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (28, 24, 4, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (23, 13, 4, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (28, 20, 4, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (42, 14, 3, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (18, 5, 2, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (41, 26, 4, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (45, 10, 3, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (28, 12, 1, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (22, 10, 2, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (49, 9, 1, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (14, 24, 3, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (27, 22, 1, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (9, 22, 1, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (42, 22, 2, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (47, 8, 1, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (11, 26, 1, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (9, 14, 5, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (41, 18, 5, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (25, 24, 1, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (2, 24, 4, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (32, 21, 3, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (27, 19, 2, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (20, 8, 3, Contribution_ID_Sequence.nextval);
insert into CONTRIBUTIONS (MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (31, 19, 1, Contribution_ID_Sequence.nextval);
