<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="model.Bean.ShopBean" %>
<%ShopBean registShop = (ShopBean) session.getAttribute("registShop"); %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

登録します

店名
<%=registShop.getShopName()%><br>
店名かな
<%=registShop.getShopKana()%>
住所

開店時間

閉店時間

詳細

写真ファイル


</body>
</html>