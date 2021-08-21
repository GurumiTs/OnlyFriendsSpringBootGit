<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/emailverifysuccess.css" />
    <title>Document</title>
  </head>
  <body>
    <h1>Verify Failed!</h1>
    <div class="container">
      <button class="hello"><a href="../SignUpMailServlet.do">Resend</a></button>
      <div class="shine"></div>
    </div>
  </body>
</html>
