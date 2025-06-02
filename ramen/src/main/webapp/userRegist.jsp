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

<div class="title"><!-- title 	タイトルのみ -->
<h1>ユーザ登録</h1>
</div>

<div class="regist-container"><!-- regist-container ユーザ登録のコンテナ -->
<form action="user-regist-confirm-servlet" method="POST">

<div class="inputname"><!-- inputname ユーザネーム入力 -->
<span>ユーザ名</span><br>
<input type="text" name="userName" required placeholder="ユーザ名を入力してください"><br>
</div>

<div class="inputID"><!-- inputID ID入力 -->
<span>ユーザID</span><br>
<input type="number" name="userId" placeholder="5桁のユーザID"pattern="\d{5}"required/><br>
</div>

<div class="inputpass"><!-- inputpass パスワード入力 -->
<span>パスワード</span><br>
<input type="password"  name="password" placeholder="パスワード8文字以上"minlength="8" required/><br>
</div>

<input type="submit"value="登録">

</form>
</div>
<div class="top"><!-- top  -->
<a href='login.jsp'>ログイン画面へ</a>
</div>
</body>
</html>