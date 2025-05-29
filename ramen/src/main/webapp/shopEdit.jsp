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
開店時間<input type="time" name="openTime" value="<jsp:getProperty name="shop" property="openTime"/>"><br>
閉店時間<input type="time" name="closeTime"value="<jsp:getProperty name="shop" property="closeTime"/>"><br>
定休日<input type="text" name="closedDay" value="<jsp:getProperty name="shop" property="closedDay"/>">
詳細<input type="text" name="detail"value="<jsp:getProperty name="shop" property="detail"/>"><br>
写真<input type="file" value="<jsp:getProperty name="shop" property="photo"/>"><br>

</form>
<button type="button" onclick="history.back()">戻る</button>
<form action="shop-edit-confirm" method="post">
	<input type="submit" value="確認">
</form>
</body>
</html>