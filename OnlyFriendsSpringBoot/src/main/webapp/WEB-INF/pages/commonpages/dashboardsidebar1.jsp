<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav id="sidebar" class="sidebar-wrapper">
  <div class="sidebar-content">
    <div class="sidebar-brand">
      <a href="#">pro sidebar</a>
      <div id="close-sidebar">
        <i class="fas fa-times"></i>
      </div>
    </div>
    <div class="sidebar-header">
      <div class="user-pic">
        <img
          class="img-responsive img-rounded"
          src="${user.empPic}"
          alt="User picture"
        />
      </div>
      <div class="user-info">
          <strong>${user.empName}</strong>
        <span class="user-role">${employeetype[0]}</span>
        <span class="user-status">
          <i class="fa fa-circle"></i>
          <span>Online</span>
        </span>
      </div>
    </div>
    <!-- sidebar-header  -->
    <div class="sidebar-search">
      <div>
        <div class="input-group">
          <input
            type="text"
            class="form-control search-menu"
            placeholder="Search..."
          />
          <div class="input-group-append">
            <span class="input-group-text">
              <i class="fa fa-search" aria-hidden="true"></i>
            </span>
          </div>
        </div>
      </div>
    </div>
    <!-- sidebar-search  -->
    <div class="sidebar-menu">
      <ul>
        <li class="header-menu">
          <span>General</span>
        </li>
        <li class="sidebar-dropdown">
          <a href="#">
            <i class="fas fa-users-cog"></i>
            <span>Employee</span>
          </a>
          <div class="sidebar-submenu">
            <ul>
            <li>
                <a href="employee"
                  >Employee DashBoard         
                </a>
              </li>
              <li>
                <a href="employeemgmt.controller"
                  >Employee Mgmt.          
                </a>
              </li>
              <li>
                <a href="myteam.controller">My Team</a>
              </li>
              <li>
                <a href="signupemp">Signup Employee</a>
              </li>
            </ul>
          </div>
        </li>
        <li class="sidebar-dropdown">
          <a href="#">
            <i class="fas fa-gamepad"></i>
            <span>Official Active</span>
          
          </a>
          <div class="sidebar-submenu">
            <ul>
            
              <li>
                <a href="officialactivemgmt.controller">Official Active</a>
              </li>            
            </ul>
          </div>
        </li>
        <li class="sidebar-dropdown">
          <a href="#">
          <i class="fas fa-gamepad"></i>
            <span>Member Active</span>
          </a>
          <div class="sidebar-submenu">
            <ul>
              <li>
                <a href="#">General</a>
              </li>
              <li>
                <a href="#">Panels</a>
              </li>
              <li>
                <a href="#">Tables</a>
              </li>
              <li>
                <a href="#">Icons</a>
              </li>
              <li>
                <a href="#">Forms</a>
              </li>
            </ul>
          </div>
        </li>
        <li class="sidebar-dropdown">
          <a href="#">
            <i class="fab fa-blogger"></i>
            <span>Blog</span>
          </a>
          <div class="sidebar-submenu">
            <ul>
              <li>
                <a href="blogmgmt.controller">Blogmgmt</a>
              </li>
            </ul>
          </div>
        </li>
        <li class="sidebar-dropdown">
          <a href="#">
            <i class="fas fa-store"></i>
            <span>Product</span>
          </a>
          <div class="sidebar-submenu">
            <ul>
              <li>
                <a href="productPage.controller">Products</a>
              </li>
<!--               <li> -->
<!--                 <a href="#">Orders</a> -->
<!--               </li> -->
            </ul>
          </div>
        </li>
        <li class="sidebar-dropdown">
          <a href="#">
            <i class="far fa-thumbs-up"></i>
            <span>Coupon</span>
          </a>
          <div class="sidebar-submenu">
            <ul>
              <li>
                <a href="Coupons.controller">CouponMgmt</a>
              </li>
            </ul>
          </div>
        </li>
        <li class="header-menu">
          <span>Extra</span>
        </li>
        <li>
          <a href="#">
            <i class="fa fa-book"></i>
            <span>Documentation</span>
            <span class="badge badge-pill badge-primary">Beta</span>
          </a>
        </li>
        <li>
          <a href="#">
            <i class="fa fa-calendar"></i>
            <span>Calendar</span>
          </a>
        </li>
        <li>
          <a href="#">
            <i class="fa fa-folder"></i>
            <span>Examples</span>
          </a>
        </li>
      </ul>
    </div>
    <!-- sidebar-menu  -->
  </div>
  <!-- sidebar-content  -->
  <div class="sidebar-footer">
    <a href="#">
      <i class="fa fa-bell"></i>
      <span class="badge badge-pill badge-warning notification">3</span>
    </a>
    <a href="#">
      <i class="fa fa-envelope"></i>
      <span class="badge badge-pill badge-success notification">7</span>
    </a>
    <a href="#">
      <i class="fa fa-cog"></i>
      <span class="badge-sonar"></span>
    </a>
    <a href="#">
      <i class="fa fa-power-off"></i>
    </a>
  </div>
</nav>

    