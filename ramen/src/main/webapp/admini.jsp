<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理者ページ</title>
<link rel="stylesheet" href="css/admin.css">
</head>
<body>
<%@include file = "header.jsp" %>
<div class="title"><!-- title タイトル -->
<h1>管理者ページ</h1>
</div>

<div class="contaner">

	<div class="serchbutton"><!-- serchbutton 検索ボタン -->
	<form action="shop-list-servlet" method="post">
	<input type="submit" value="店舗一覧・編集">
	</form>
	<br>
	</div>


	<div class="userbutton"><!-- userbutton ユーザー一覧ボタン -->
	<form action="user-list-servlet" method="post">
	<input type="submit" value="ユーザ一覧">
	</form>
	<br>
	</div>

</div>
</body>
</html>