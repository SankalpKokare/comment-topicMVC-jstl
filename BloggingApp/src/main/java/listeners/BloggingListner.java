package listeners;

import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

/**
 * Application Lifecycle Listener implementation class BloggingListner
 *
 */
@WebListener
public class BloggingListner implements ServletContextListener {


		Connection con ;
	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent sce)  { 
         // TODO Auto-generated method stub
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent sce)  { 
         // TODO Auto-generated method stub
    	try {
    		Class.forName("com.mysql.cj.jdbc.Driver");
    		String jdbcurl = "jdbc:mysql://localhost:3306/blogDB";
    		con = DriverManager.getConnection(jdbcurl,"root","root");
    		
    		sce.getServletContext().setAttribute("jdbccon", con);
    		
    	}catch(Exception e ) {
    		e.printStackTrace();
    	}
    }
	
}
