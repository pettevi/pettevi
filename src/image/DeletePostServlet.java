package image;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;

public class DeletePostServlet extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException 
    {
    	String id = request.getParameter("id");
    	DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
        Key key = KeyFactory.createKey("Animal", Long.parseLong(id));

    	datastore.delete(key);

		try {
	    	// respond to query
			RequestDispatcher disp;
			disp = getServletContext().getRequestDispatcher("/image.jsp");
			if (disp != null)
					disp.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		}
	
    }
}
