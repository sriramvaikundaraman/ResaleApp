import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class UserRemove extends HttpServlet {
	private static final long serialVersionUID = 102831973239L;

  protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String email=request.getParameter("hidden");
           // out.println(email);
            
           Connection con=ConnectionManager.getConnection(); 
            PreparedStatement stmt2=con.prepareStatement("delete from user where email=?");
            stmt2.setString(1,email);
            stmt2.executeUpdate();
           stmt2.close();

           PreparedStatement stmt=con.prepareStatement("delete from uploadedfiles where email=?");
           stmt.setString(1,email);
           stmt.executeUpdate();
           stmt.close();
       // response.sendRedirect("chat.jsp");
       
        request.getRequestDispatcher("allusers.jsp").forward(request, response);
        con.close();
        }
        catch(Exception e)
        {
            out.println(e);
            
        }
    }
}