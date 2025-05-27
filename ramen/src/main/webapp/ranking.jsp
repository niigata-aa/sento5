<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "model.Bean.ShopBean,java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>おすすめランキング</title>
</head>
<body>
<%
List<ShopBean> shoprankList = (List<ShopBean>) request.getAttribute("shoprankList");
if(shoprankList() != 0){	
	for(ShopBean shop : shoprankList){
%>

<%=shop.getShopName %>
<%=shop.getPhoto %>
<%} %>

<%} else{ %>
	店舗情報がありません
	<%} 
	%>

</body>
</html>