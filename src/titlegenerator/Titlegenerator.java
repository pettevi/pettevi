package titlegenerator;

import java.io.IOException;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Titlegenerator extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
		
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
		
		
		String[] a = {"Lead",
		"Senior",
		"Junior",
		"Direct",
		"Corporate",
		"Dynamic",
		"Future",
		"Product",
		"National",
		"Regional",
		"District",
		"Central",
		"Global",
		"Customer",
		"Investor",
		"Dynamic",
		"International",
		"Legacy",
		"Forward",
		"Internal",
		"Human",
		"Chief",
		"Principal",
		"Evangelist",
		"Strategic",
		"Mobility"
		};
		
		String[] b = {
		"Solutions",
		"Program",
		"Brand",
		"Security",
		"Research",
		"Marketing",
		"Directives",
		"Implementation",
		"Integration",
		"Functionality",
		"Response",
		"Paradigm",
		"Tactics",
		"Identity",
		"Markets",
		"Group",
		"Division",
		"Applications",
		"Optimization",
		"Operations",
		"Infrastructure",
		"Intranet",
		"Communications",
		"Web",
		"Branding",
		"Quality",
		"Assurance",
		"Mobility",
		"Accounts",
		"Data",
		"Creative",
		"Configuration",
		"Accountability",
		"Interactions",
		"Factors",
		"Usability",
		"Metrics",
		"Enterprise"
		};

		
		String[] c = {
		"Supervisor",
		"Associate",
		"Executive",
		"Liason",
		"Officer",
		"Manager",
		"Engineer",
		"Specialist",
		"Director",
		"Coordinator",
		"Administrator",
		"Architect",
		"Analyst",
		"Designer",
		"Planner",
		"Orchestrator",
		"Technician",
		"Developer",
		"Producer",
		"Consultant",
		"Assistant",
		"Facilitator",
		"Agent",
		"Representative",
		"Strategist",
		"Evangelist"
		};
		
		Random r = new Random();
		int valueA = r.nextInt(a.length);
		int valueB = r.nextInt(b.length);
		int valueC = r.nextInt(c.length);
		
		String title = a[valueA] + " " + b[valueB] + " " + c[valueC];

		req.setAttribute("title", title);

		RequestDispatcher disp;
		disp = getServletContext().getRequestDispatcher("/titlegenerator.jsp");
		if (disp != null)
			disp.forward(req, resp);
		
	}
	
}
