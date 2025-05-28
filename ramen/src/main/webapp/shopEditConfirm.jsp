<%--店舗編集確認画面--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>店舗編集確認</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	<h1>編集確認ページ</h1>
	<jsp:useBean id="shop" class="model.Bean.ShopBean" scope="session"/>
		店名入力<jsp:getProperty name="shop" property="shopName"/><br>
		店名かな入力<jsp:getProperty name="shop" property="shopKana"/><br>
		住所<jsp:getProperty name="shop" property="address"/><br>
		開店時間<jsp:getProperty name="shop" property="openTime"/><br>
		閉店時間<jsp:getProperty name="shop" property="closeTime"/><br>
		詳細<jsp:getProperty name="shop" property="detail"/><br>
		写真<img class="photo"src=<jsp:getProperty name="shop" property="photo"/> alt="<jsp:getProperty name="shop" property="shopKana"/>+の店舗の写真">
	
	<form action="shop-edit" method="post">
		<input type="submit" value="登録">
	</form>
	<button onclick="history.back()" value="戻る"></button>
</body>
</html>