<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<thead>
			<td width="100px">編號</td>
			<td width="100px">名稱</td>
			<td width="100px">價格</td>
			<td width="100px">數量</td>
			<td width="100px">小計</td>
		</thead>
		<tbody>
			<tr th:each="entry:${session.shopcart }">
				<td th:text="${entry.key.proId }">1</td>
				<td th:text="${entry.key.proName }">2</td>
				<td th:text="${entry.key.proPrice }">3</td>
				<td th:text="${entry.key.value }">3</td>
				<td th:text="${entry.key.proPrice * entry.value }">4</td>
			</tr>
		</tbody>
	</table>
</body>
</html>