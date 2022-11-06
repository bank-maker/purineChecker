<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.Food, java.util.List" %>
<% List<Food> foods = (List<Food>)request.getAttribute("foods"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>プリン体含有量チェッカー</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/main.css" type="text/css">
</head>
<body>
<div id="all">
	<h1>プリン体含有量チェッカー</h1>
	<p>★今日の夕食のプリン体含有量をチェックしましょう。</p>
	<form id="form1" action="/purineChecker/PurineChecker" method="post">
		<div id="item">
			食品1　　：
			<select class="input" name="name" style="vertical-align:left" required>
			<% for(Food food : foods){ %>
				<option value="<%= food.getName() %>"><%= food.getName() %></option>
			<% } %>
			</select><br>
			摂取量(整数)：
			<input class="input" type="number" name="amount0" min="0" value="200" required>(g)<br>
			<br>
		</div>
		<a id="add">食品の追加</a>
		<div id="btn">
			<input type="submit" value="計算">
			<button id="rst">リセット</button>
		</div>
	</form>
</div>
<script>
document.getElementById('rst').addEventListener('click', check, false);
function check(){
	let result = confirm('取り消しますか？');
	if (result){
		document.getElementById('form1').reset();
		alert('取り消しました')
	}
}
document.getElementById('add').addEventListener('click', insert, false);
let count = 1;
function insert(){
	count ++;
	let html = '食品' + count + '　　：	' + 
				'<select class="input" name="name" style="vertical-align:left" required>' + 
				<% for(Food food : foods){ %>
					'<option value="<%= food.getName() %>"><%= food.getName() %></option>' +
				<% } %>
				'</select><br>' + 
				'摂取量(整数)：' + 
				'<input class="input" type="number" name="amount' + (count - 1) + '" min="0" value="200" required>(g)<br><br>';
	document.getElementById('item').insertAdjacentHTML('beforeend', html);
	
}
</script>
</body>
</html>