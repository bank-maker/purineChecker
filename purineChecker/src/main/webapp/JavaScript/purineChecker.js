//フォームに送信確認イベントを追加
document.getElementById('form1').addEventListener('submit', function(event){
	if(!check_submit()){
		//イベント伝搬の停止
		event.stopPropagation();
		//イベントキャンセル
		event.preventDefault();
	}
});
function check_submit(){
	//フォームの送信確認
	if (confirm('送信しますか？')){
		return true;
	}else{
		return false;
	}
}

//"リセット"ボタンにクリックイベントを追加
document.getElementById('form1').addEventListener('reset', function(event){
		if(!check_reset()){
			event.stopPropagation();
			event.preventDefault();
		}
});

function check_reset(){
	//フォームのリセット確認
	if (confirm('リセットしますか？')){
		return true;
	}else{
		return false;
	}
}

//"食材の追加"ボタンのクリックイベントを追加
document.getElementById('add').addEventListener('click', add);

//食材の数を1で初期化
let count = 1;

function add(){
	//countを1増やす
	count ++;
	
	//HTMLを準備
	let html = document.getElementById('test').innerHTML;
	html = '<div id="item' + count + '" class="foods">食材 ' + count + '：' + html; 
				
	//最後の食材の後ろにHTMLを挿入
	document.getElementById('item' + (count - 1)).insertAdjacentHTML('afterend', html);

	//食材が2個になったら"食材を減らす"ボタンの追加
	if(count == 2){
		html = '<a id="rem">食材を減らす</a>';
		document.getElementById('add').insertAdjacentHTML('afterend', html);
		
		//"食材を減らす"ボタンのクリックイベントを追加
		document.getElementById('rem').addEventListener('click', remove);
	}
}

function remove(){
	//最後にある食材の要素を削除して、countを1減らす
	document.getElementById('item' + count).remove();
	count--;
	
	//食材が1つだけになったら、"食材を減らす"ボタン削除
	if(count == 1){
		document.getElementById('rem').remove()
	}
}