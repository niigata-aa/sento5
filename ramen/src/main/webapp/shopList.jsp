<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,java.util.ArrayList,model.Bean.ShopBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>店舗一覧</title>
<link rel="stylesheet" href="css/shoplist.css">
</head>
<body>
<<<<<<< HEAD
<div class="shoplisttitle">店舗一覧
</div>

<div class="shoptitle">
=======
<%@include file = "header.jsp" %>
店舗一覧

>>>>>>> branch 'master' of https://github.com/niigata-aa/sento5.git
<form action="shop-detail-servlet" method="POST">
<% 
		List<ShopBean> shopList =(List<ShopBean>)request.getAttribute("shopList"); 
		for(ShopBean shop : shopList){
	%>

	<img src="/ramen/upload/<%=shop.getPhoto() %>">
<input type="submit" name="photo" value="<%=shop.getShopName() %> ">
		
		<%} %>
</form>
</div>
<div class="back" ><!-- 戻るボタン -->
	<button onclick="history.back()">戻る</button>
</div>
</body>
</html>