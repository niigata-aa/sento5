<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding= "UTF-8" %>

<link rel="stylesheet" href="css/header2.css">

<div class="container">

<div class = "rogo"><!-- logo ロゴ -->

<form action="admin.jsp" method="post">
	<input type="image" src="img/rogo4.1.png" >
</form>
</div>

<div class="move"><!-- move 画面遷移 -->
<form action = "shop-list-servlet" method = "POST">
<input type = "submit"  value = "店舗一覧">
</form>

<form action = "shop-list-servlet" method = "POST">
<input type = "submit"  value = "店舗編集">
</form>

<form action = "user-list-servlet" method = "POST">
<input type = "submit"  value = "ユーザ一覧">
</form>
</div>

<div class="name"><!-- name ユーザー名 -->
ユーザ名：<%=session.getAttribute("userName") %>
</div>
<div class="rogout">
<form action = "logout-servlet" method = "POST">
<input type = "submit"  value = "ログアウト">
</form>
</div>
</div>

