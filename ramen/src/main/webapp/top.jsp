<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>トップページ</title>
</head>
<body>
<%@include file = "header.jsp" %>

<div class="mypage"><!-- mypage マイページボタン -->
<input type = "button" onclick = "location.href='mypage.jsp'" value = "マイページ">
</div>

<div class="shopsearch"><!-- shopsearch 検索ボタン -->
<form action="shop-list-servlet" method="post">
<input type="submit" value="店舗検索">
</form>
</div>

<div class="shopregist"><!-- shopregist 登録ボタン -->
<input type = "button" onclick = "location.href='shopRegist.jsp'" value = "店舗登録"></div>

<div class="ave-cotainer"><!-- ave-cotainer 評価のコンテナ -->
<div class="ave"><!-- ave ランキングタイトル --> 
 <h2>平均評価点ランキング</h2></div>
 
 <div class="rank"><!-- rank ランキングびリスト一覧 -->
<%@include file = "ranking.jsp" %></div>
</div>

</body>
</html>