import java.sql.Connection;
import java.sql.PreparedStatement;

import java.util.ArrayList;


public class DBFunctions {

	
	/*Wypisz zarz¹d*/
	static void ShowCommittee(Connection connection)
	{
		ArrayList<String> output = null;
		
		
            try {
				output = DBOperations.executeQuery(connection, "SELECT * FROM COMMITTEE_VIEW");
				
				System.out.println("Role\t First_Name\t Last_Name\t email");
				for (String string : output) {
					System.out.println(string);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
  	}
	
	/*Wypisz kto udziela sie w jakim projekcie, pelniac jaka role i jaki jest jego status
	 * @notworking!
	 * */
	static void ListContributionsWithStatuses(Connection connection)
	{
		
		ArrayList<String> output = null;
	
		String sql="select m.LAST_NAME, p.PROJECT_NAME, r.ROLE_NAME, ps.STATUS_NAME from MEMBERS m, PROJECTS p, Roles r, CONTRIBUTIONS c, PROJECT_STATUSES ps where (m.MEMBER_ID = c.MEMBER_ID) and (p.PROJECT_ID = c.PROJECT_ID) and (r.ROLE_ID = c.ROLE_ID) and (p.STATUS_ID = ps.STATUS_ID)order by p.STATUS_ID desc, p.PROJECT_NAME";
						
        try {
			output = DBOperations.executeQuery(connection, sql);
			
			System.out.println("Member\t Project\t Role\t Status");
			for (String string : output) {
				System.out.println(string);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	/*Dodaj czlonka*/
	static void AddMember(Connection connection, String first_name, String last_name, String email)
	{
		try {
			String sql= "insert into MEMBERS(MEMBER_ID, FIRST_NAME, LAST_NAME, JOIN_DATE,EMAIL) values(Member_ID_Sequence.nextval, ?, ?, SYSDATE, ?)";
			PreparedStatement stmt = connection.prepareStatement(sql);
			
			stmt.setString(1, first_name);
			stmt.setString(2, last_name);
			stmt.setString(3, email);
			if(stmt.executeUpdate()>0)
			{
				System.out.println("New member added");
			}
			else
				System.out.println("There was some error");
	
		} catch (Exception e) {
			System.out.println("There was very specific error");
			e.printStackTrace();
		}
		
	}
	/*Zmien czlonka zarzadu*/
	static void ChangeCommitteeMember(Connection connection, String title, int new_id)
	{
		try {
			String sql= "update COMMITTEE_BOARD SET MEMBER_ID= ? where TITLE= ?";
			PreparedStatement stmt = connection.prepareStatement(sql);
			
			stmt.setInt(1, new_id);
			stmt.setString(2, title);
			stmt.executeUpdate();
	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	/*Wypisz historie zmian czlonków zarz¹du*/
	static void CommitteeHistory(Connection connection)
	{
		ArrayList<String> output = null;
		
			String sql="select ch.TITLE, o.LAST_NAME, n.LAST_NAME, ch.CHANGE_DATE "
					+ "from COMMITTEE_HISTORY ch, MEMBERS o, MEMBERS n "
					+ "where o.MEMBER_ID=ch.OLD_MEMBER_ID and n.MEMBER_ID=ch.NEW_MEMBER_ID "
					+ "order by ch.CHANGE_DATE desc";
			 try {
					output = DBOperations.executeQuery(connection, sql);
					
					System.out.println("Title\t Old\t New\tChange Date ");
					for (String string : output) {
						System.out.println(string);
					}
					
				} catch (Exception e) {
					e.printStackTrace();
				}
			
	}

	/*Wypisz projekty o danym statusie
	 * 0 -any
	 * other - where (p.STATUS_ID=status_id)
	 * */
	static void ListProjectWithStatuses(Connection connection, int status_id)
	{
		try {
			String sql= "select p.PROJECT_NAME, count(m.LAST_NAME), ps.STATUS_NAME "
					+ "from MEMBERS m left join CONTRIBUTIONS c on (m.MEMBER_ID = c.MEMBER_ID) left join PROJECTS p on (p.PROJECT_ID = c.PROJECT_ID) left join PROJECT_STATUSES ps on ps.STATUS_ID = p.STATUS_ID"
			+(status_id!=0 ? " where (p.STATUS_ID="+status_id+")":"")+" group by p.PROJECT_NAME, ps.STATUS_NAME";
			
			ArrayList<String> output = DBOperations.executeQuery(connection, sql);
			
			System.out.println("Project\t Team size\t Status\t");
			for (String string : output) {
				System.out.println(string);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	static void ListMemberContributionsAndRoles(Connection connection)
	{
		
		try {
		String sql="select m.Member_ID, m.LAST_NAME, count(c.ROLE_ID), STATS_MODE(r.role_name) "
				+ "from MEMBERS m left join CONTRIBUTIONS c on (m.MEMBER_ID = c.MEMBER_ID) "
				+ "left join ROLES r on r.ROLE_ID=c.ROLE_ID "
				+ "group by m.Member_ID, m.LAST_NAME "
				+ "order by STATS_MODE(r.role_name), count(c.ROLE_ID) desc";

		ArrayList<String> output = DBOperations.executeQuery(connection, sql);
		
		System.out.println("Member ID and name\t Cont count\t Favourite role");
		for (String string : output) {
			System.out.println(string);
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}
		
		
	}
	
}
