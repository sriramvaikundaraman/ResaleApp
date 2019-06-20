import java.sql.*;


public class ConnectionManager {
    private static String url = "jdbc:mysql://localhost:3306/sriram?autoReconnect=true&useSSL=false";
    private static String driverName = "com.mysql.jdbc.Driver";
    private static String username = "root";
    private static String password = "8754206937";
    private static Connection con;


    public static Connection getConnection() throws Exception {
        try {
            Class.forName(driverName);
            try {
                con = DriverManager.getConnection(url, username, password);
            } catch (SQLException ex) {
                System.out.println(ex);
            }
        } catch (ClassNotFoundException ex) {
            System.out.println("Driver not found. Please check class path, and use proper connector file");
        }
        return con;
    }
}
