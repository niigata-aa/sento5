<%--店舗編集確認画面--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.Bean.ShopBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>店舗編集確認</title>
</head>
<body>
<%@include file = "header.jsp" %>
	<%
	ShopBean editInfo = (ShopBean)session.getAttribute("editInfo"); 
	%>
	<h1>編集確認ページ</h1>
	<div class="shopeditconfirm"><!--ショップ編集確認一覧  -->
		店名:<%=editInfo.getShopName() %><br>
		店名かな:<%=editInfo.getShopKana() %><br>
		住所:<%=editInfo.getAddress() %><br>
		開店時間:<%=editInfo.getOpenTime() %><br>
		閉店時間:<%=editInfo.getCloseTime() %><br>
		定休日:<%=editInfo.getClosedDay() %><br>
		詳細:<%=editInfo.getDetail() %><br>
		写真<img class="photo" src="/ramen/upload/<%=editInfo.getPhoto() %>" alt="店舗写真"><br>
	</div>
	<div class="back"><!-- 戻るボタン -->
	<button type="button" onclick="history.back()">戻る</button>
	</div>
	
	<div class="shopedit"><!-- 登録ボタン -->
	<form action="shop-edit" method="post">
		<input type="submit" value="登録">
	</form>
	</div>
	
</body>
</html>