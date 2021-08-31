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
                  <li><a class="dropdown-item fs-6" href="useractivity.entry">會員活動</a></li>
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
              
              <li class="nav-item">
                <a href="memberswipe" class="nav-link">邱比房間</a>
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
          
         
            
         <!-- official message -->   
         <li class="dropdown dropdown-list-toggle" id="notificationicon">
              <a
                href="#"
                data-toggle="dropdown"
                class="nav-link notification-toggle nav-link-lg beep"
                ><i class="far fa-bell"></i
              ></a>
              <div class="dropdown-menu dropdown-list dropdown-menu-right">
                <div class="dropdown-header">通知</div>
                <div class="dropdown-list-content dropdown-list-icons overflow-auto" id="notificationarea"></div>
                <div class="dropdown-footer text-center">
                  <a href="#" id="clearnotification">清除全部<i class="fas fa-chevron-right"></i></a>
                </div>
              </div>
            </li>        
           <!-- official message -->
           
           <!-- invite message -->
             <li class="dropdown dropdown-list-toggle" id="inviteicon">
              <a
                href="#"
                data-toggle="dropdown"
                class="nav-link notification-toggle nav-link-lg beep"
                ><i class="fas fa-user-plus"></i
              ></a>
              <div class="dropdown-menu dropdown-list dropdown-menu-right">
                <div class="dropdown-header">交友邀請</div>
                <div class="dropdown-list-content dropdown-list-icons overflow-auto" id="invitearea"></div>
                <div class="dropdown-footer text-center">
                  <a href="#">瀏覽全部 <i class="fas fa-chevron-right"></i></a>
                </div>
              </div>
            </li>
           <!-- invite message -->
           
           
           

            <li class="dropdown">
              <a
                href="#"
                data-toggle="dropdown"
                class="nav-link dropdown-toggle nav-link-lg nav-link-user"
              >               
                <div class="d-sm-none d-lg-inline-block">
                 ${personalinfo.memberName}
                </div></a
              >
              <div class="dropdown-menu dropdown-menu-right">
                <a href="member" class="dropdown-item has-icon">
                  <i class="far fa-user"></i> 個人主頁
                </a>
                               
                <div class="dropdown-divider"></div>
                <a href="logout" class="dropdown-item has-icon text-danger">
                  <i class="fas fa-sign-out-alt"></i> 登出
                </a>
              </div>
            </li>
            
          </ul>
        </nav>
