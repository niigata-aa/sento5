<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "model.Bean.ShopBean,java.util.List"%>

<body>
<div class="rankcontainer"><!-- rankcontainer ランキングコンテナ -->
<form action="shop-detail-servlet" method = "POST">
<%
	List<ShopBean> shoprankList = (List<ShopBean>)request.getAttribute("shoprankList");
	int rank = 1;
if (shoprankList == null || shoprankList.size() == 0) {
	%>
	<div class="notlist"><!-- notlist 何もなかった時 -->
	何もありません</div>
<%}else {
	for(ShopBean shop : shoprankList){
		
%>
        <div class="rankbox"><!-- rankbox ランクごとの箱 -->
		第 <%=rank %>位
		<%=shop.getShopName() %>
		<img src = "/ramen/upload/<%=shop.getPhoto() %>">
		
		<input type="hidden" name="shopname" value="<%shop.getShopName();%>">
		<input type="submit" name="photo" value="<%shop.getPhoto();%>"></div>
		<br>
		
<%rank += 1;
}} %>

<% %>
	<%
	%>
</form></div>
