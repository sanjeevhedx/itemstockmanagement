package com.sanjeev.controller;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.sanjeev.data.UserDAOImpl;
import com.sanjeev.model.User;

/**
 * Servlet implementation class UserController
 */
@WebServlet("/UserController")
@MultipartConfig(
		fileSizeThreshold = 1024 * 10, // 10 KB
		maxFileSize = 1024 * 300, // 300 KB
		maxRequestSize = 1024 * 1024 // 1 MB
		)
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	UserDAOImpl userUtil = null;
	
	@Override
	public void init() throws ServletException {
		userUtil = new UserDAOImpl();
		super.init();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			String command = request.getParameter("command");
			
			switch(command) {
			
			case "ADD":
				addUser(request,response);
				break;
				
			case "USER":
				getUser(request,response);
				break;
				
			case "UPDATEPHOTO":
				updatePhoto(request,response);
				break;
				
			case "LOGOUT":
				logOut(request, response);
				break;
			
			}
			
			
		}
		catch(Exception e) {
			throw new ServletException(e);
		}
		
		
	}
	
private void updatePhoto(HttpServletRequest request, HttpServletResponse response)throws Exception {
	String userId = request.getParameter("userId");
	
	Part filePart = request.getPart("photo");
	
	InputStream inputStream = null;
	
	if(filePart != null) {
		inputStream = filePart.getInputStream();
	}
	
	userUtil.updatePhoto(userId,inputStream);
	
	User user = userUtil.getUser(userId);
	HttpSession session = request.getSession();
	session.setAttribute("user", user);
	
	
    response.sendRedirect(request.getContextPath() + "/ItemController");
		
	}

private void logOut(HttpServletRequest request, HttpServletResponse response)throws Exception {
		
		HttpSession session =request.getSession();
		session.invalidate();
		String message = "Log out successfully";
		RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
		request.setAttribute("msg",message);
		rd.forward(request,response);
		
	}

	private void getUser(HttpServletRequest request, HttpServletResponse response)throws Exception {
		
		String userId = request.getParameter("userId");
		String password = request.getParameter("password");
		
		String message = null;
		String resource = "login.jsp";
		
		try {
			
			User user = userUtil.getUser(userId);
			if(user.getPassword().equals(password)) {
				resource = "ItemController";
				HttpSession session = request.getSession();
				session.setAttribute("user", user);
				
			}
			else {
				message = "Wrong password try again";
			}
					
		} catch (Exception e) {
			message = e.getMessage();
		}
		request.setAttribute("msg", message);
		RequestDispatcher rd = request.getRequestDispatcher(resource);
		rd.forward(request, response);
		
	}

	private void addUser(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		String userId = request.getParameter("userId");
		String password = request.getParameter("password");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String address = request.getParameter("address");
		String city = request.getParameter("city");
			
		User user = new User();
		
		user.setUserId(userId);
		user.setPassword(password);
		user.setFirstName(firstName);
		user.setLastName(lastName);
		user.setAddress(address);
		user.setCity(city);
		
		Part filePart = request.getPart("photo");
		InputStream inputStream = null;
		if(filePart != null && filePart.getSize() > 0) {
			long size = filePart.getSize();
			byte[] imageBytes = new byte[(int) size];
			inputStream = filePart.getInputStream();
			inputStream.read(imageBytes);
			inputStream.close();
			
			user.setPhoto(imageBytes);
		}
		
		String message = null;
		String resource ="registration.jsp";
		
		
		
						
		try {
			userUtil.addUser(user);
			message="Registered Successfully: Please Login";
			resource = "login.jsp";
		}
		catch (Exception e) {
			message = e.getMessage();
		}
		request.setAttribute("msg", message);
		RequestDispatcher rd = request.getRequestDispatcher(resource);
		rd.forward(request, response);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
