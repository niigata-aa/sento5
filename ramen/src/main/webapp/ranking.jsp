<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "model.Bean.ShopBean,java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>おすすめランキング</title>
</head>
<body>
<form action="shop-detail-servlet" method = "POST">
<%
	List<ShopBean> shoprankList = (List<ShopBean>)request.getAttribute("shoprankList");
if (shoprankList == null || shoprankList.size() == 0) {
	%>
	何もありません
<%}else {
	for(ShopBean shop : shoprankList){
%>

		<%=shop.getShopName() %>
		<img src = <%=shop.getPhoto() %>>
		
		<input type="hidden" name="shopname" value="<%shop.getShopName();%>">
		<input type="submit" name="photo" value="<%shop.getPhoto();%>">
<%}} %>

<% %>
	<%
	%>
</form>
</body>
</html>