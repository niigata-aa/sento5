<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.Bean.ShopBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>コメント投稿ページ</title>
</head>
<body>
<%@include file = "header.jsp" %>
<% 
	ShopBean shop = (ShopBean)session.getAttribute("shopdetail");
%>
<h2><%=shop.getShopName() %>コメント投稿ページ</h2>

<div class="title"><!-- title タイトル -->
<h2><%=request.getAttribute("shop_name") %>コメント投稿ページ</h2></div>
>
	<form action="comment-regist-confirm-servlet"method="post">
		<input type="hidden" name="shopName" value="<%=shop.getShopId() %>">
	<div class="commentcontainer"><!-- commentcontainer コメント確認 -->
	メニュ<input type="text" name="menu"><br>
	値段<input type="text" name="value"><br>
	写真<input type="file"name="comentphoto"><br>
	評価
	<select name="rate">
		<option value="1">1</option>
		<option value="2">2</option>
		<option value="3">3</option>
		<option value="4">4</option>
		<option value="5">5</option>
	</select><br>
	ジャンル
	<select name="genre">
		<option value="醤油">醬油</option>
		<option value="塩">塩</option>
		<option value="味噌">味噌</option>
		<option value="背油">背油</option>
		<option value="豚骨">豚骨</option>
	</select><br>
	</div><br>
	
	<div class="registbutton"><!-- registbutton 登録ボタン -->
	<input type="submit" value="登録"></div>	
	</form>
	
	<div class="backbutton"><!-- buckbutton 戻るボタン -->
	<button type="button"onclick="history.back()">戻る</button></div>
</body>
</html>