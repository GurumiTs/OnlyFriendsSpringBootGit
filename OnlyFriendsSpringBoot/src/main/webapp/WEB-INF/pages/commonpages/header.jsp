<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<div class="navbar-bg"></div>
         <nav class="navbar navbar-expand-lg main-navbar">
          <a href="${pageContext.request.contextPath}/" class="navbar-brand sidebar-gone-hide">OnlyFriends</a>          
          <div class="nav-collapse">
           
            <ul class="navbar-nav">
             <li class="nav-item dropdown">
                <a
                  class="nav-link dropdown-toggle"
                  id="navbarDropdown"
                  href="#"
                  role="button"
                  data-bs-toggle="dropdown"
                  aria-expanded="false"
                  >Fun</a
                >
                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">

                  <li><a class="dropdown-item" href="userparty.entry">會員活動</a></li>
                  <li><a class="dropdown-item" href="#!">官方活動</a></li>

                </ul>
              </li>
              <li class="nav-item dropdown">
                <a
                  class="nav-link dropdown-toggle"
                  id="navbarDropdown"
                  href="#"
                  role="button"
                  data-bs-toggle="dropdown"
                  aria-expanded="false"
                  >Shop</a
                >
                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">


                  <li><a class="dropdown-item" href="shopentrypage">招桃商城</a></li>
                  <li><a class="dropdown-item" href="couponshop.controller">聯盟票券</a></li>
                  <li><a class="dropdown-item" href="shop.controller">example</a></li>

                </ul>
              </li>
              
             <li class="nav-item dropdown">
                <a
                  class="nav-link dropdown-toggle"
                  id="navbarDropdown"
                  href="#"
                  role="button"
                  data-bs-toggle="dropdown"
                  aria-expanded="false"
                  >Blog</a
                >
                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                  <li><a class="dropdown-item" href="blogofficial">幸福故事</a></li>
                  <li><a class="dropdown-item" href="blogusers">戀人分享</a></li>
                </ul>
              </li>
              
                   
            </ul>
          </div>
          <form class="form-inline ml-auto"></form>
          <ul class="navbar-nav navbar-right">
            <li class="dropdown dropdown-list-toggle">
              <button class="btn" type="submit">
                <i class="fas fa-shopping-cart text-white " ></i>
                <span class="badge bg-light text-dark ms-1 rounded-pill"
                  >0</span
                >
              </button>
            </li>
            <li class="dropdown">
              <a href="login" class="nav-link nav-link-lg nav-link-user">
                <div class="d-sm-none d-lg-inline-block">Login</div></a
              >
            </li>
          </ul>
        </nav>
