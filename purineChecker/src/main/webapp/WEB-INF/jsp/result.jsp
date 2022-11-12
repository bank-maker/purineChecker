<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- プリン体摂取量の合計(total)を計算 --%>
<c:set var="total" value="${0}"></c:set>
<c:forEach var="food" items="${foods}">
	<c:set var="total" value="${total + food.purineContent}"></c:set>
</c:forEach>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>プリン体含有量チェッカー</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css">
<style>
p{
	margin-bottom: 15px;
}
</style>
</head>
<body>
<div id="all">
	<h1>★計算結果です</h1>
	<div id="result">
	<%-- 食品の数だけ結果(小数点第1位まで)を表示 --%>
	<c:forEach var="food" items="${foods}">
		<p>あなたが摂取した${food.name}のプリン体含有量は${String.format("%.1f", food.purineContent)}mgです。</p>
	</c:forEach>
		<p>プリン体摂取量合計は
	<%-- 摂取量合計が400mgを超えたら数字を赤字で表示 --%>
	<c:choose>
		<c:when test="${total > 400}">
			<span style="color:red;">
		</c:when>
		<c:otherwise>
			<span>
		</c:otherwise>
	</c:choose>
	<c:out value="${total}"></c:out></span>mgです。</p>
	</div>
	<a href="/purineChecker/PurineChecker">トップへ戻る</a>
</div>
</body>
</html>