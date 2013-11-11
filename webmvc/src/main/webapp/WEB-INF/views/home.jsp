<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="ja">
<head>
	<title>Spring MVC + Twitter bootstrap3を使ったサンプルいろいろ</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="resources/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
	<nav class="navbar navbar-inverse" role="navigation">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<a class="navbar-brand" href="top">ここにタイトルとかメニューとかを置く</a>
		</div>
	</nav>

	<div class="container">
		<!-- タブ表示 -->
		<ul class="nav nav-tabs" id="myTab">
			<li class="active"><a href="#basictab" data-toggle="tab">基本</a></li>
			<li><a href="#jsontab" data-toggle="tab">みんな大好きAjax</a></li>
			<li><a href="#etctab" data-toggle="tab">その他</a></li>
		</ul>
		<div class="tab-content">
			<div class="tab-pane active" id="basictab">
				<div class="jumbotron">
					<h1>Spring MVCサンプル</h1>
					<p>The time on the server is ${serverTime}.</p>
					<p>
						<a id="getimage" class="btn btn-primary btn-lg" role="button">画像取得</a>
						<a id="removeimage"  class="btn btn-primary btn-lg" role="button">画像削除</a>
						<!-- data-backdrop="static"のときは背景を押してもモーダルが外れない。 -->
						<a class="btn btn-primary btn-lg" data-toggle="modal" href="#myModal" data-backdrop="static">モーダル表示</a>
					</p>
				</div><!-- jumbotron -->
				<div id="image"></div>
				<div id="tweet">デザインがtwitterと似たかよったかになる。</div>
				<!-- モーダル表示用 -->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog"  data-backdrop="false">
						<div class="modal-content">
							<div class="modal-header">
								<a href="#" class="close" data-dismiss="modal">&times;</a>
								<h3 class="modal-title" id="myModalLabel">モーダル表示</h3>
							</div>
							<div class="modal-body">
								バージョンによってモーダルの書き方結構変わってませんかねこれ。
							</div>
							<div class="modal-footer">
								<a href="#" class="btn" data-dismiss="modal">知るか</a>
							</div>
						</div><!-- modal-content -->
					</div><!-- modal-dialog -->
				</div><!-- myModal -->
			</div><!-- basic -->
			<div class="tab-pane" id="jsontab">
				<div class="panel panel-default">
					<div class="panel-heading">JSONで送りつけるフォームサンプル</div>
					<div class="panel-body">
						<form role="form" id="myForm">
							<div class="form-group">
								<label for="emailInput">Eメールアドレス入れてちょうだい。</label>
								<div class="form-validate">
									<input type="email" class="form-control" name="emailInput" placeholder="nanashi@nogonbe.jp">
								</div>
							</div>
							<div class="form-group">
								<label for="userIdInput">ユーザIDを入れてちょうだい。</label>
								<div class="form-validate">
									<input type="text" class="form-control" name="userIdInput" placeholder="ユーザIDよ。カッコいいやつよ。">
								</div>
							</div>
							<div class="form-group">
								<label for="passwordInput">秘密のパスワードよ。</label>
								<div class="form-validate">
									<input type="password" class="form-control" name="passwordInput" placeholder="まんまpasswordとかはやめれ">
								</div>
							</div>
							<button type="submit" class="btn btn-primary">送るぜ！</button>
							<button id="result-clear" type="button" class="btn btn-default">結果クリア</button>
							<div id="result"></div>
						</form>
					</div><!-- panel-body -->
				</div><!-- panel-default -->
			</div><!-- jsontab -->
			<div class="tab-pane" id="etctab">あとでやる。</div>
		</div><!-- tab-content -->
	</div><!-- container -->
	<!-- jsはbodyの最後に置く。スクリプトのロードがレンダリングの邪魔しちゃ行けないってばっちゃが言ってた。 -->
	<script src="https://code.jquery.com/jquery.js"></script>
	<script src="resources/js/jquery.validate.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/custom.js"></script>
</body>
</html>
