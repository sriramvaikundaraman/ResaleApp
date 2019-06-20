import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class MarkSold extends HttpServlet {
	private static final long serialVersionUID = 102831973239L;

  protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
           
            String id=request.getParameter("hidden");
            Connection con=ConnectionManager.getConnection(); 
        PreparedStatement stmt2=con.prepareStatement("update uploadedfiles set status=1 where id=?");
        stmt2.setString(1, id);
    //  System.out.println("\nFetched data:\n");
        stmt2.executeUpdate();
        stmt2.close();
        response.sendRedirect("myproducts.jsp");
        con.close();
        }
        catch(Exception e)
        {
            out.println(e);
            
        }
    }
}