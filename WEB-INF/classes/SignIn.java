import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class SignIn extends HttpServlet {
	private static final long serialVersionUID = 102831973239L;

  protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
           
            String email=request.getParameter("email");
            String pass=request.getParameter("pass");
            Class.forName("com.mysql.jdbc.Driver");  
			Connection con=ConnectionManager.getConnection(); 
			PreparedStatement stmt1=con.prepareStatement("select count(*) as counter from user where email =? and pass=?");
			stmt1.setString(1,email);
			stmt1.setString(2,pass);
			ResultSet rs=stmt1.executeQuery();
			rs.next();
			int c=rs.getInt("counter");
			if(c>0)
			{
				  HttpSession session = request.getSession();
           			session.setAttribute("user", email);
           			 response.sendRedirect("welcome");	
           	}
				//  response.sendRedirect("index.html");
			else
				out.println("<h1>Invalid UserName or password</h1>");
				 response.setHeader("Refresh", "2;signin.html");


			stmt1.close();
			con.close();
		}
		 catch(Exception e)
        {
            out.println(e);
            
        }
    }
}
			