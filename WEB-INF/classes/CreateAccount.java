import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class CreateAccount extends HttpServlet {
	private static final long serialVersionUID = 102831973239L;

  protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
           
            String name=request.getParameter("name");
            String email=request.getParameter("email");
            String pass=request.getParameter("pass");
            String doorno=request.getParameter("doorno");
            String street=request.getParameter("street");
            String locality=request.getParameter("locality");
            String city=request.getParameter("city");
            String pincode=request.getParameter("pincode");
            String contactno=request.getParameter("contactno");
        Class.forName("com.mysql.jdbc.Driver");  
        Connection con=ConnectionManager.getConnection(); 

        PreparedStatement stmt3=con.prepareStatement("select count(*) from user where contactno=?");
        stmt3.setString(1,contactno);
        ResultSet rs3=stmt3.executeQuery();
        rs3.next();
        int count3=Integer.parseInt(rs3.getString(1));
         PreparedStatement stmt1=con.prepareStatement("select count(*) from user where email=?");
        stmt1.setString(1,email);
        ResultSet rs1=stmt1.executeQuery();
        rs1.next();
        int count=Integer.parseInt(rs1.getString(1));
        if(count>=1)
        {
        	out.println("<h1>User email already exists!</h1>");
             response.setHeader("Refresh", "2;signup.html");

        }
        else if(count3>=1)
        {
            out.println("<h1>User mobile number already exists!</h1>");
             response.setHeader("Refresh", "2;signup.html");
        }
        else
        {

       PreparedStatement stmt=con.prepareStatement("create table if not exists user(names varchar(20),email varchar(20),pass varchar(20),doorno varchar(20),street varchar(20),locality varchar(20),city varchar(20),pincode varchar(20),contactno varchar(20))");
        stmt.executeUpdate();
        PreparedStatement stmt2=con.prepareStatement("insert into user values(?,?,?,?,?,?,?,?,?)");
        stmt2.setString(1, name);
        stmt2.setString(2, email);
        stmt2.setString(3,pass);
        stmt2.setString(4,doorno);
        stmt2.setString(5,street);
        stmt2.setString(6,locality);
        stmt2.setString(7,city);
        stmt2.setString(8,pincode);
        stmt2.setString(9,contactno);
    //  System.out.println("\nFetched data:\n");
        stmt2.executeUpdate();
        stmt2.close();
        HttpSession session = request.getSession();
        session.setAttribute("user", email);
        response.sendRedirect("welcome");  
        out.println(count);
    }
        con.close();
        }
        catch(Exception e)
        {
            out.println(e);
            
        }
    }
}