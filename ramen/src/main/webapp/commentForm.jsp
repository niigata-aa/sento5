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

<div class="title"><!-- title タイトル -->
<h2><%=shop.getShopName() %>コメント投稿ページ</h2></div>
	<form action="comment-regist-confirm-servlet"method="post"enctype="multipart/form-data">
		<input type="hidden" name="shopId" value="<%=shop.getShopId() %>">
	<div class="commentcontainer"><!-- commentcontainer コメント確認 -->
	メニュ:<input type="text" name="menu"><br>
	値段:<input type="text" name="value"><br>
	写真:<input type="file"name="commentphoto"><br>
	評価:
	<select name="rate">
		<option value="1">1</option>
		<option value="2">2</option>
		<option value="3">3</option>
		<option value="4">4</option>
		<option value="5">5</option>
	</select><br>
	ジャンル
	<select name="genreId">
		<option value="1">醬油</option>
		<option value="2">塩</option>
		<option value="3">味噌</option>
		<option value="4">背油</option>
		<option value="5">豚骨</option>
	</select><br>
	レビュー：<textarea name="review" cols="40"rows="3"></textarea><br>
	</div><br>
	
	<div class="registbutton"><!-- registbutton 登録ボタン -->
	<input type="submit" value="登録"></div>	
	</form>
	
	<div class="backbutton"><!-- buckbutton 戻るボタン -->
	<button type="button"onclick="history.back()">戻る</button></div>
</body>
</html>