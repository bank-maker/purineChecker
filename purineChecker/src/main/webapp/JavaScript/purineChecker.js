//"リセット"ボタンにクリックイベントを追加
document.getElementById('rst').addEventListener('click', check, false);
function check(){
	//フォームの取り消し確認
	let result = confirm('取り消しますか？');
	if (result){
		document.getElementById('form1').reset();
		alert('取り消しました')
	}
}

//"食材の追加"ボタンのクリックイベントを追加
document.getElementById('add').addEventListener('click', add, false);

//食材の数を1で初期化
let count = 1;

function add(){
	//countを1増やす
	count ++;
	
	//HTMLを準備
/*	let html = '<div id="item' + count + '" class="foods">食材 ' + count + '　：' + 
				'<select class="input" name="name" required>' +
				//foodの数だけ食材名の選択肢を追加
				<% for(Food food : foods){ %>
					'<option value="<%= food.getName() %>"><%= food.getName() %></option>' +
				<% } %>
				'</select><br>' + 
				'摂取量(整数)：' + 
				'<input class="input" type="number" name="amount" min="0" value="200" required>(g)<br><br></div>';
*/				
	//最後の食材の後ろにHTMLを挿入
	document.getElementById('item' + (count - 1)).insertAdjacentHTML('afterend', html);

	//食材が2個になったら"食材を減らす"ボタンの追加
	if(count == 2){
		html = '<a id="rem">食材を減らす</a>';
		document.getElementById('add').insertAdjacentHTML('afterend', html);
		
		//"食材を減らす"ボタンのクリックイベントを追加
		document.getElementById('rem').addEventListener('click', remove, false);
	}
}

function remove(){
	//現時点で1番最後にある食材の要素を削除して、countを1減らす
	document.getElementById('item' + count).remove();
	count--;
	
	//食材が1つだけになったら、"食材を減らす"ボタン削除
	if(count == 1){
		document.getElementById('rem').remove()
	}
}