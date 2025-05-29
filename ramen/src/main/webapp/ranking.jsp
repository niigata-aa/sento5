<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "model.Bean.ShopBean,java.util.List"%>

<body>
<form action="shop-detail-servlet" method = "POST">
<%
	List<ShopBean> shoprankList = (List<ShopBean>)request.getAttribute("shoprankList");
	int rank = 1;
if (shoprankList == null || shoprankList.size() == 0) {
	%>
	何もありません
<%}else {
	for(ShopBean shop : shoprankList){
		
%>
		第 <%=rank %>位
		<%=shop.getShopName() %>
		<img src = "/ramen/upload/<%=shop.getPhoto() %>">
		
		<input type="hidden" name="shopname" value="<%shop.getShopName();%>">
		<input type="submit" name="photo" value="<%shop.getPhoto();%>">
		<br>
		
<%rank += 1;
}} %>

<% %>
	<%
	%>
</form>
