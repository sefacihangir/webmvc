/**
 * カスタムJS
 */
$(document).ready(
function() {
	$('#getimage').click(
			function() {
				var img = getImageElement();
				img.attr({'src':'image'});
			}
	);
	$('#removeimage').click(
			function() {
				var img = getImageElement();
				img.remove();
			}
	);

	$('#result-clear').click(
			function() {
				$('#result').text("");
			}
	);
	
	$('#myForm').submit(
			function() {
				// 入力チェック（クライアント編）
				if($('#myForm').valid()) {
					// 送りつけるJSONデータ
					var postData = {
							email: $('input[name="emailInput"]').val(),
							userId: $('input[name="userIdInput"]').val(),
							password: $('input[name="passwordInput"]').val()
					};
					$.ajax({
						type: 'POST',
						url: 'postJson',
						data: JSON.stringify(postData),
						contentType: 'application/json',
						dataType:'json',
						success: function(response) {
							// 期待値として{name="人の名前"}が帰ってくること。
							var resJsonStr = JSON.stringify(response);
							console.log(resJsonStr);
							var resJson = JSON.parse(resJsonStr);
							if (!resJson['status']) {
								$("#result").text('認証できんかった。ユーザIDにadmin、パスワードにadminpass入れてみて。(Eメールアドレスは適当でいいや)');
								return;
							}
							$("#result").text('ようこそ' + resJson['name'] + 'さん。');
						},
						error: function(response) {
							$('#result').text('サーバエラー');
						}
					});
				}
				return false;
			}
	);
	$('#myForm').validate({
		debug: true,
		highlight : function (element) {
			$(element).closest('.form-validate').removeClass('alert').removeClass('alert-success').addClass('alert').addClass('alert-warning');
		},
		success: function(element) {
			$(element).closest('.form-validate').removeClass('alert').removeClass('alert-warning').addClass('alert').addClass('alert-success');
		},
		rules:{
			emailInput:{
				required: true
			},
			userIdInput:{
				required: true
			},
			passwordInput:{
				required: true
			}
		},
		messages:{
			emailInput: "Eメールアドレスが入力されてない",
			userIdInput: "ユーザIDが入力されてない",
			passwordInput: "パスワードが入力されてない"
		}
	});
}
);
function getImageElement() {
	var img;
	if ($('#imgtarget').get(0)) {
		// 要素あり
		console.debug('要素あり');
		img = $('#imgtarget');
		return img;
	}
	// 要素無し
	console.debug('要素なし');
	img = $('#image').append('<img id="imgtarget"></img>').children();
	console.debug(img);
	return img;
}