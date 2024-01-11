package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashSet;
import java.util.List;
import java.util.Set;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Topic;


/**
 * Servlet implementation class viewTopics
 */
@WebServlet("/viewTopics")
public class getTopics extends HttpServlet {
	

	Connection con ;
@Override
public void init(ServletConfig config) throws ServletException {
	// TODO Auto-generated method stub
	super.init(config);
	con=(Connection)config.getServletContext().getAttribute("jdbccon");
}

	
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getTopics() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		PreparedStatement ps =null;
		ResultSet rs=null;
		PrintWriter out=response.getWriter();
		
		try {
			ps=con.prepareStatement("select * from topic");
			rs=ps.executeQuery();
			

			Set<Topic>topicList=new HashSet();
			
			while(rs.next()) {
					
				int tid=rs.getInt(1);
				String nm = rs.getString(2);
				String ds=rs.getString(3);
				String uid=rs.getString(4);
				
				Topic tp =new Topic(tid, nm, ds, uid);
				topicList.add(tp);
			}
			
			
			request.setAttribute("topics", topicList);

			
		}catch (Exception e) {
				
			e.printStackTrace();
			
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("/showTopics.jsp");
		rd.forward(request, response);
		

		
	}

	

}
