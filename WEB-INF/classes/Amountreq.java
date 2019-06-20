import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;


public class Amountreq extends HttpServlet {
	private static final long serialVersionUID = 102831973239L;

  protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {



            String id=request.getParameter("hidden");
           // out.println(id);
            HttpSession session = request.getSession();
            String user = (String)session.getAttribute("user");
             java.util.Date dt = new java.util.Date();

            java.text.SimpleDateFormat sdf = 
            new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

            String currentTime = sdf.format(dt);

            String currentdate=currentTime.substring(0,10);
            String currenttime=currentTime.substring(11);
           
            String amount=request.getParameter("amount"); 
            int a=Integer.parseInt(amount);

        Connection con=ConnectionManager.getConnection();  
        PreparedStatement stmt=con.prepareStatement("create table if not exists requests(email  varchar(300),id int(100),amount int(100),dates date,times time, primary key(email,id));");
        stmt.executeUpdate();

       PreparedStatement stmt1=con.prepareStatement("select * from uploadedfiles where id=?");
        stmt1.setString(1,id);
        //out.println(id);
        ResultSet rs=stmt1.executeQuery();
        rs.next();
        String email=rs.getString("email");
        String am=rs.getString("price").toString().trim();
        int actualAmount=Integer.parseInt(am);
       // out.println(actualAmount);
        double maxDiscount=actualAmount*0.9;

        if(a<maxDiscount)
        {
        	out.println("<h1>The amount is too low to request</h1>");
        	 response.setHeader("Refresh", "2;requests.jsp");
        }

        else
        {
      //  out.println(actualAmount);	
      //  out.println("Entered else part");

      PreparedStatement stmt2=con.prepareStatement("insert into requests values(?,?,?,?,?)");
        stmt2.setString(1, user);
        stmt2.setString(2, id);
        stmt2.setString(3,amount);
        stmt2.setString(4,currentdate);
        stmt2.setString(5,currenttime);
           //  System.out.println("\nFetched data:\n");
        stmt2.executeUpdate();
        stmt2.close();
        con.close();
                
         response.sendRedirect("userwelcome.jsp");
       }
    }
        catch(Exception e)
        {
        	//out.println(e);
            out.println("<h1>You have already requested this product</h1>");
       
            
        }

    }
}