<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h4>SignIn Page</h4>
<form id="signin-form">
  <div class="mb-3">
    <label for="signin-email" class="form-label">Email address</label>
    <input type="email" class="form-control" id="signin-email" aria-describedby="emailHelp" required/>
    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
  </div>
  <div class="mb-3">
    <label for="signin-password" class="form-label">Password</label>
    <input type="password" class="form-control" id="signin-password" required/>
  </div>
  <div class="mb-3 form-check">
    <input type="checkbox" class="form-check-input" id="exampleCheck1">
    <label class="form-check-label" for="exampleCheck1">Remember me</label>
  </div>
  <button type="submit" class="btn btn-sm btn-primary">Sign In</button>
  <p id="signin-error" style="color: red;"></p>
</form>