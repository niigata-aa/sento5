<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,java.util.ArrayList,model.Bean.ShopBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>店舗一覧</title>
</head>
<body>
店舗一覧

<form action="shop-detail-servlet" method="POST">
<% 
		List<ShopBean> shopList =(List<ShopBean>)request.getAttribute("shopList"); 
		for(ShopBean shop : shopList){
	%>
	<img src="/ramen/upload/<%=shop.getPhoto() %>">
<input type="submit" name="photo" value="<%=shop.getShopName() %> ">
		
		<%} %>
</form>
	<button onclick="history.back()">戻る</button>

</body>
</html>