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
<input type="text" name="userName" required placeholder="ユーザ名を入力してください"maxlength="20"><br>
</div>

<div class="inputID"><!-- inputID ID入力 -->
<span>ユーザID</span><br>
<input type="text" name="userId" placeholder="5桁のユーザID"inputmode="numeric" title="半角数字5桁を入力してください" maxlength="5"pattern="[0-9]{5}"required/><br>
</div>

<div class="inputpass"><!-- inputpass パスワード入力 -->
<span>パスワード</span><br>
<input type="password"  name="password"  placeholder="半角英数字8文字以上"title="半角英数字8文字以上で入力してください"  pattern="[a-zA-Z0-9]+" minlength="8" required/><br>
</div>

<input type="submit"value="登録">

</form>
</div>
<div class="top"><!-- top  -->
<a href='login.jsp'>ログイン画面へ</a>
</div>
</body>
</html>