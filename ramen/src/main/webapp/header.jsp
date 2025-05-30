<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding= "UTF-8" %>

<link rel="stylesheet" href="css/header.css">

<div class="container">
<div class="topbutton"><!-- topbutton トップページボタン -->
<form action = "top.jsp" method = "POST">
<input type = "submit"  value = "トップページへ">
</form></div>

<div class="name"><!-- name ユーザー名 -->
ログインユーザ：<%=session.getAttribute("userName") %></div>

<div class="outbutton"><!-- outbutton ログアウトボタン -->
<form action = "logout-servlet" method = "POST">
<input type = "submit"  value = "ログアウト">
</form></div>
</div>



