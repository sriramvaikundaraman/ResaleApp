import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class MyServlet extends HttpServlet {
	private static final long serialVersionUID = 102831973239L;

  protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
           
            String user=request.getParameter("username");
            String pass=request.getParameter("password");
            out.println("<h2> Welcome "+user+"</h2>");
        Class.forName("com.mysql.jdbc.Driver");  
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sriram?useSSL=false","root","8754206937"); 
        PreparedStatement stmt=con.prepareStatement("create table if not exists user(names varchar(20),pass varchar(20))");
        stmt.executeUpdate();
        PreparedStatement stmt2=con.prepareStatement("insert into user values(?,?)");
        stmt2.setString(1, user);
        stmt2.setString(2, pass);
    //  System.out.println("\nFetched data:\n");
        stmt2.executeUpdate();
        stmt2.close();
        con.close();
        }
        catch(Exception e)
        {
            out.println(e);
            
        }
    }
}