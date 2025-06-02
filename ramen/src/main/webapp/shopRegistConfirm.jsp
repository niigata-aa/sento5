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
店舗名<br>
<%=shopInfo.getShopName() %><br>
</div>

<div class="infoitem">
店舗名かな<br>
<%=shopInfo.getShopKana() %><br>
</div>

<div class="infoitem">
住所<br>
<%=shopInfo.getAddress() %><br>
</div>

<div class="infoitem">
開店時間<br>
<%=shopInfo.getOpenTime() %><br>
</div>

<div class="infoitem">
閉店時間<br>
<%=shopInfo.getCloseTime() %><br>
</div>

<div class="infoitem">
詳細<br>
<%=shopInfo.getDetail() %><br>
</div>

<div class="photo">
写真<br>
<img src="/ramen/upload/<%=shopInfo.getPhoto() %>"><br>
</div>

<div class="infoitem">
<%if(shopInfo.isWalkingDistance()){%>
	徒歩圏内
<% }else{%>
	徒歩圏外
<%} %>
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