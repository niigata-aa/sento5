<%--店舗削除確認画面--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "model.Bean.ShopBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>店舗削除確認</title>
<link rel="stylesheet" href="css/shopEditConfirm.css">
</head>
<body>
<div class="delete-container"><!-- delite-container 削除のコンテナ -->
<%@include file = "header.jsp" %>

<h1>店舗削除確認画面</h1>
<form action="shop-delete" method="post">
	<div class="question"><!-- question ボタン -->
	この店舗を削除しますか<br>
	</div>
	<%
		ShopBean shop = (ShopBean)session.getAttribute("shopdetail");
	%>
	<div class="shopeditconfirm"><!--削除コンテナ一覧  -->
	<div class="editform">
	<div class="infoitem">
	店舗名かな<div class="detail">
	<%=shop.getShopKana() %></div><br>
	</div>
	<div class="infoitem">
	店舗名<div class="detail">
	<%=shop.getShopName()%></div><br>
	</div>
	<div class="infoitem">
	住所<div class="detail">
	<%=shop.getAddress()%></div><br>
	</div>
	<div class="infoitem">
	開店時間<div class="detail">
	<%=shop.getOpenTime()%></div>
	</div>
	<div class="infoitem">
	閉店時間<div class="detail">
	<%=shop.getCloseTime()%></div><br>
	</div>
	<div class="infoitem">
	定休日<div class="detail">
	<%=shop.getClosedDay() %></div><br>
	</div>
	<div class="infoitem">
	詳細<div class="detail">
	<%=shop.getDetail()%></div><br>
	</div>
	<div class="infoitem">
	写真<div class="image">
	<img class="photo"src="/ramen/upload/<%=shop.getPhoto()%>" alt="<%=shop.getShopName() %>+の店舗の写真"></div><br>
	</div>
	

	
	<div class="edit"><!-- submit ボタン -->
	<input type="submit" value="削除">
	</div>
		<div class="back"><!-- button ボタン -->
	<button type="button" onclick="history.back()">戻る</button>
	</div>
</form>
</div>
</body>
</html>