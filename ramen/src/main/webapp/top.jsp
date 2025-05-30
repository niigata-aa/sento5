<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "model.Bean.ShopBean,java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>トップページ</title>
</head>
<body>
<%@include file = "header.jsp" %>

<div class="mypage"><!-- mypage マイページボタン -->
<input type = "button" onclick = "location.href='mypage.jsp'" value = "マイページ">
</div>

<div class="shopsearch"><!-- shopsearch 検索ボタン -->
<form action="shop-list-servlet" method="post">
<input type="submit" value="店舗検索">
</form>
</div>

<div class="shopregist"><!-- shopregist 登録ボタン -->
<input type = "button" onclick = "location.href='shopRegist.jsp'" value = "店舗登録"></div>

<div class="ave-cotainer"><!-- ave-cotainer 評価のコンテナ -->
<div class="ave"><!-- ave ランキングタイトル --> 
 <h2>平均評価点ランキング</h2></div></div>
 
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
		<%=shop.getShopName() %><br>
		平均評価点：
		<%=shop.getAverageRate() %>点
		<img src = "/ramen/upload/<%=shop.getPhoto() %>">
		
		<input type="hidden" name="shopname" value="<%shop.getShopName();%>">
		<input type="submit" name="photo" value="<%shop.getPhoto();%>"></div>
		<br>
		
<%rank += 1;
}} %>

<% %>
	<%
	%>
</form>
</div>
</body>
</html>