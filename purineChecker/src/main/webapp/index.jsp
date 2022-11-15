<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>プリン体含有量チェッカー</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css">
</head>
<body>
<div id="all">
	<h1>プリン体含有量チェッカー</h1>
	<p>★今日の夕食のプリン体含有量をチェックしましょう。</p>
	<form id="form1" action="/purineChecker/PurineChecker" method="post">
		<div id="item1" class="foods">
			食材 1：<span id="test">
			<select name="name" required>
			<c:forEach var="food" items="${foods}">
				<option value="${food.name}">${food.name}</option>
			</c:forEach>
			</select><br>
			摂取量(整数)：
			<input class="input" type="number" name="amount" min="0" value="200" required>(g)<br>
			</span>
		</div>
		<a id="add">食材の追加</a><br>
		<input type="submit" class="btn" value="計算">
		<input type="reset" class="btn" value="リセット">
	</form>
</div>
<script src="${pageContext.request.contextPath}/JavaScript/purineChecker.js"></script>
</body>
</html>