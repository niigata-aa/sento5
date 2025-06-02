<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.Bean.ShopBean" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>店舗登録確認</title>
<link rel="stylesheet" href="css/shopRegistConfirm.css">
</head>
<body>
<%@include file = "header.jsp" %>
<% 
	ShopBean shopInfo = (ShopBean)session.getAttribute("shopInfo"); 
%>
<form action="shop-regist-servlet" method="post">
<div class="shopregistconfirm"> <!-- ショップ登録確認まとめですよい -->
<div class="registform">
この内容で登録します<br>

<div class="infoitem">
店舗名<br><div class="detaile">
<%=shopInfo.getShopName() %></div><br>
</div>

<div class="infoitem">
店舗名かな<br><div class="detaile">
<%=shopInfo.getShopKana() %></div><br>
</div>

<div class="infoitem">
住所<br><div class="detaile">
<%=shopInfo.getAddress() %></div><br>
</div>

<div class="infoitem">
開店時間<br><div class="detaile">
<%=shopInfo.getOpenTime() %></div><br>
</div>

<div class="infoitem">
閉店時間<br><div class="detaile">
<%=shopInfo.getCloseTime() %></div><br>
</div>

<div class="infoitem">
詳細<br><div class="detaile">
<%=shopInfo.getDetail() %></div><br>
</div>

<div class="infoitem">
写真<br><div class="image">
<img src="/ramen/upload/<%=shopInfo.getPhoto() %>"></div><br>
</div>

<div class="infoitem">
<div class="detaile">
<%if(shopInfo.isWalkingDistance()){%>
	徒歩圏内
<% }else{%>
	徒歩圏外
<%} %></div>
</div>

<div class="regist"> <!-- 登録ボタンですよ -->
<input type="submit" value="登録">	
</div>
</div>
</div>

<div class="back"><!-- 戻るボタン -->
<button type="button"onclick="history.back()" >	戻る</button>
</div>

</form>

</body>
</html>