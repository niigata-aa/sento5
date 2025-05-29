<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理者ページ</title>
</head>
<body>
<<<<<<< HEAD
<h1>管理者ページ</h1>
=======
<%@include file = "header.jsp" %>
<div class="title"><!-- title タイトル -->
<h1>管理者ページ</h1></div>

<div class="serchbutton"><!-- serchbutton 検索ボタン -->
>>>>>>> branch 'master' of https://github.com/niigata-aa/sento5.git
<form action="shop-list-servlet" method="post">
<input type="submit" value="店舗一覧・編集">
</form>
<br>
<form action="user-list-servlet" method="post">
<input type="submit" value="ユーザ一覧">
</form>
<br>
</body>
</html>