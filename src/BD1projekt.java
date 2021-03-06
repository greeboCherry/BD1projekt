
import java.sql.*;
import java.util.Scanner;


public class BD1projekt { 
	//holds instructions for user to select from
	static String menuText=
			 "\n1 Display current committee"		//widok 1/1, select
			+"\n2 Change committee member"			//trigger 1/1, update				
			+"\n3 Display committee changes history"//tabela 1/2, select, two tables
			+"\n4 Display projects"					//tabela 2/2, select
			+"\n5 Display members with contribution count and the most frequent role" //aggregate many tables
			+"\n6 Display all contributions"		//select, many tables
			+"\n7 Add new member"					//insert
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
			  connection= DBOperations.connect(ConnectionData.url, ConnectionData.login, ConnectionData.password);
			 
		} catch (SQLException e) {
			System.err.println("Wrong login/password.");
			e.printStackTrace();}
	
		
		 //print commands for the first time
		System.out.println(menuText);
		
		//init variables typical for menu
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
				
			case '6':
				DBFunctions.ListContributionsWithStatuses(connection);
				break;
			
			case '7':
			{
				System.out.println("Put new member first name, last name and email:");
				String fname = scanner.nextLine();
				String lname = scanner.nextLine();
				String email = scanner.nextLine();
				DBFunctions.AddMember(connection, fname, lname, email);
				
				break;
			}
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
		//cleanup 
		scanner.close();
		try {
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}//end of main

}
