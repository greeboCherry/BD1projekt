import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
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
	
	/*Wypisz kto udziela sie w jakim projekcie, pelniac jaka role i jaki jest jego status*/
	static void ListContributionsWithStatuses(Connection connection)
	{
		
		ArrayList<String> output = null;
		
        try {
			output = DBOperations.executeQuery(connection, "select m.LAST_NAME, p.PROJECT_NAME, r.ROLE_NAME, ps.STATUS_NAME from MEMBERS m left join CONTRIBUTIONS c on (m.MEMBER_ID = c.MEMBER_ID) left join PROJECTS p on (p.PROJECT_ID = c.PROJECT_ID) left join ROLES r on r.ROLE_ID = c.ROLE_ID right join PROJECT_STATUSES ps on ps.STATUS_ID = p.STATUS_ID order by p.STATUS_ID desc,p.PROJECT_NAME");
			
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
			
			stmt.executeUpdate();
	
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
			
			ArrayList<String> output = null;
			
			
			String sql= "select p.PROJECT_NAME, count(m.LAST_NAME) from MEMBERS m left join CONTRIBUTIONS c on (m.MEMBER_ID = c.MEMBER_ID) left join PROJECTS p on (p.PROJECT_ID = c.PROJECT_ID)"
			+(status_id!=0 ? "where (p.STATUS_ID="+status_id+") group by p.PROJECT_NAME":" " );
			
			Statement stmt = connection.prepareStatement(sql);
			//stmt.
			
			
			for (String string : output) {
				System.out.println(string);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
