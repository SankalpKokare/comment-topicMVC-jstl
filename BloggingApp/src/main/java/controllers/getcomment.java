package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.DBComment;

/**
 * Servlet implementation class GetComment
 */
@WebServlet("/getcomment")
public class getcomment extends HttpServlet {
	
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
    public getcomment() {
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
		// TODO Auto-generated method stub
		
		PreparedStatement ps =null;
		ResultSet rs=null;
		PrintWriter out=response.getWriter();
		String id=request.getParameter("topicid");
		try {
			ps=con.prepareStatement("select * from comments where topicid=?");
			ps.setString(1, id);
			rs=ps.executeQuery();
			
			Set<DBComment> commentlist = new HashSet();
			
			while(rs.next()) {
				
				int topicid =rs.getInt(3);
				String des=rs.getString(2);
				String uid=rs.getString(3);
				int cid =rs.getInt(1);
				
				DBComment comObj = new DBComment(cid, des, topicid, uid);
				commentlist.add(comObj);
			}
			
			request.setAttribute("comments", commentlist);
			
			RequestDispatcher rd = request.getRequestDispatcher("/showcomments.jsp");
			rd.forward(request, response);

			
		}catch (Exception e) {
			
		e.printStackTrace();
		
	}
		
		
	}

}
