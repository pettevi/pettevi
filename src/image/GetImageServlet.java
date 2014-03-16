/**
 * 
 */
package image;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.datastore.Blob;
import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Query.Filter;


public class GetImageServlet extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {
        String id = req.getParameter("id");
        
        DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
        Key key = KeyFactory.createKey("Animal", Long.parseLong(id));
        Filter f = new Query.FilterPredicate(Entity.KEY_RESERVED_PROPERTY, Query.FilterOperator.EQUAL, key );
        Query query = new Query("Animal").setFilter(f);
        PreparedQuery q = datastore.prepare(query);
        
        Entity entity = q.asSingleEntity();

        if (entity != null)
        {
        	Blob b = (Blob) entity.getProperty("Image");
            // Set the appropriate Content-Type header and write the raw bytes
            // to the response's output stream
            resp.setContentType("image/png");
            resp.getOutputStream().write(b.getBytes());
        } else {
            // If no image is found with the given title, redirect the user to
            // a static image
            resp.sendRedirect("/close.png");
        }
    }
}
