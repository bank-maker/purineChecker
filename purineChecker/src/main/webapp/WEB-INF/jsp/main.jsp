<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			食品　　：<select class="input" name="name" style="vertical-align:left" required>
							<option value="鶏肉">鶏肉</option>
							<option value="豚肉">豚肉</option>
							<option value="牛肉">牛肉</option>
						</select><br>
			摂取量(整数)：<input class="input" type="number" name="amount" min="0" value="200" required>(g)<br>
			プリン体含有量：<input class="input" type="number" step="0.1" min="0" name="contain" value="5.7" required>(mg)<br>
		</div>
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
</script>
</body>
</html>