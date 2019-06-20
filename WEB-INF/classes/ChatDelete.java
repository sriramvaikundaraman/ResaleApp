import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class ChatDelete extends HttpServlet {
	private static final long serialVersionUID = 102831973239L;

  protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String semail=request.getParameter("semail");
            String remail=request.getParameter("remail");
            HttpSession session = request.getSession();
            session.setAttribute("recv", remail);
            
            Connection con=ConnectionManager.getConnection(); 
            PreparedStatement stmt2=con.prepareStatement("delete from chats where semail=? and remail=? or semail=? and remail=?");
            stmt2.setString(1,semail);
            stmt2.setString(2,remail);
            stmt2.setString(3,remail);
            stmt2.setString(4,semail);
            stmt2.executeUpdate();
           stmt2.close();
       // response.sendRedirect("chat.jsp");
       
        request.getRequestDispatcher("mychat.jsp").forward(request, response);
        con.close();
        }
        catch(Exception e)
        {
            out.println(e);
            
        }
    }
}