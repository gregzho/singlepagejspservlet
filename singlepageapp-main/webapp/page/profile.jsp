<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.google.firebase.auth.FirebaseToken" %>
<%
FirebaseToken decodedToken = (FirebaseToken) request.getAttribute("decodedToken");
String userEmail = (decodedToken != null) ? decodedToken.getEmail() : "User Email Not Availalble";
String userUid = (decodedToken != null) ? decodedToken.getUid() : "User Uid Not Available";
%>
<h4>Profile Page</h4>
<p>Welcome! <span id="user-email"><%= userEmail %></span></p>
<p>User Uid: <span id="user-uid"><%= userUid %></span></p>