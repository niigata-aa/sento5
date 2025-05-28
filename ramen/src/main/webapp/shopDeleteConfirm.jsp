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
<h1>店舗削除確認画面</h1>
<form action="shop-delete-servlet" method="post">
	この店舗を削除しますか<br>
	<%
		ShopBean shop = (ShopBean)session.getAttribute("shop");
	%>
	店名かな：<%=shop.getShopKana() %><br>
	店名：<%=shop.getShopName()%><br>
	住所：<%=shop.getAddress()%><br>
	営業時間：<%=shop.getOpenTime()%>～<%=shop.getCloseTime()%><br>
	定休日：<%=shop.getClosedDay() %><br>
	詳細：<%=shop.getDetail()%><br>
	写真：<img class="photo"src=<%=shop.getPhoto()%> alt="<%=shop.getShopName() %>+の店舗の写真">
	<button onclick="history.back()" value="戻る"></button>
	<input type="submit" value="削除">
</form>
</body>
</html>