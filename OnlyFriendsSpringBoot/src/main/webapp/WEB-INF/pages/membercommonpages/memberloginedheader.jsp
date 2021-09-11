<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="navbar-bg"></div>
<nav class="navbar navbar-expand-lg main-navbar">
  <a
    href="${pageContext.request.contextPath}/"
    class="navbar-brand sidebar-gone-hide"
    ><img src="${pageContext.request.contextPath}/images/login/flower.svg" alt="logo" width="45" class="shadow-light rounded-circle mx-3">OnlyFriends</a
  >
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
          <li>
            <a class="dropdown-item fs-6" href="useractivity.entry"><i class="fas fa-gamepad mx-2 text-primary"></i>會員活動</a>
          </li>
          <li><a class="dropdown-item fs-6" href="oauserpage.controller"><i class="fas fa-dice mx-2 text-primary"></i>官方活動</a></li>
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
          <li><a class="dropdown-item fs-6" href="shopentrypage"><i class="fas fa-store mx-2 text-primary"></i>招桃商城</a></li>
          <li>
            <a class="dropdown-item fs-6" href="couponshop.controller"><i class="fas fa-ticket-alt mx-2 text-primary"></i>聯盟票券</a>
          </li>
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
          <li><a class="dropdown-item fs-6" href="blogofficial"><i class="fas fa-book mx-2 text-primary"></i>幸福故事</a></li>
          <li><a class="dropdown-item fs-6" href="blogusers"><i class="fas fa-heart mx-2 text-primary"></i>戀人分享</a></li>
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
          
          
          
          
          <!-- Button trigger modal -->
				<button type="submit" id="addtocarticon" class="btn" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
				  <i class="fas fa-shopping-cart text-white"></i> <span
					class="badge bg-light text-dark ms-1 rounded-pill" id="cartcount">0</span>
				</button>
				
				<!-- Modal -->
				<div class="modal fade" id="staticBackdrop" data-bs-backdrop="false" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
				  <div class="modal-dialog" style="z-index:2041">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="staticBackdropLabel"><img src="${pageContext.request.contextPath}/images/smallicon/shopping-cart.png" style="weight:30px;height:30px" class="mx-2">購物車</h5>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <div class="modal-body">
				        <table class="table table-hover center table-sm" id="shoppingCartTable" >
						<thead>
						<tr>
							<th>刪除</th>
							<th class="d-none">√</th>
							<th>名稱</th>
							<th>單價</th>
							<th>數量</th>
							<th>小計</th>
						</tr>
						</thead>
						<tbody id="cartlistitem">
						</tbody>
						
						<tfoot>
							<tr>							
							<td class="fw-bold" colspan="4">總計</td>
							<td ><span id="finaltotal"></span></td>
							</tr>
						</tfoot>
						
					</table>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">關閉</button>
			        <a href="orderpage" type="button" class="btn btn-primary">結帳</a>
			      </div>
			    </div>
			  </div>
			</div>
          
			
		</li>
            

    <!-- official message -->
    <li class="dropdown dropdown-list-toggle" >
      <a
        href="#"
        data-toggle="dropdown"
        class="nav-link notification-toggle nav-link-lg beep"
        ><i class="far fa-bell" id="notificationicon"></i
      ></a>
      <div class="dropdown-menu dropdown-list dropdown-menu-right">
        <div class="dropdown-header">通知</div>
        <div
          class="dropdown-list-content dropdown-list-icons overflow-auto"
          id="notificationarea"
        ></div>
        <div class="dropdown-footer text-center">
          <a href="#" id="clearnotification"
            >清除全部<i class="fas fa-chevron-right"></i
          ></a>
        </div>
      </div>
    </li>
    <!-- official message -->

    <!-- invite message -->
    <li class="dropdown dropdown-list-toggle" >
      <a
        href="#"
        data-toggle="dropdown"
        class="nav-link notification-toggle nav-link-lg beep"
        ><i class="fas fa-user-plus" id="inviteicon"></i
      ></a>
      <div class="dropdown-menu dropdown-list dropdown-menu-right">
        <div class="dropdown-header">交友邀請</div>
        <div
          class="dropdown-list-content dropdown-list-icons overflow-auto"
          id="invitearea"
        ></div>
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
        <div class="d-sm-none d-lg-inline-block" id="headername">
          ${personalinfo.memberName}
        </div></a
      >
      <div class="dropdown-menu dropdown-menu-right">
        <a href="member" class="dropdown-item has-icon">
          <i class="far fa-user"></i> 個人主頁
        </a>

        <div class="dropdown-divider"></div>
    
    	 <c:if test="${not empty googlelogin}">
        <a  class="dropdown-item has-icon text-danger" onclick="signOut();">
          <i class="fas fa-sign-out-alt"></i> 登出
        </a>
        <script>
        function signOut() {  
		    logoutWindow = window.open("https://accounts.google.com/SignOutOptions", "_blank", "toolbar=no,width=600,height=400");
		    location.href="http://localhost:8080/OnlyFriends/logout"
		  }
        </script>
      	</c:if>
    
       <c:if test="${empty googlelogin}">
        <a href="logout" class="dropdown-item has-icon text-danger">
          <i class="fas fa-sign-out-alt"></i> 登出
        </a>
      	</c:if>
      	
      	
      </div>
    </li>
  </ul>
</nav>

<div aria-live="polite" aria-atomic="true" class="position-relative">
  <!-- Position it: -->
  <!-- - `.toast-container` for spacing between toasts -->
  <!-- - `.position-absolute`, `top-0` & `end-0` to position the toasts in the upper right corner -->
  <!-- - `.p-3` to prevent the toasts from sticking to the edge of the container  -->
  <div class="toast-container position-fixed bottom-0 end-0 p-3" style="z-index: 5" id="toastarea">

  
  </div>
</div>





