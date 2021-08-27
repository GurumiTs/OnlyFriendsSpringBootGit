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
			<tr>
				<td name="proId" value="${entry.key.proId }">1</td>
				<td name="proName" value="${entry.key.proName }">2</td>
				<td name="proPrice" value="${entry.key.proPrice }">3</td>
				<td name="" value="${entry.key.value }">3</td>
				<td name="amount" value="${entry.key.proPrice * entry.value }">4</td>
			</tr>
		</tbody>
	</table>
</body>
</html>