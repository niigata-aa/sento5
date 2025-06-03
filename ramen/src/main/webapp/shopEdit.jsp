<%--店舗編集画面--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="model.Bean.ShopBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>店舗編集</title>
<link rel="stylesheet" href="css/shopEdit.css">
</head>
<body>
	<%@include file="header.jsp"%>
	<h1>店舗編集ページ</h1>
	<% 
	request.setCharacterEncoding("UTF-8");
	ShopBean shop = (ShopBean)session.getAttribute("shopdetail"); 
%>
<div class="shopedit">
	<form action="shop-edit-confirm" method="post">

				
			<!-- ショップ編集フォーム -->
			店名入力<input type="text" name="shopName"maxlength="50"
				value="<%=shop.getShopName()%>" required><br> 
			店名かな入力<input
				type="text" name="shopKana"maxlength="50" value="<%=shop.getShopKana()%>" required><br>
			住所<input type="text" name="address" maxlength="50"value="<%=shop.getAddress()%>" required><br>
			開店時間<input type="time" name="openTime"
				value="<%=shop.getOpenTime()%>"><br> 
			閉店時間<input
				type="time" name="closeTime" value="<%=shop.getCloseTime()%>"><br>
			定休日<input type="text" name="closedDay"maxlength="50"value="<%=shop.getClosedDay()%>"> 
			詳細<input type="text"maxlength="200"
				name="detail" value="<%=shop.getDetail()%>"><br> 
			写真<div class="image">
				<img src="/ramen/upload/<%=shop.getPhoto() %>" alt="店舗写真"></div>
		
		


	<div class="back">
		<!-- 戻るボタン -->
		<button type="button" onclick="history.back()">戻る</button>
	</div>
	<div class="confirm">
		<!-- 確認ボタン -->
			<input type="submit" value="確認">
	</div>
		</form></div>
</body>
</html>