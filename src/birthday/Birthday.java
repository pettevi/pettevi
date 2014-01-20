package birthday;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class Birthday extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {

		req.setAttribute("month", req.getParameter("month"));
		req.setAttribute("day", req.getParameter("day"));
		req.setAttribute("year", req.getParameter("year"));

		if ( isValid(req) )
		{
			req.setAttribute("validity", "valid");
			req.setAttribute("bdate", req.getParameter("month") + " " + req.getParameter("day") + " " + req.getParameter("year"));
		}
		else
		{
			req.setAttribute("validity", "invalid");
		}

		RequestDispatcher disp;
		disp = getServletContext().getRequestDispatcher("/birthday.jsp");

		if (disp != null)
			disp.forward(req, resp);
	}
	
	private boolean isValid(HttpServletRequest req)
	{
		boolean retval = false;
		String[] months = {"january", "february", "March", "April", "May", "June", "July","August","September","October","November","December"};

		String m = req.getParameter("month");
		m = m.toLowerCase().trim();
		
		for (String s: months)
		{
			if (s.compareToIgnoreCase(m) == 0)
				retval = true;
		}
		
		String d = req.getParameter("day");
		int day = Integer.parseInt(d);
		
		if (day < 1 || day > 31)
			retval = false;			
			
		String y = req.getParameter("year");
		int year = Integer.parseInt(y);
		
		if (year < 1900 || year > 2000)
			retval = false;			
				
		return retval;
	}
}
