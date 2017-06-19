
import java.sql.*;
import java.util.Scanner;


public class BD1projekt { 

	static String menuText=
			 "\n1 Display current committee"		//widok 1/1, select
			+"\n2 Change committee member"			//trigger 1/1, update				
			+"\n3 Display committee changes history"//tabela 1/2, select, two tables
			+"\n4 Display projects"					//tabela 2/2, select
			+"\n5 Display contributions and most frequent role"	//aggregate many tables
			+"\nx Exit"
			+ "\n? List commands";
	
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
	
		
		//test section
		{
		//DBFunctions.ShowCommittee(connection); //ok
		 
		 //DBFunctions.ListContributionsWithStatuses(connection); //spend whole hours debugging, not working

		 //DBFunctions.AddMember(connection, "Julia", "Szulc","bb@onet.pl");
		 
		// DBFunctions.ListProjectWithStatuses(connection, 4);
		 
		 //DBFunctions.ChangeCommitteeMember(connection, "President", 38);
		 
		 
		}
		 //print commands for the first time
		System.out.println(menuText);
		
		boolean exit=false;
		char choice = 0;
		Scanner scanner = new Scanner(System.in);
		//ask for input until 
		while(!exit)
		{
			System.out.print("Select option: ");
			try{
				scanner.reset();
			choice = scanner.nextLine().charAt(0);
			}
			catch(Exception e)
			{
				System.out.println("Bad input");
				choice=0;
			}
			
			switch (choice) {
			case '1':
					DBFunctions.ShowCommittee(connection);
				break;
			
			case '2':
			{	
				System.out.println("Put title of function and id of new committee member:");
				String title = scanner.nextLine();
				int new_id = Integer.parseInt(scanner.nextLine());		//using scanner.NextInt caused problems with with next reading
				DBFunctions.ChangeCommitteeMember(connection, title, new_id);
				break;
			}
			
			case '3':
			{
				DBFunctions.CommitteeHistory(connection);
				break;
			}
			
			case '4':
			{
				System.out.println("Choose desired status of projects to list:");
				System.out.println("-1 - Abandoned\t"
						+ "0 -Any\t"
						+ "1 - Idea\t"
						+ "2 - In Progress\t"
						+ "3 - Prototype\t"
						+ "4 - Realeased");
				int status = Integer.parseInt(scanner.nextLine());
				
				DBFunctions.ListProjectWithStatuses(connection, status);
				break;
			}
			
			
			case '5':
				DBFunctions.ListMemberContributionsAndRoles( connection);
				break;
				
			case '?':
				System.out.println(menuText);
				break;
			case 'x':
				System.out.println("Confirm Exit Y/n");
				try{
					choice = scanner.nextLine().charAt(0);
					}
					catch(Exception e)
					{
						System.out.println("Bad input");
					} 
				if(Character.toLowerCase(choice)=='y')
				{
					exit=true;
					System.out.println("Goodbye");
				}
				break;
			default:
				System.out.println("Option not found");
				break;
			}
		}
		scanner.close();
		try {
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}//end of main

}
