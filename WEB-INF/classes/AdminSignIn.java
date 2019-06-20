import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class AdminSignIn extends HttpServlet {
	private static final long serialVersionUID = 102831973239L;

  protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
           
            String email=request.getParameter("email");
            String pass=request.getParameter("pass");
           	if(email.equals("admin@gmail.com")&&pass.equals("admin"))
			{
				  HttpSession session = request.getSession();
           			session.setAttribute("user", email);
           			 response.sendRedirect("adminwelcome.jsp");	
           			}
				//  response.sendRedirect("index.html");
			else
				{
           out.println("<h1>Invalid Username or password</h1>");
            response.setHeader("Refresh", "2;index.jsp");
        }
		}
		 catch(Exception e)
        {
            out.println(e);
            
        }
    }
}

			