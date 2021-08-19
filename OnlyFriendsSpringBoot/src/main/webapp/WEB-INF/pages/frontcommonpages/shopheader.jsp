<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
		<c:when test="${not empty employee}">
			<%@include file="../commonpages/loginedheader.jsp"%>
		</c:when>
		<c:when test="${not empty member}">
			<%@include file="../membercommonpages/memberloginedheader.jsp"%>
		</c:when>
		<c:otherwise>
			<%@include file="../commonpages/header.jsp"%>
		</c:otherwise>
</c:choose>
