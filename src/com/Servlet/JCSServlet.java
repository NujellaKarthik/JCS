package com.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import com.bean.JioScoresCircle;
import com.dao.JioScoresCircleDao;
import com.google.gson.Gson;

/**
 * Servlet implementation class JCSServlet
 */
@WebServlet("/JCSServlet")
public class JCSServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private JioScoresCircleDao jioScoresCircleDao;

	@Resource(name = "jdbc/jcs")
	private DataSource dataSource;

	@Override
	public void init() throws ServletException {
		super.init();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * JioScoresCircleDao dao = new JioScoresCircleDao(dataSource);
		 * List<JioScoresCircle> circleListDetailsD = dao.orderByCircle(); String json =
		 * new Gson().toJson(circleListDetailsD);
		 * 
		 * response.setContentType("application/json");
		 * response.setCharacterEncoding("UTF-8"); response.getWriter().write(json);
		 */
		circleList(request, response);

		/*
		 * //read command parameter String theCommand = request.getParameter("command");
		 * 
		 * //find if command is present or missing if(theCommand == null) theCommand =
		 * "LIST";
		 * 
		 * //route to appropriate method switch (theCommand) {
		 * 
		 * case "ADD" : addCircle(request, response); break;
		 * 
		 * case "LIST" : listByCircle(request, response); break;
		 * 
		 * default: listByCircle(request, response); }
		 */

	}

	//this method sends the distinct circles in the database to the JSP page
	private void circleList(HttpServletRequest request, HttpServletResponse response) {
		try {
			// create our Dao /util ... and pass in the conn pool / datasource
			JioScoresCircleDao dao = new JioScoresCircleDao(dataSource);
			List<JioScoresCircle> circleListDetailsD = dao.orderByDistinctCircle();
			request.setAttribute("circleListDetailsD", circleListDetailsD);
			// send to JSP page (view)
			RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
			dispatcher.forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	//this method sends the list of all the values specific to that particular Circle in the database to the JSP page
	private void postCircleList(HttpServletRequest request, HttpServletResponse response) {
		try {
			System.out.println("print5 - entered dopost()-> postcirclelist() method");
			String postCircle = request.getParameter("myfield");
			
			/*response.setContentType("text/html");
	        PrintWriter pw=response.getWriter();
	        pw.write("<h2> Following data received sucessfully.. <h2> <br>");
	        pw.write("<h3> postCircle Name : "+ postCircle +" </h3>");*/
	        
			request.getAttribute("postCircle");
			System.out.println("\n" + "Circle name in doPost() -> postCircleList() method is : " + postCircle + "\n");
			
			// create our Dao /util ... and pass in the conn pool / datasource
			JioScoresCircleDao dao = new JioScoresCircleDao(dataSource);
			JioScoresCircle circleDetailsDPost = dao.orderByCircle(postCircle);

			request.setAttribute("circleDetailsDPost", circleDetailsDPost);
			
			System.out.println("\n"+"circlename before sending to jsp from db is :" +circleDetailsDPost.getCircle());
			System.out.println("\n"+"cityname before sending to jsp from db is :" +circleDetailsDPost.getCityName());
			System.out.println("\n"+"jiocenter before sending to jsp from db is :" +circleDetailsDPost.getJioCenter());
			System.out.println("\n"+"cluter before sending to jsp from db is :" +circleDetailsDPost.getCluster());	

			request.setAttribute("getCircle", circleDetailsDPost.getCircle());
			request.setAttribute("getCityName",circleDetailsDPost.getCityName());
			request.setAttribute("getCoveragePercent",circleDetailsDPost.getCoveragePercent());
			request.setAttribute("getCapacityPercent",circleDetailsDPost.getCapacityPercent());
			request.setAttribute("getQosPercent",circleDetailsDPost.getQosPercent());
			request.setAttribute("getJCSPercent",circleDetailsDPost.getJCSPercent());
			request.setAttribute("getES",circleDetailsDPost.getES());
			
			// send to JSP page (view)
			RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
			dispatcher.forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("print4 - entered dopost() method");

		postCircleList(request, response);
	}

	/*
	 * private void listByCircle(HttpServletRequest request, HttpServletResponse
	 * response) throws Exception {
	 * 
	 * // get circle from List<JioScoresCircle> circleListDetails =
	 * jioScoresCircleDao.findByCircle();
	 * 
	 * // add students to the request request.setAttribute("Circle_list_details",
	 * circleListDetails);
	 * 
	 * // send to JSP page (view) RequestDispatcher dispatcher =
	 * request.getRequestDispatcher("/view.jsp"); dispatcher.forward(request,
	 * response); }
	 */

	/*
	 * private void addCircle(HttpServletRequest request, HttpServletResponse
	 * response) throws Exception {
	 * 
	 * //read data from html form String Circle = request.getParameter("Circle");
	 * String CityName = request.getParameter("CityName"); String Cluster =
	 * request.getParameter("Cluster"); String JioCenter =
	 * request.getParameter("JioCenter"); Double CoveragePercent =
	 * Double.parseDouble(request.getParameter("CoveragePercent"));
	 * 
	 * //create new circle object
	 * 
	 * JioScoresCircle theCircle =new JioScoresCircle(Circle, CityName, Cluster,
	 * JioCenter, CoveragePercent);
	 * 
	 * //add circle to db
	 * 
	 * JioScoresCircleDao.addCircle(theCircle);
	 * 
	 * //send back to main page listByCircle(request, response);
	 * 
	 * }
	 */

}
