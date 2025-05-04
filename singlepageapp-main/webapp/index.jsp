<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" data-bs-theme="dark">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="vite.png" type="image/x-icon" rel="icon">
<title>SinglePage App</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<nav class="navbar bg-body-tertiary fixed-top">
  <div class="container-fluid">
    <a class="navbar-brand" href="#home">SinglePage App</a>
    <form class="d-flex mt-3" role="search">
      <input id="search" class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success" type="submit">Search</button>
    </form>
    <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
      <div class="offcanvas-header">
        <h5 class="offcanvas-title" id="offcanvasNavbarLabel">SinglePage Menu</h5>
        <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
      </div>
      <div class="offcanvas-body">
        <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
          <li class="nav-item">
            <a class="nav-link" href="#home" id="home-link"><i class="fa-solid fa-house"></i> Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#about" id="about-link"><i class="fa-solid fa-circle-info"></i> About</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#signin" id="signin-link"><i class="fa-solid fa-right-to-bracket"></i> Sign In</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#signup" id="signup-link"><i class="fa-solid fa-user-plus"></i> Sign Up</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#profile" id="profile-link" style="display: none;"><i class="fa-solid fa-user"></i> Profile</a>
          </li>
          <li class="nav-item">
            <button class="btn btn-sm btn-secondary" type="button" id="signout-link" style="display: none;"><i class="fa-solid fa-right-from-bracket"></i> Sign Out</button>
          </li>
        </ul>
      </div>
    </div>
  </div>
</nav>
<div id="app-container" class="container-fluid" style="margin: 80px 0 0 0">
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js" integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq" crossorigin="anonymous"></script>
<script defer type="module" src="/js/auth.js"></script>
</body>
</html>