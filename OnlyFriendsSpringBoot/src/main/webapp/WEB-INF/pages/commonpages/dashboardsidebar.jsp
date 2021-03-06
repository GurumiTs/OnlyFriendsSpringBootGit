<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <!-- Sidebar -->
      <ul
        class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
        id="accordionSidebar"
      >
        <!-- Sidebar - Brand -->
        <a
          class="sidebar-brand d-flex align-items-center justify-content-center"
          href="${pageContext.request.contextPath}/"
        >
          <div class="sidebar-brand-icon rotate-n-15">
            <i class="fas fa-laugh-wink"></i>
          </div>
          <div class="sidebar-brand-text mx-3">OnlyFriends</div>
        </a>

        <!-- Divider -->
        <hr class="sidebar-divider my-0" />

        <!-- Nav Item - Dashboard -->
        <li class="nav-item active">
          <a class="nav-link" href="employee">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>後台管理</span></a
          >
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider" />

        <!-- Heading -->
        <div class="sidebar-heading">Interface</div>

        <!-- Nav Item - Pages Collapse Menu -->
        <li class="nav-item">
          <a
            class="nav-link collapsed"
            href="#"
            data-toggle="collapse"
            data-target="#collapseEmployee"
            aria-expanded="true"
            aria-controls="collapseEmployee"
          >
             <i class="fas fa-users-cog"></i>
            <span>使用者管理</span>
          </a>
          <div
            id="collapseEmployee"
            class="collapse"
            aria-labelledby="headingTwo"
            data-parent="#accordionSidebar"
          >
            <div class="bg-white py-2 collapse-inner rounded">
              <a class="collapse-item" href="employeemgmt.controller">員工管理</a>
              <a class="collapse-item" href="empmgmtmem">會員管理</a>
              <a class="collapse-item" href="customerservice.controller" target="_blank">線上客服</a>
            </div>
          </div>
        </li>
        
         <!-- Nav Item - Pages Collapse Menu -->
        <li class="nav-item">
          <a
            class="nav-link collapsed"
            href="#"
            data-toggle="collapse"
            data-target="#collapseOA"
            aria-expanded="true"
            aria-controls="collapseOA"
          >
            <i class="fas fa-gamepad"></i>
            <span>官方活動</span>
          </a>
          <div
            id="collapseOA"
            class="collapse"
            aria-labelledby="headingTwo"
            data-parent="#accordionSidebar"
          >
            <div class="bg-white py-2 collapse-inner rounded">
              <a class="collapse-item" href="empofficialactivemgmt.controller">活動管理</a>
            </div>
          </div>
        </li>
        
            <!-- Nav Item - Pages Collapse Menu -->
        <li class="nav-item">
          <a
            class="nav-link collapsed"
            href="#"
            data-toggle="collapse"
            data-target="#collapseMA"
            aria-expanded="true"
            aria-controls="collapseMA"
          >
            <i class="fas fa-gamepad"></i>
            <span>會員活動</span>
          </a>
          <div
            id="collapseMA"
            class="collapse"
            aria-labelledby="headingTwo"
            data-parent="#accordionSidebar"
          >
            <div class="bg-white py-2 collapse-inner rounded">
              <a class="collapse-item" href="emppActivity.Entry">活動管理</a>
            </div>
          </div>
        </li>
        
              <!-- Nav Item - Pages Collapse Menu -->
        <li class="nav-item">
          <a
            class="nav-link collapsed"
            href="#"
            data-toggle="collapse"
            data-target="#collapseBlog"
            aria-expanded="true"
            aria-controls="collapseBlog"
          >
             <i class="fab fa-blogger"></i>
            <span>討論版</span>
          </a>
          <div
            id="collapseBlog"
            class="collapse"
            aria-labelledby="headingTwo"
            data-parent="#accordionSidebar"
          >
            <div class="bg-white py-2 collapse-inner rounded">
              <a class="collapse-item" href="empblogmgmt.controller">文章管理</a>
            </div>
          </div>
        </li>
        
                <!-- Nav Item - Pages Collapse Menu -->
        <li class="nav-item">
          <a
            class="nav-link collapsed"
            href="#"
            data-toggle="collapse"
            data-target="#collapseProduct"
            aria-expanded="true"
            aria-controls="collapseProduct"
          >
            <i class="fas fa-store"></i>
            <span>商城</span>
          </a>
          <div
            id="collapseProduct"
            class="collapse"
            aria-labelledby="headingTwo"
            data-parent="#accordionSidebar"
          >
            <div class="bg-white py-2 collapse-inner rounded">
              <a class="collapse-item" href="empproductPage.controller">商品管理</a>
              <a class="collapse-item" href="emporderPage.controller">訂單管理</a>
            </div>
          </div>
        </li>
        
              <!-- Nav Item - Pages Collapse Menu -->
        <li class="nav-item">
          <a
            class="nav-link collapsed"
            href="#"
            data-toggle="collapse"
            data-target="#collapseCoupon"
            aria-expanded="true"
            aria-controls="collapseCoupon"
          >
            <i class="far fa-thumbs-up"></i>
            <span>優惠券</span>
          </a>
          <div
            id="collapseCoupon"
            class="collapse"
            aria-labelledby="headingTwo"
            data-parent="#accordionSidebar"
          >
            <div class="bg-white py-2 collapse-inner rounded">
              <a class="collapse-item" href="empCoupons.controller">優惠券管理</a>
              <a class="collapse-item" href="couponAnalyzeEntry.controller">優惠券分析</a>
              <a class="collapse-item" href="Advertisement.controller">廣告牆</a>
            </div>
          </div>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider" />

        <!-- Heading -->
        <div class="sidebar-heading"></div>

        <!-- Nav Item - Pages Collapse Menu -->
        

        
      

        <!-- Sidebar Toggler (Sidebar) -->
        <div class="text-center d-none d-md-inline">
          <button class="rounded-circle border-0" id="sidebarToggle"></button>
        </div>

      </ul>
      <!-- End of Sidebar -->