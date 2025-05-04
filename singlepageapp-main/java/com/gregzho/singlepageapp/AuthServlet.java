package com.gregzho.singlepageapp;

import java.io.IOException;

import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseAuthException;
import com.google.firebase.auth.FirebaseToken;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/auth/*")
public class AuthServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pathInfo = request.getPathInfo();
		String page = (pathInfo == null || pathInfo.equals("/")) ? "signin" : pathInfo.substring(1);
		String loadPage = null;
		boolean requireAuth = false;
		
		switch(page) {
		case "home":
			loadPage = "/page/home.jsp";
			break;
		case "about":
			loadPage = "/page/about.jsp";
			break;
		case "signin":
			loadPage = "/page/signin.jsp";
			break;
		case "signup":
			loadPage = "/page/signup.jsp";
			break;
		case "profile":
			loadPage = "/page/profile.jsp";
			requireAuth = true;
			break;
		default:
			response.sendError(HttpServletResponse.SC_NOT_FOUND, "Page Not Found");
			return;
				
		}
		
		FirebaseToken decodedToken = null;
		if (requireAuth) {
			String idToken = getBearerToken(request);
			
			if (idToken != null) {
				try {
					decodedToken = FirebaseAuth.getInstance().verifyIdToken(idToken);
					request.setAttribute("decodedToken", decodedToken);
				}
				catch (FirebaseAuthException e) {
					response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Invalid Firebase Authorization");
					return;
				}
			}
			else {
				response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Authorization requried. No idToken.");
			}
			
		}
		
		if (loadPage != null) {
			response.setContentType("text/html;charset=UTF-8");
			RequestDispatcher requestDispatcher = request.getRequestDispatcher(loadPage);
			requestDispatcher.forward(request, response);
		}
		
	}
	
	private String getBearerToken(HttpServletRequest request) {
		String authHeader = request.getHeader("Authorization");
		if (authHeader != null && authHeader.startsWith("Bearer ")) {
			return authHeader.substring(7); //Length of "Bearer "
		}
		
		return null;
	}

}
