-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2017-06-08 17:00:54.937

-- views
DROP VIEW Committee_View;

-- foreign keys
ALTER TABLE Contributions
    DROP CONSTRAINT Contributions_Members;

ALTER TABLE Contributions
    DROP CONSTRAINT Contributions_Projects;

ALTER TABLE Committee_Board
    DROP CONSTRAINT Members_Committee_Board;

ALTER TABLE Committee_History
    DROP CONSTRAINT Members_Committee_History;

ALTER TABLE Projects
    DROP CONSTRAINT Projects_Statuses;

ALTER TABLE Contributions
    DROP CONSTRAINT Roles_Contributions;

-- tables
DROP TABLE Committee_Board;

DROP TABLE Committee_History;

DROP TABLE Contributions;

DROP TABLE Members;

DROP TABLE Project_Statuses;

DROP TABLE Projects;

DROP TABLE Roles;

-- End of file.

DROP SEQUENCE Role_ID_SEQUENCE;
DROP SEQUENCE PROJECT_STATUS_ID_SEQUENCE;
DROP SEQUENCE MEMBER_ID_SEQUENCE;
DROP SEQUENCE Contribution_ID_SEQUENCE;
