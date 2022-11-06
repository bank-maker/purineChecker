<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.Food, java.util.List" %>
<%
//リクエストスコープからFoodのリストを取得
List<Food> foods = (List<Food>)request.getAttribute("foods");
//プリン体摂取合計を計算
double total = 0;
for(Food food : foods) {
	total += food.getPurineContent();
} 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>プリン体含有量チェッカー</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/main.css" type="text/css">
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
	<% for(int i = 0; i < foods.size(); i++){ %>
		<p>あなたが摂取した<%= foods.get(i).getName() %>のプリン体含有量は<%= foods.get(i).getPurineContent() %>mgです。</p>
	<% } %>
		<p>プリン体摂取量合計は<%= total %>mgです。</p>
	</div>
	<a id="btn" href="/purineChecker/PurineChecker">トップへ戻る</a>
</div>
</body>
</html>