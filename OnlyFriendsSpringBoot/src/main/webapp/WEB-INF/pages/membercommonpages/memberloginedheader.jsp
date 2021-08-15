<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />
<style>
.bg-linear {
	background: linear-gradient(270deg, #674e7e 0%, #354870 100%);
}
</style>
<header class="header sticky-top shadow-sm text-light">
	<nav class="navbar navbar-expand-lg py-3 navbar-dark bg-linear">
		<div class="container-fluid">
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo03"
				aria-controls="navbarTogglerDemo03" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<a class="navbar-brand ps-5" href="${pageContext.request.contextPath}/">OnlyFriends</a>
			<div class="collapse navbar-collapse justify-content-end"
				id="navbarTogglerDemo03">
				<ul class="navbar-nav">
					<li class="nav-item border-primary"><a class="nav-link"
						href="">會員活動</a></li>
					<li class="nav-item"><a class="nav-link" href="">官方活動</a></li>
					<li class="nav-item"><a class="nav-link" href="">招桃商城</a></li>

					<li class="nav-item"><a class="nav-link" href="">專屬優惠</a></li>

					<li class="nav-item"><a class="nav-link" href="">小城故事</a></li>

					<li class="nav-item"><a class="nav-link" href="member"><i
							class="far fa-user-circle"
							style="font-size: 2rem; color: rgb(255, 255, 255)"></i></a></li>
				</ul>
			</div>
		</div>
	</nav>
</header>
