import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import org.json.JSONArray;
import org.json.JSONObject;

public class ChatServlet extends HttpServlet {
	private static final long serialVersionUID = 102831973239L;

  protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        System.out.println("servlet called");
         try {
         java.util.Date dt = new java.util.Date();
         java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
         String currentTime = sdf.format(dt);
         String currentdate=currentTime.substring(0,10);
         String currenttime=currentTime.substring(11);  
        String semail=request.getParameter("semail");
        String remail=request.getParameter("remail");
        String msg=request.getParameter("msg");
        Connection con=ConnectionManager.getConnection(); 
        PreparedStatement stmt2=con.prepareStatement("insert into chats values(?,?,?,?,?)");
        stmt2.setString(1, semail);
        stmt2.setString(2, remail);
        stmt2.setString(3,msg);
        stmt2.setString(4,currentdate);
        stmt2.setString(5,currenttime);
      System.out.println("Mission done");
        stmt2.executeUpdate();
        stmt2.close();
        con.close();
    }
    catch(Exception e)
    {
    	System.out.println(e);
    }
}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try{
        	Connection con=ConnectionManager.getConnection(); 
        	HttpSession session=request.getSession();
        	String semail=(String)session.getAttribute("user");
        	String remail=(String)session.getAttribute("recv");
        PreparedStatement st=con.prepareStatement("select * from chats where semail=? and remail=? or semail=? and remail=?");    
       	st.setString(1,semail);
  		st.setString(2,remail);
  		st.setString(3,remail);
 		st.setString(4,semail);
        ResultSet rs=st.executeQuery();
        JSONArray msgs =new JSONArray();
        while(rs.next())
         {   
                JSONObject msg =new JSONObject();
                msg.put("semail", rs.getString(1));
                msg.put("remail", rs.getString(2));
                msg.put("msg",rs.getString(3));
                msg.put("date",rs.getString(4));
                msg.put("time",rs.getString(5));
                
                msgs.put(msg);
        }
        request.setAttribute("msgsjson", msgs.toString());
       	System.out.println(msgs);
        RequestDispatcher rd = request.getRequestDispatcher("/chatbox.jsp");
        System.out.println("Sent");
        rd.forward(request, response);
        con.close();
        }
        catch(Exception e)
        {
            System.out.println(e.toString());
        }
   }
}