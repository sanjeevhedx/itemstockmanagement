package com.sanjeev.controller;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class AdminFilter
 */
@WebFilter("/*")
public class AdminFilter implements Filter {
	
	private static final String[] loginRequiredURLs = {
			"ItemController", "/add-item-form.jsp","/update-item-form.jsp"
	};
	
		

    /**
     * Default constructor. 
     */
    public AdminFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		
		
		
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpSession session = httpRequest.getSession(false);
		
		
		
		
		boolean loggedIn = session != null && session.getAttribute("user") != null;
		
				
		String requestURL = httpRequest.getRequestURL().toString();
		
		System.out.println(requestURL);
		
		
		if(!loggedIn && isLoginRequired(requestURL)) {
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
		}
		else {
			chain.doFilter(request, response);
		}
		
			
	}
	public boolean isLoginRequired(String requestURL) {
		
		for(String loginRequiredURL : loginRequiredURLs) {
			
			if(requestURL.contains(loginRequiredURL)) {
				return true;
			}
		}
		return false;
	}
	
	

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
