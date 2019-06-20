import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class SignOut extends HttpServlet {
 
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        session.invalidate();
        response.sendRedirect("index.jsp");
    }
}