package cookies;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UsingCookies extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {

/*	System.out.println( "Creating new cookie: " + req.getParameter("a") + " " + req.getParameter("b") + " " + req.getParameter("c") ); */ 

	String delete = req.getParameter("delete");
		
	if (delete == null)
	{
		String username = "default";
		if ( req.getUserPrincipal() != null )
			username = req.getUserPrincipal().getName();
		
		Date now = new Date();
		String timestamp = now.toString();
		Cookie cookie = new Cookie(username, "");
		cookie.setComment( timestamp );
		cookie.setValue( req.getParameter("a") + " : " + req.getParameter("b") + " : " + req.getParameter("c"));
		cookie.setMaxAge(365 * 24 * 60 * 60);
		resp.addCookie(cookie);
	}
	else
	{
		Cookie[] c = req.getCookies();
		
		for (int i=0; i<c.length; i++)
		{
			String name = c[i].getName();
			if ( name.equals(delete) )
			{
				c[i].setMaxAge(0);
				resp.addCookie(c[i]);
			}
		}
	}
	
	resp.sendRedirect("cookies.jsp");
	
	}
}
