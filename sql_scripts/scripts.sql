/*Wypisz ile "udzielen sie" ma ka¿dy member */
select m.LAST_NAME, count(c.ROLE_ID)
from MEMBERS m left join CONTRIBUTIONS c on (m.MEMBER_ID = c.MEMBER_ID)
group by m.LAST_NAME order by count(c.ROLE_ID) desc;

/*Wypisz ile "udzielen sie" ma ka¿dy member  i jak¹ funkcjê pelni najczesciej*/
select m.LAST_NAME, count(c.ROLE_ID), STATS_MODE(r.role_name)
from MEMBERS m left join CONTRIBUTIONS c on (m.MEMBER_ID = c.MEMBER_ID) left join ROLES r on r.ROLE_ID=c.ROLE_ID
group by m.LAST_NAME order by STATS_MODE(r.role_name), count(c.ROLE_ID) desc;

/*jw. proœciej*/

select MEMBERS.LAST_NAME, count(CONTRIBUTIONS.ROLE_ID)
from MEMBERS left join CONTRIBUTIONS on (MEMBERS.MEMBER_ID = CONTRIBUTIONS.MEMBER_ID)
group by MEMBERS.LAST_NAME;

/*Wypisz ile "udzielen sie" ma ka¿dy member  i jak¹ funkcjê pelni najczesciej ale where*/
select m.LAST_NAME, count(c.ROLE_ID), STATS_MODE(r.role_name)
from MEMBERS m, CONTRIBUTIONS c,  ROLES r  
where (m.MEMBER_ID = c.MEMBER_ID) and r.ROLE_ID=c.ROLE_ID
group by m.LAST_NAME order by STATS_MODE(r.role_name), count(c.ROLE_ID) desc;
/*Wypisz historie zmian w zarzadzie*/
select ch.TITLE, o.LAST_NAME, n.LAST_NAME, ch.CHANGE_DATE
from COMMITTEE_HISTORY ch, MEMBERS o, MEMBERS n
where o.MEMBER_ID=ch.OLD_MEMBER_ID and n.MEMBER_ID=ch.NEW_MEMBER_ID
order by ch.CHANGE_DATE desc;


/*Wypisz w ilu projetkach bierze udzial kazdy z czlonkow*/
select m.LAST_NAME, count(p.PROJECT_ID) as "Ile projektow wposltworzy"
from MEMBERS m left join CONTRIBUTIONS c on (m.MEMBER_ID = c.MEMBER_ID) left join PROJECTS p on (p.PROJECT_ID = c.PROJECT_ID)
group by m.LAST_NAME order by count(p.PROJECT_ID) desc;

/*Wypisz kto udziela sie w jakims projekcie pelniac kilka rol*/
select m.LAST_NAME, count(p.PROJECT_ID) as "Ile projektow wposltworzy", count(c.ROLE_ID)
from MEMBERS m inner join CONTRIBUTIONS c on (m.MEMBER_ID = c.MEMBER_ID) inner join PROJECTS p on (p.PROJECT_ID = c.PROJECT_ID)
group by m.LAST_NAME order by count(p.PROJECT_ID) desc;

/*Wypisz kto udziela sie w jakim projekcie, pelniac jaka role i jaki jest jego status*/
select m.LAST_NAME, p.PROJECT_NAME, r.ROLE_NAME, ps.STATUS_NAME
from MEMBERS m left join CONTRIBUTIONS c on (m.MEMBER_ID = c.MEMBER_ID) left join PROJECTS p on (p.PROJECT_ID = c.PROJECT_ID)
left join ROLES r on r.ROLE_ID = c.ROLE_ID right join PROJECT_STATUSES ps on ps.STATUS_ID = p.STATUS_ID
order by p.STATUS_ID desc,p.PROJECT_NAME;

/*Wypisz projekty ktore zostaly sprzedane*/
select p.PROJECT_NAME, count(m.LAST_NAME) as "Team size"
from MEMBERS m left join CONTRIBUTIONS c on (m.MEMBER_ID = c.MEMBER_ID) left join PROJECTS p on (p.PROJECT_ID = c.PROJECT_ID)
where (p.STATUS_ID=4)
group by p.PROJECT_NAME;

/*Wypisz zarz¹d*/
select * from COMMITTEE_VIEW;

/*change committee member*/
update COMMITTEE_BOARD SET MEMBER_ID=34
where TITLE='Programming Tutor';


/*Dodaj czlonka*/
insert into MEMBERS values(Member_ID_Sequence.nextval, 'Corabel', 'Mercer', SYSDATE, 'cmercerq@sciencedaily.com');

--PROJEKTY

/*Utworz projekt*/
insert into PROJECTS (PROJECT_ID, PROJECT_NAME, STATUS_ID, DESCRIPTION, START_DATE) values (Project_Status_ID_Sequence.nextval, 'Sub-Ex', 1, 'posuere nonummy integer non velit donec diam neque', SYSDATE);

/*Zmien status projektu*/
update PROJECTS SET STATUS_ID=2
where PROJECT_ID=2;

/*Dodaj czlonka do projektu*/
insert into CONTRIBUTIONS(MEMBER_ID, PROJECT_ID, ROLE_ID, CONTRIBUTION_ID) values (2, 3, 1, Contribution_ID_Sequence.nextval);


--debug

select m.LAST_NAME, p.PROJECT_NAME, r.ROLE_NAME, ps.STATUS_NAME from MEMBERS m inner join CONTRIBUTIONS c on (m.MEMBER_ID = c.MEMBER_ID) inner join PROJECTS p on (p.PROJECT_ID = c.PROJECT_ID) inner join ROLES r on r.ROLE_ID = c.ROLE_ID inner join PROJECT_STATUSES ps on p.STATUS_ID = ps.STATUS_ID order by p.STATUS_ID desc,p.PROJECT_NAME;

select m.LAST_NAME, p.PROJECT_NAME, r.ROLE_NAME, ps.STATUS_NAME from MEMBERS m, PROJECTS p, Roles r, CONTRIBUTIONS c, PROJECT_STATUSES ps where (m.MEMBER_ID = c.MEMBER_ID) and (p.PROJECT_ID = c.PROJECT_ID) and (r.ROLE_ID = c.ROLE_ID) and (p.STATUS_ID = ps.STATUS_ID)order by p.STATUS_ID desc, p.PROJECT_NAME;


select m.LAST_NAME, p.PROJECT_NAME, r.ROLE_NAME, ps.STATUS_NAME from MEMBERS m left join CONTRIBUTIONS c on m.MEMBER_ID = c.MEMBER_ID left join PROJECTS p on p.PROJECT_ID = c.PROJECT_ID left join ROLES r on r.ROLE_ID = c.ROLE_ID left join PROJECT_STATUSES ps on ps.STATUS_ID = p.STATUS_ID order by p.STATUS_ID desc, p.PROJECT_NAME;