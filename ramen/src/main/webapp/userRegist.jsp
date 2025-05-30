<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザ登録</title>
<link rel="stylesheet" href="css/login.css">
</head>
<body>
<%@include file = "header.jsp" %>

<div class="title"><!-- title 	タイトルのみ -->
<h2>ユーザ登録</h2>
</div>

<div class="top"><!-- top  -->
<button onclick="location.href='login.jsp'">ログイン画面へ</button>
</div>

<div class="regist-container"><!-- regist-container ユーザ登録のコンテナ -->
<form action="user-regist-confirm-servlet" method="POST">

<div class="inputname"><!-- inputname ユーザネーム入力 -->
<span>ユーザ名</span><br>
<input type="text" name="userName" required placeholder="ユーザ名を入力してください"><br>
</div>

<div class="inputID"><!-- inputID ID入力 -->
<span>ユーザID</span><br>
<input type="text" name="userId" placeholder="ユーザID"required><br>
</div>

<div class="inputpass"><!-- inputpass パスワード入力 -->
<span>パスワード</span><br>
<input type="password" minlength="8" name="password" placeholder="パスワード8文字以上" required><br>
</div>

<div class="button"><!-- submit ボタン群 -->
<input type="submit"value="登録">
</div>

</form>
</div>
</body>
</html>