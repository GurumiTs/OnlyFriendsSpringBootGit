<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<sql:setDataSource
			driver="com.microsoft.sqlserver.jdbc.SQLServerDriver"
			url="jdbc:sqlserver://localhost:1433;databaseName=OnlyFriends;user=sa;password=hollan123?serverTimezone=Asia/Taipei"
			user="sa"
			password="hollan123"
		/>
<!doctype html>
<html lang="en">
  <head>
    <title>ProductPage</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		
<link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0"
      crossorigin="anonymous"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />
    <!-- datatables style -->
    <link
      rel="stylesheet"
      href="https://cdn.datatables.net/1.10.25/css/dataTables.bootstrap5.min.css"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.1/css/bootstrap.min.css"
    />
     <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
   <style>
   		#doublename{
   			padding:10px;
   		
   		}
   		#correctname{
   			padding:10px;
   		
   		}
   </style>
    </head>
    <body>
<sql:query var="rs">
	Select Name from Product where Name=?
	<sql:param>${param.Name }</sql:param>
</sql:query>

<c:choose>
	<c:when test="${rs.rowCount > 0 }"><img id="doublename" src='images/smallicon/error.png'> 資料重複</c:when>
	<c:otherwise><span><img id="correctname" src='images/smallicon/check.png'> </span> </c:otherwise>
</c:choose>
<!--<c:if test="${rs.rowCount > 0 }"><i class="fad fa-exclamation-circle" id="doublename"></i>資料重複</c:if>-->

<script
       src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8"
      crossorigin="anonymous"
    ></script>
    <!-- fontawesome javascript  -->
    <script
      src="https://kit.fontawesome.com/1a950be563.js"
      crossorigin="anonymous"
    ></script>
    <!-- tw zipcode   -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery-twzipcode@1.7.14/jquery.twzipcode.min.js"></script>

    <!--datatable js -->
    <script src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.25/js/dataTables.bootstrap5.min.js"></script>
  <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
 </body>
 </html>