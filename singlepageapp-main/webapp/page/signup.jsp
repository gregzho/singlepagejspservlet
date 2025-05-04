<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h4>SignUn Page</h4>
<form id="signup-form">
  <div class="mb-3">
    <label for="signup-email" class="form-label">Email address</label>
    <input type="email" class="form-control" id="signup-email" aria-describedby="emailHelp" required/>
    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
  </div>
  <div class="mb-3">
    <label for="signup-password" class="form-label">Password</label>
    <input type="password" class="form-control" id="signup-password" required/>
  </div>
  <div class="mb-3 form-check">
    <input type="checkbox" class="form-check-input" id="exampleCheck1">
    <label class="form-check-label" for="exampleCheck1">Remember me</label>
  </div>
  <button type="submit" class="btn btn-sm btn-primary">Sign Up</button>
  <p id="signup-error" style="color: red;"></p>
</form>