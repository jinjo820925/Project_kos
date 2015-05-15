package ex1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectUtil {

	static{
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("����̺� �ε� �Ϸ�!");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public static Connection getConn() throws SQLException{
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "kosta97";
		String password = "test09";
		try {
			return DriverManager.getConnection(url, user, password);
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("����̹� �ε�~"+e.getMessage());
			return null;
		}
	}
}
