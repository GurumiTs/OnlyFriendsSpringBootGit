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
                  <li><a class="dropdown-item fs-6" href="useractivity.entry">Member Act.</a></li>
                  <li><a class="dropdown-item fs-6" href="#!">Official Act.</a></li>
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
			<button class="btn" type="submit" id="addtocarticon"
				data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight"
				aria-controls="offcanvasRight">
				<i class="fas fa-shopping-cart text-white cart"></i> <span
					class="badge bg-light text-dark ms-1 rounded-pill numberCart" id="cartcount">0</span>
			</button>
			

			<div class="offcanvas offcanvas-end" tabindex="-1"
				id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
				<div class="offcanvas-header">
					<h5 id="offcanvasRightLabel">購物車</h5>
					<button type="button" class="btn-close text-reset"
						data-bs-dismiss="offcanvas" aria-label="Close"></button>
				</div>
				<div class="offcanvas-body" id="cartlist">
					<table class="table table-hover center" id="shoppingCartTable">
						<thead>
						<tr>
							<th>是否購買</th>
							<th>名稱</th>
							<th>單價</th>
							<th>數量</th>
							<th>小計</th>
						</tr>
						</thead>
						<tbody id="cartlistitem">
						</tbody>
						
					</table>			
				</div>
			</div>
			
			
		</li>
		<li class="dropdown"><a href="login"
			class="nav-link nav-link-lg nav-link-user">
				<div class="d-sm-none d-lg-inline-block">Login</div>
		</a></li>
	</ul>
</nav>



