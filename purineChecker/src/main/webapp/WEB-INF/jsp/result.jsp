<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.Food" %>
<% Food food = (Food)request.getAttribute("food"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>プリン体含有量チェッカー</title>
<style>
p{
	margin-bottom: 15px;
}
</style>
</head>
<body>
<p>あなたが摂取した<%= food.getName() %>のプリン体含有量は<%= food.getPurineContent() %>mgです。</p>
<a href="/purineChecker/PurineChecker">トップへ戻る</a>
</body>
</html>