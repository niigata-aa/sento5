<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding= "UTF-8" %>

<link rel="stylesheet" href="css/header.css">

<div class="container">
<!--<div class="topbutton"> topbutton トップページボタン -->
<!--<form action = "ranking-servlet" method = "POST">-->
<!--<input type = "submit"  value = "トップページへ">-->
<!--</form></div>-->


<form action="ranking-servlet" method="post">
<div class = "rogo"><!-- ロゴのやつ -->
			<input type="image" src="img/rogo-final.png" >
			</div>
			</form>
			
<%if(session.getAttribute("userId")!=null){ %>
<div class="move"><!-- move 画面遷移 -->
<form action = "mypage.jsp" method = "POST">
<input type = "submit"  value = "マイページ">
</form>

<form action = "shop-list-servlet" method = "POST">
<input type = "submit"  value = "店舗検索">
</form>

<form action = "shopRegist.jsp" method = "POST">
<input type = "submit"  value = "店舗登録">
</form>
</div>
		
<div class="username"><!-- name ユーザー名 -->
ユーザ名：<%=session.getAttribute("userName") %></div>
<%}%>
<div class="rogout"><!-- outbutton ログアウトボタン -->
<%if(session.getAttribute("userId")==null){ %>

<form action = "userRegist.jsp" method = "POST">
<input type = "submit"  value = "新規登録">
</form>

<form action = "login.jsp" method = "POST">
<input type = "submit"  value = "ログイン">
</form>
<%}else{%>
<form action = "logout-servlet" method = "POST">
<input type = "submit"  value = "ログアウト">
</form>
<%}; %></div>
</div>


