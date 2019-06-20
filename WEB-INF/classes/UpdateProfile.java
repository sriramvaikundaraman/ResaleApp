import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class UpdateProfile extends HttpServlet {
	private static final long serialVersionUID = 102831973239L;

  protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            Connection con=ConnectionManager.getConnection(); 
            HttpSession session=request.getSession();
            String email= (String)session.getAttribute("user");
            String name=request.getParameter("name");
            String contact=request.getParameter("contact");
            if(name!=null)
            {
         
            PreparedStatement stmt2=con.prepareStatement("update user set names=? where email=?");
            stmt2.setString(1,name);
            stmt2.setString(2, email);
            stmt2.executeUpdate();
            stmt2.close();
            out.println("<h1 align='center'>Your name has been updated</h1>");
            response.setHeader("Refresh", "2;userwelcome.jsp");
            con.close();



            }
            if(contact!=null)
            {
             PreparedStatement stmt1=con.prepareStatement("select count(*) from user where contactno=?");
              stmt1.setString(1,contact);
           ResultSet rs1=stmt1.executeQuery();
           rs1.next();
          int count=Integer.parseInt(rs1.getString(1));
          if(count>=1)
         {
             out.println("<h1 align='center'>Mobile number already exits</h1>");
              response.setHeader("Refresh", "2;updateprofile.jsp");

        }
        else
        {
            PreparedStatement stmt2=con.prepareStatement("update user set contactno=? where email=?");
            stmt2.setString(1,contact);
            stmt2.setString(2, email);
            stmt2.executeUpdate();
            stmt2.close();
            out.println("<h1 align='center'>Mobile number has been updated</h1>");
            response.setHeader("Refresh", "2;userwelcome.jsp");
            con.close();
        }
    }
}
        catch(Exception e)
        {
            out.println(e);
            
        }
    }
           


 }
