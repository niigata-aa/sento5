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
<div class="title"><!-- title　タイトル -->
<h1>店舗検索・一覧</h1></div>
<div class="search"><!-- search 検索フォーム全体 -->

<div class="searchtitle"><!-- searchtitle 検索タイトル -->
<h2>店舗検索</h2></div>


<form action="shop-search-servlet" method="POST">
<div class="namesearch"><!-- namesearch 店名入力 -->
店舗名：<input type="text" name="shopName" value="<%= request.getAttribute("searchShopName") != null ? request.getAttribute("searchShopName") : "" %>" placeholder="店舗名を入力"></div><br>

<div class="areasearch"><!-- areasearch 地域入力 -->>
エリア：<input type="text" name="area" value="<%= request.getAttribute("searchArea") != null ? request.getAttribute("searchArea") : "" %>" placeholder="エリアを入力"></div><br>

<div class="button">
<input type="submit" value="検索"><input type="button"onclick="history.back()" value="戻る"></div><br>
</form>
</div>

<div class="shoplistcontainer"><!-- shoplist 店舗一覧全体 -->

<div class="listtitle"><!-- listtitle タイトル -->
<h2>店舗一覧</h2></div>

<div class="">
<%List<ShopBean> shopList = (List<ShopBean>) request.getAttribute("shopList");
if(shopList != null && !shopList.isEmpty() ){
%>

<% for (ShopBean shop : shopList){ %>
<%=shop.getShopName() %><br>
<form action="shop-detail-servlet" method="post">
<input type="hidden"value="<%= shop.getShopId() %>"><br>
<img src="/ramen/upload/<%=shop.getPhoto() %>" alt="店舗写真">
<%if(shop.isWalkingDistance()){ %>
徒歩圏内
<%} else {%>
徒歩圏外
<%} %>
<% } %>
</form>
<%}else{%>
一致する内容がありません。
<% } %></div>
</div>

</body>
</html>