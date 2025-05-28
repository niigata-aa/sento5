<%--店舗編集画面--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>店舗編集</title>
</head>
<body>
<h1>店舗編集ページ</h1>
<jsp:useBean id="shop" class="model.Bean.ShopBean" scope="session"/>
<form action="shop-regist-confirm-servlet" method="post">
店名入力<input type="text" name="shopName" value="<jsp:getProperty name="shop" property="shopName"/>"><br>
店名かな入力<input type="text" name="shopKana" value="<jsp:getProperty name="shop" property="shopKana"/>"><br>
住所<input type="text" name="address" value="<jsp:getProperty name="shop" property="address"/>"><br>
開店時間<input type="number" name="openTime" value="<jsp:getProperty name="shop" property="openTime"/>"><br>
閉店時間<input type="number" name="closeTime"value="<jsp:getProperty name="shop" property="closeTime"/>"><br>
詳細<input type="text" name="detail"value="<jsp:getProperty name="shop" property="detail"/>"><br>
写真<input type="file" value="<jsp:getProperty name="shop" property="photo"/>"><br>
ジャンル<select name="genre" value="<jsp:getProperty name="shop" property="genre"/> ">
<option value="1">醤油</option>
<option value="2">塩</option>
<option value="3">味噌</option>
<option value="4">背油</option>
<option value="5">豚骨</option>
<option value="6">生姜醤油</option>
<option value="7">麻婆</option>
<option value="8">担々麵</option>
<option value="9">その他</option>
</select>
</form>
<button onclick="history.back()" value="戻る"></button>
<form action="shop-edit-confirm" method="post">
	<input type="submit" value="確認">
</form>
</body>
</html>