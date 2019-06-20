import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class ChatSend extends HttpServlet {
	private static final long serialVersionUID = 102831973239L;

  protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            java.util.Date dt = new java.util.Date();
            java.text.SimpleDateFormat sdf = 
            new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String currentTime = sdf.format(dt);
            String currentdate=currentTime.substring(0,10);
            String currenttime=currentTime.substring(11);
            String semail=request.getParameter("semail");
            String remail=request.getParameter("remail");
            String msg=request.getParameter("msg");
            String id=request.getParameter("id");
            HttpSession session = request.getSession();
            session.setAttribute("id", id);
            
        Connection con=ConnectionManager.getConnection(); 
        PreparedStatement stmt2=con.prepareStatement("insert into chats values(?,?,?,?,?)");
        stmt2.setString(1, semail);
        stmt2.setString(2, remail);
        stmt2.setString(3,msg);
        stmt2.setString(4,currentdate);
        stmt2.setString(5,currentTime);
        
    //  System.out.println("\nFetched data:\n");
        stmt2.executeUpdate();
        stmt2.close();
       // response.sendRedirect("chat.jsp");
        request.setAttribute("id", id);
        request.getRequestDispatcher("chat.jsp").forward(request, response);
        con.close();
        }
        catch(Exception e)
        {
            out.println(e);
            
        }
    }
}