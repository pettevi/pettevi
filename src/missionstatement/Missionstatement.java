package missionstatement;

import java.io.IOException;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Missionstatement extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
		
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {

		Random r = new Random();


		String x;
		if ( r.nextInt(4) < 1)
			x = " to continue ";
		else
			x = " ";
		

		String y;
		switch ( r.nextInt(5) )
		{
		case 0:
			y = " as well as continue ";
			break;
		case 1:
			y = " while continuing ";
			break;
		case 2:
			y = " as well as endeavor ";
			break;
		case 3:
			y = " while endeavoring ";
			break;
		default:
			y = " to allow us to continue ";
		}

		
		String end;
		switch ( r.nextInt(6) )
		{
		case 0:
			end = " for 100% customer satisfaction.";
			break;
		case 1:
			end = " while maintaining the highest standards.";
			break;
		case 2:
			end = " while maintaining 100% customer satisfaction.";
			break;
		case 3:
			end = " to set us apart from competition.";
			break;
		case 4:
			end = " to meet our customer's needs.";
			break;
		default:
			end = ".";
		}


		String mission = beginning(r) + x + getSentence(r) + y + getSentence(r) + end;

		req.setAttribute("mission", mission);

		RequestDispatcher disp;
		disp = getServletContext().getRequestDispatcher("/missiongenerator.jsp");
		if (disp != null)
			disp.forward(req, resp);

	}

	private String beginning(Random r)
	{
		String s;
		
		String[] mission={
		"mission",
		"objective",
		"commitment",
		"vision",
		"business",
		"challenge",
		"goal",
		"responsibility",
		"job"
		};
		
		String[] one={
		"Our %s is",
		"It is our %s",
		};

		int a = r.nextInt(mission.length);
		int b = r.nextInt(one.length);
		
		String word = mission[a];
		String start = one[b];
		
		s = String.format(start, word);
		
		return s;
	}
	
	private String getSentence(Random r)
	{
		String adverb = getAdverb(r);
		String verb = getVerb(r);
		String adjective = getAdjective(r);
		String noun = getNoun(r);

		return String.format("to %s %s %s %s", adverb, verb, adjective, noun);
	}
	
	private String getAdverb(Random r)
	{
		String[] adverbs =
		{
		"assertively", "authoritatively", "collaboratively", "competently", "completely", "continually", "conveniently", "dramatically", "efficiently", "enthusiastically", "globally", "interactively", "proactively", "professionally", "quickly", "seamlessly", "synergistically"
		};
		
		return adverbs[r.nextInt(adverbs.length)];
	}
	
	private String getVerb(Random r)
	{
		String[] verbs =
		{
		"improve", "administrate", "build", "coordinate", "create", "customize", "disseminate", "engineer", "enhance", "embrace", "facilitate", "fashion", "foster", "initiate", "integrate", "leverage", "leverage others'", "leverage existing", "maintain", "monetize", "morph", "negotiate", "network", "operationalize", "optimize", "orchestrate", "productize", "promote", "provide access to", "pursue", "recontextualise", "restore", "revolutionize", "simplify", "synergize", "synthesize", "supply", "utilize"	
		};
		
		return verbs[r.nextInt(verbs.length)];
	}
	
	private String getAdjective(Random r)
	{
		String[] adjectives =
		{
		"best-of-breed", "best practice", "business", "competitive", "corporate", "cost effective", "cutting-edge", "diverse", "e-business", "e-commerce", "e-markets", "e-services", "e-tailers", "economically sound", "effective", "emerging", "enterprise", "enterprise-wide", "error-free", "ethical", "excellent", "extensible", "high standards in", "high-payoff", "high-quality", "holistic", "inexpensive", "innovative", "interdependent", "leading-edge", "long-term high-impact", "low-risk high-yield", "market-driven", "mission-critical", "multimedia based", "next-generation", "outcome-driven", "parallel", "performance based", "paradigm-shift", "principle-centered", "professional", "progressive", "prospective", "quality", "resource-leveling", "revolutionary", "scalable", "seven-habits-conforming", "timely", "unique", "user-centric", "value-added", "viral", "virtual", "web 2.0", "web 3.0", "world-class"
		};

		return adjectives[r.nextInt(adjectives.length)];
	}
	
	private String getNoun(Random r)
	{
		String[] nouns =
		{
		"lives", "benefits", "catalysts for change", "content", "data", "deliverables", "information", "infrastructures",  "intellectual capital", "leadership skills", "materials", "meta-services", "methods", "methods of empowerment", "mindshare", "opportunities", "paradigms", "products", "resources", "services", "solutions", "sources", "technologies"
		};

		return nouns[r.nextInt(nouns.length)];
	}

}