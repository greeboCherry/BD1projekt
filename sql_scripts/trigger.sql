--Add triger on changin committee members
CREATE OR REPLACE TRIGGER committee_change_trigger
  after update of MEMBER_ID on COMMITTEE_BOARD
  FOR EACH ROW
BEGIN
insert into COMMITTEE_HISTORY values (:old.title, :old.MEMBER_ID, :new.MEMBER_ID, sysdate);
end;



