<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="navbar-bg"></div>
<nav class="navbar navbar-expand-lg main-navbar">
	<a href="${pageContext.request.contextPath}/"
		class="navbar-brand sidebar-gone-hide">OnlyFriends</a>
	<div class="nav-collapse">

		<ul class="navbar-nav">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
				role="button" data-bs-toggle="dropdown" aria-expanded="false">Fun</a>
				<ul class="dropdown-menu" aria-labelledby="navbarDropdown">

					<li><a class="dropdown-item" href="userparty.entry">會員活動</a></li>
					<li><a class="dropdown-item" href="#!">官方活動</a></li>

				</ul></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
				role="button" data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
				<ul class="dropdown-menu" aria-labelledby="navbarDropdown">


					<li><a class="dropdown-item" href="shopentrypage">招桃商城</a></li>
					<li><a class="dropdown-item" href="couponshop.controller">聯盟票券</a></li>
					<li><a class="dropdown-item" href="shop.controller">example</a></li>

				</ul></li>

			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
				role="button" data-bs-toggle="dropdown" aria-expanded="false">Blog</a>
				<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
					<li><a class="dropdown-item" href="blogofficial">幸福故事</a></li>
					<li><a class="dropdown-item" href="blogusers">戀人分享</a></li>
				</ul></li>


		</ul>
	</div>
	<form class="form-inline ml-auto"></form>
	<ul class="navbar-nav navbar-right">
		<li class="dropdown dropdown-list-toggle">
			<button class="btn" type="submit"
				data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight"
				aria-controls="offcanvasRight">
				<i class="fas fa-shopping-cart text-white cart"></i> <span
					class="badge bg-light text-dark ms-1 rounded-pill">0</span>
			</button>
			

			<div class="offcanvas offcanvas-end" tabindex="-1"
				id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
				<div class="offcanvas-header">
					<h5 id="offcanvasRightLabel">購物車</h5>
					<button type="button" class="btn-close text-reset"
						data-bs-dismiss="offcanvas" aria-label="Close"></button>
				</div>
				<div class="offcanvas-body">
					<div class="list-group">
					  <a href="#" class="list-group-item list-group-item-action active">
					    <div class="d-flex w-100 justify-content-between">
					      <h5 class="mb-1"> <input class="form-check-input me-1" type="checkbox" value="" aria-label="..."></h5>
					      <small>3 days ago</small>
					    </div>
					    <p class="mb-1">Some placeholder content in a paragraph.</p>
					    <small>And some small print.</small>
					  </a>
					  <a href="#" class="list-group-item list-group-item-action">
					    <div class="d-flex w-100 justify-content-between">
					      <h5 class="mb-1">List group item heading</h5>
					      <small class="text-muted">3 days ago</small>
					    </div>
					    <p class="mb-1">Some placeholder content in a paragraph.</p>
					    <small class="text-muted">And some muted small print.</small>
					  </a>
					  <a href="#" class="list-group-item list-group-item-action">
					    <div class="d-flex w-100 justify-content-between">
					      <h5 class="mb-1">List group item heading</h5>
					      <small class="text-muted">3 days ago</small>
					    </div>
					    <p class="mb-1">Some placeholder content in a paragraph.</p>
					    <small class="text-muted">And some muted small print.</small>
					  </a>
					</div>				
				</div>
			</div>
			
			
		</li>
		<li class="dropdown"><a href="login"
			class="nav-link nav-link-lg nav-link-user">
				<div class="d-sm-none d-lg-inline-block">Login</div>
		</a></li>
	</ul>
</nav>
