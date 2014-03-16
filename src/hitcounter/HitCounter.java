package hitcounter;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.datastore.*;
import com.google.appengine.api.datastore.PreparedQuery.TooManyResultsException;

public class HitCounter extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException {

	    DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
	    Key myKey = KeyFactory.createKey("hitcounter", "pettevi");

	    Query query = new Query("hitcounter", myKey);
	    Entity counterEntity = null;
	    try {
	    	counterEntity = datastore.prepare(query).asSingleEntity();
	    } catch(TooManyResultsException e) {
	    	System.out.println("OOooops!"); 
	    }
	    
	    if (counterEntity == null)
	    {
//	    	System.out.println("counterEntity:" + counterEntity); 
	        Entity newCounter = new Entity("hitcounter", myKey);
	        newCounter.setProperty("counter", "0");
	        newCounter.setProperty("date", new Date());
	        datastore.put(newCounter);
	        counterEntity = datastore.prepare(query).asSingleEntity();
	    }
	    	    
	    String c = counterEntity.getProperty("counter").toString();

	    int counter = Integer.parseInt(c);
	    counter++;
        Date date = new Date();
        
//        System.out.println("String.valueOf(counter):" + String.valueOf(counter)); 
        
//        Entity newCounter = new Entity("hitcounter", myKey);
        counterEntity.setProperty("counter", String.valueOf(counter));
        counterEntity.setProperty("date", date);
        
        datastore.put(counterEntity);

		try {
			request.setAttribute("counter", String.valueOf(counter));
			request.getRequestDispatcher("/hitcountertest.jsp").forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
