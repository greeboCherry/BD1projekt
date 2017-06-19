
import java.sql.*;


public class BD1projekt { 

	public static void main(String[] args) throws ClassNotFoundException {
		Connection connection = null;
//open up connection
		try{
			DBOperations.checkLib();		
		} catch (ClassNotFoundException e) 
			{
				System.err.println("The Oracle JDBC driver is unavailable.");
					e.printStackTrace();
				return;}
		try {
			  connection= DBOperations.connect(ConnectionData.login, ConnectionData.password);
			 
		} catch (SQLException e) {
			System.err.println("Wrong login/password.");
			e.printStackTrace();}
	
		 DBFunctions.ShowCommittee(connection);
		 
		 DBFunctions.ListContributionsWithStatuses(connection);

		 DBFunctions.AddMember(connection, "Marcin", "Koziel","greebo");
		 
		 DBFunctions.ListProjectWithStatuses(connection, -1);
		 
		boolean exit=false;
		while(exit)
		{
			
		}
	}//end of main

}
