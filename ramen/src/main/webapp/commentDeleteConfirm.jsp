<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>コメント投稿ページ</title>
</head>
<body>

<h2><%=request.getAttribute("shop_name") %>コメント投稿ページ</h2>

	<form action="CommentRegistConfirm"method="post">
		
	メニュ<input type="text" name="menu"><br>
	値段<input type="text" name="price"><br>
	写真<input type="image"name="comentphoto"><br>
	評価
	<select name="genre">
		<option value="1">1</option>
		<option value="2">2</option>
		<option value="3">3</option>
		<option value="4">4</option>
		<option value="5">5</option>
	</select><br>
	ジャンル
	<select name="genre">
		<option value="醤油">1</option>
		<option value="塩">2</option>
		<option value="味噌">3</option>
		<option value="背油">4</option>
		<option value="豚骨">5</option>
	</select><br>
	<input type="submit" value="登録">
	</form>
	<button type="button"onclick="history.back()">戻る</button>
</body>
</html>