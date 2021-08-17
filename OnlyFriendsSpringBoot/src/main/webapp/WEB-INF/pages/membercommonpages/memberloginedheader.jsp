<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
   <header class="sticky-top shadow-sm">
      <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container px-4 px-lg-5">
          <a class="navbar-brand" href="${pageContext.request.contextPath}/"
            >OnlyFriends</a
          >
          <button
            class="navbar-toggler"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent"
            aria-expanded="false"
            aria-label="Toggle navigation"
          >
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
              <li class="nav-item">
                <a
                  class="nav-link active"
                  aria-current="page"
                  href="${pageContext.request.contextPath}/"
                  >Home</a
                >
              </li>
              <li class="nav-item"><a class="nav-link" href="#!">About</a></li>
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
                  <li><a class="dropdown-item" href="#!">會員活動</a></li>
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
                  <li><a class="dropdown-item" href="#!">招桃商城</a></li>
                  <li><a class="dropdown-item" href="#!">聯盟票券</a></li>
                  <li>
                    <a class="dropdown-item" href="shop.controller">example</a>
                  </li>
                </ul>
              </li>
              <li class="nav-item">
                <a class="nav-link" aria-current="page" href="#!">Blog</a>
              </li>
              <li class="nav-item">
                <a
                  class="nav-link"
                  aria-current="page"
                  href="memberswipeloading"
                  >Swipe</a
                >
              </li>
            </ul>
          </div>

          <form class="d-flex">
            <button class="btn" type="submit">
              <i class="bi-cart-fill text-white"></i>

              <span class="badge bg-light text-dark ms-1 rounded-pill">0</span>
            </button>
          </form>
          <div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
            <ul class="navbar-nav">
              <li class="nav-item dropdown">
                <a
                  class="nav-link dropdown-toggle"
                  href="#"
                  id="navbarDarkDropdownMenuLink"
                  role="button"
                  data-bs-toggle="dropdown"
                  aria-expanded="false"
                >
                ${personalinfo.memberName}
                </a>
                <ul
                  class="dropdown-menu dropdown-menu-dark"
                  aria-labelledby="navbarDarkDropdownMenuLink"
                >
                  <li><a class="dropdown-item" href="member">Profile</a></li>
                  <li><a class="dropdown-item" href="logout">Logout</a></li>
                </ul>
              </li>
            </ul>
          </div>
        </div>
      </nav>
    </header>
