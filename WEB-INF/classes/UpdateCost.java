import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class UpdateCost extends HttpServlet {
	private static final long serialVersionUID = 102831973239L;

  protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
           
            String id=request.getParameter("hidden");
            String price=request.getParameter("amount");
            Connection con=ConnectionManager.getConnection(); 
        PreparedStatement stmt2=con.prepareStatement("update uploadedfiles set price=? where id=?");
        stmt2.setString(1,price);
        stmt2.setString(2, id);
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