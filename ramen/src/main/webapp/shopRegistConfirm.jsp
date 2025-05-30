<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.Bean.ShopBean" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>店舗登録確認</title>
</head>
<body>
<%@include file = "header.jsp" %>
<% 
	ShopBean shopInfo = (ShopBean)session.getAttribute("shopInfo"); 
%>
<form action="shop-regist-servlet" method="post">
<div class="shopregistconfirm"> <!-- ショップ登録確認まとめですよい -->
この内容で登録します<br>
店舗名
<%=shopInfo.getShopName() %>
<br>
店舗名かな
<%=shopInfo.getShopKana() %><br>
住所
<%=shopInfo.getAddress() %><br>
開店時間
<%=shopInfo.getOpenTime() %><br>
閉店時間
<%=shopInfo.getCloseTime() %><br>
詳細
<%=shopInfo.getDetail() %><br>
写真
<img src="/ramen/upload/<%=shopInfo.getPhoto() %>"><br>

<%if(shopInfo.isWalkingDistance()){%>
	徒歩圏内
<% }else{%>
	徒歩圏外
<%} %>
</div>

<div class="regist"> <!-- 登録ボタンですよ -->
<input type="submit" value="登録">	
</div>

<div class="back"><!-- 戻るボタン -->
<button type="button"onclick="history.back()" >	戻る</button>
</div>

</form>

</body>
</html>