<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザ登録</title>
</head>
<body>
<%@include file = "header.jsp" %>
<div class="title"><!-- title 	タイトルのみ -->
<h2>ユーザ登録</h2>
</div>

<div class="button"><!-- button ボタン群 -->
<button onclick="location.href='login.jsp'">ログイン画面へ</button>
</div>

<div class="regist-container"><!-- regist-container ユーザ登録のコンテナ -->
<form action="user-regist-confirm-servlet" method="POST">

<div class="inputname"><!-- inputname ユーザネーム入力 -->
ユーザ名：<input type="text" name="userName" required placeholder="ユーザ名を入力してください"><br>
</div>

<div class="inputID"><!-- inputID ID入力 -->
ユーザID：<input type="text" name="userId" placeholder="ユーザID"required><br>
</div>

<div class="inputpass"><!-- inputpass パスワード入力 -->
パスワード：<input type="password" minlength="8" name="password" placeholder="パスワード8文字以上" required><br>
</div>

<div class="submit"><!-- submit ボタン群 -->
<input type="submit"value="登録">
</div>

</form>
</div>
</body>
</html>