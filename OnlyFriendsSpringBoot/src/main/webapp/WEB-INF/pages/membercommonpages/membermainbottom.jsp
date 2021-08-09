<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script>
      window.addEventListener("DOMContentLoaded", (event) => {
        // Toggle the side navigation
        const sidebarToggle = document.body.querySelector("#sidebarToggle");
        if (sidebarToggle) {
          // Uncomment Below to persist sidebar toggle between refreshes
          // if (localStorage.getItem('sb|sidebar-toggle') === 'true') {
          //     document.body.classList.toggle('sb-sidenav-toggled');
          // }
          sidebarToggle.addEventListener("click", (event) => {
            event.preventDefault();
            document.body.classList.toggle("sb-sidenav-toggled");
            localStorage.setItem(
              "sb|sidebar-toggle",
              document.body.classList.contains("sb-sidenav-toggled")
            );
          });
        }
      });
    </script>