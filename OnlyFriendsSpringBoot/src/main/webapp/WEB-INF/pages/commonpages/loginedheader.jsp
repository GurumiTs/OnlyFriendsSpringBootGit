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
                  >活動專區</a
                >
                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                  <li><a class="dropdown-item fs-6" href="useractivity.entry">會員活動></li>
                  <li><a class="dropdown-item fs-6" href="#!">官方活動</a></li>
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
                  >招桃商城</a
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
                  >愛情討論版</a
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
            <li class="dropdown">
              <a
                href="#"
                data-toggle="dropdown"
                class="nav-link dropdown-toggle nav-link-lg nav-link-user"
              >               
                <div class="d-sm-none d-lg-inline-block">
                 ${personalinfo.empName}
                </div></a
              >
              <div class="dropdown-menu dropdown-menu-right">
                <a href="employeeprofile.controller" class="dropdown-item has-icon">
                  <i class="far fa-user"></i>個人主頁
                </a>
                <a
                  href="employee"
                  class="dropdown-item has-icon"
                >
                  <i class="fas fa-bolt"></i>後台管理
                </a>                
                <div class="dropdown-divider"></div>
                <a href="logout" class="dropdown-item has-icon text-danger">
                  <i class="fas fa-sign-out-alt"></i>登出
                </a>
              </div>
            </li>
          </ul>
        </nav>
