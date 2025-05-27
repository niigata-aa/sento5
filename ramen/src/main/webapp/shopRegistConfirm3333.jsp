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
<%=registShop.getAddress()%><br>
開店時間
<%=registShop.getOpenTime()%><br>
閉店時間
<%=registShop.getCloseTime()%><br>
詳細
<%=registShop.getDetail()%><br>
写真ファイル
<%=registShop.getPhoto()%><br>

</body>
</html>