<%--店舗編集画面--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="model.Bean.ShopBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>店舗編集</title>
</head>
<body>
	<%@include file="header.jsp"%>
	<h1>店舗編集ページ</h1>
	<% 
	ShopBean shop = (ShopBean)session.getAttribute("shopdetail"); 
%>
	<form action="shop-edit-confirm" method="post">

		<div class="shopedit">
			<!-- ショップ編集フォーム -->
			店名入力<input type="text" name="shopName"
				value="<%=shop.getShopName()%>"><br> 
			店名かな入力<input
				type="text" name="shopKana" value="<%=shop.getShopKana()%>"><br>
			住所<input type="text" name="address" value="<%=shop.getAddress()%>"><br>
			開店時間<input type="time" name="openTime"
				value="<%=shop.getOpenTime()%>"><br> 
			閉店時間<input
				type="time" name="closeTime" value="<%=shop.getCloseTime()%>"><br>
			定休日<input type="text" name="closedDay"
				value="<%=shop.getClosedDay()%>"> 
			詳細<input type="text"
				name="detail" value="<%=shop.getDetail()%>"><br> 
			写真<input
				type="file" name="image" value="<%=shop.getPhoto()%>"><br>
				<img src="/ramen/upload/<%=shop.getPhoto() %>" alt="店舗写真">
		</div>
		


	<div class="back">
		<!-- 戻るボタン -->
		<button type="button" onclick="history.back()">戻る</button>
	</div>
	<div class="confirm">
		<!-- 確認ボタン -->
			<input type="submit" value="確認">
	</div>
		</form>
</body>
</html>