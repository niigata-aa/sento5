<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Bean.ShopBean" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>店舗検索・一覧</title>
</head>
<body>
<h1>店舗検索・一覧</h1>
<div>
<h2>店舗検索</h2>
<form action="shop-search-servlet" method="POST">
店舗名：<input type="text" name="shopName" value="<%= request.getAttribute("searchShopName") != null ? request.getAttribute("searchShopName") : "" %>" placeholder="店舗名を入力"><br>
エリア：<input type="text" name="area" value="<%= request.getAttribute("searchArea") != null ? request.getAttribute("searchArea") : "" %>" placeholder="エリアを入力"><br>
<input type="submit" value="検索"><br>
</form>
</div>

<div>
<form action="shop-detail-servlet" method="post">
<h2>店舗一覧</h2>
<%List<ShopBean> shopList = (List<ShopBean>) request.getAttribute("shopList");
if(shopList != null && !shopList.isEmpty() ){
%>

<% for (ShopBean shop : shopList){ %>
<%=shop.getShopName() %>
<a href="ShopDetailServlet?shopId=<%= shop.getShopId() %>"></a><img src="<%=shop.getPhoto() %>" alt="店舗写真">
<% } %>

<%}else{%>
一致する内容がありません。
<% } %>
</form>
</div>

</body>
</html>