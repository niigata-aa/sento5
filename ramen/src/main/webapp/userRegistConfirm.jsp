<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザ登録確認画面</title>
</head>
<body>
<%@include file = "header.jsp" %>
<div class="title"><!-- title 	タイトルのみ -->
<h2>ユーザ登録確認画面</h2>
</div>
<div class="regist-container"><!-- regist-container ユーザ登録のコンテナ -->
<form action="user-regist-servlet" method="post">
このアカウントで登録しますか<br>
ユーザID：<%=session.getAttribute("userId") %><br>

<div class="ID"><!-- ID ID確認 -->
<input type="hidden" name="userId"value="<%=session.getAttribute("userId") %>">
</div>

パスワード：<%=session.getAttribute("password") %><br>

<div class="pass"><!-- pass パスワード確認 -->
<input type="hidden" name="password" value="<%=session.getAttribute("password") %>">
</div>

ユーザ名:<%= session.getAttribute("userName") %><br>

<div class="name"><!-- name ユーザネーム確認 -->
<input type="hidden" name="userName"value="<%=session.getAttribute("userName") %>">
</div>

<div class="submit"><!-- submit ボタン -->
<input type="submit" value="登録">
</div>

<div class="button"><!-- button ボタン -->	
<button type="button"onclick="history.back()">戻る</button>
</div>
</form>
</div>
</body>
</html>