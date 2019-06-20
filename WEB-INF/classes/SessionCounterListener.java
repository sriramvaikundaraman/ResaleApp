import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import javax.servlet.http.*;
import javax.servlet.*;
import java.util.*;

public class SessionCounterListener implements HttpSessionListener {

  private static int totalActiveSessions;
	private static final Map<String, HttpSession> sessions = new HashMap<String, HttpSession>();
  public static int getTotalActiveSession(){
	return totalActiveSessions;
  }
	
  @Override
  public void sessionCreated(HttpSessionEvent event) {
	totalActiveSessions++;
  HttpSession session = event.getSession();
  sessions.put(session.getId(), session);
  System.out.println(session.getAttribute("user")+"");

	System.out.println("sessionCreated - add one session into counter "+totalActiveSessions);
  }

  @Override
  public void sessionDestroyed(HttpSessionEvent arg0) {
	totalActiveSessions--;
	System.out.println("sessionDestroyed - deduct one session from counter ");
  }	
}