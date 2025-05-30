<%--店舗削除確認画面--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "model.Bean.ShopBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>店舗削除確認</title>
</head>
<body>
<<<<<<< HEAD
<div class="delete-container"><!-- delite-container 削除のコンテナ -->
=======
<%@include file = "header.jsp" %>
>>>>>>> branch 'master' of https://github.com/niigata-aa/sento5.git

<div class="title"><!-- title 	タイトルのみ -->
<h1>店舗削除確認画面</h1>
</div>

<form action="shop-delete" method="post">
	<div class="question"><!-- question ボタン -->
	この店舗を削除しますか<br>
	</div>
	<%
		ShopBean shop = (ShopBean)session.getAttribute("shop");
	%>
	<div class="shop-container"><!-- shop-container 削除のコンテイナー -->
	店名かな：<%=shop.getShopKana() %><br>
	店名：<%=shop.getShopName()%><br>
	住所：<%=shop.getAddress()%><br>
	営業時間：<%=shop.getOpenTime()%>～<%=shop.getCloseTime()%><br>
	定休日：<%=shop.getClosedDay() %><br>
	詳細：<%=shop.getDetail()%><br>
	写真：<img class="photo"src=<%=shop.getPhoto()%> alt="<%=shop.getShopName() %>+の店舗の写真"><br>
	</div>
	
	<div class="button"><!-- button ボタン -->
	<button type="button" onclick="history.back()">戻る</button>
	</div>
	
	<div class="submit"><!-- submit ボタン -->
	<input type="submit" value="削除">
	</div>
</form>
</div>
</body>
</html>