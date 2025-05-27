<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ page import="model.DAO.ShopDAO" %>
<!--<%-->
<!--ShopDAO registShop = (ShopDAO) session.getAttribute("registShop");-->
<!--%>-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>店舗登録確認</title>
</head>
<body>
<form action="shop-regist-servlet" method="post">
店舗名
<input type="hidden" name="storeName" value="<%= request.getAttribute("storeName") != null ? request.getAttribute("") : "" %>">
店舗名かな
<input type="hidden" name="storeKana" value="<%= request.getAttribute("storeKana")%>">
住所
<input type="hidden" name="addres" value="<%= request.getAttribute("addres")%>">
開店時間
<input type="hidden" name="openTime" value="<%= request.getAttribute("openTime") != null ? request.getAttribute("openTime") : ""%>">
閉店時間
<input type="hidden" name="endTime" value="<%= request.getAttribute("endTime") != null ? request.getAttribute("endTime") : ""%>">
詳細
<input type="hidden" name="deteil" value="<%= request.getAttribute("deteil")%>">
写真ファイル
<input type="hidden" name="file" value="<%= request.getAttribute("file") != null ? request.getAttribute("file") : ""%>">
ジャンル
<input type="hidden" name="genre" value="<%= request.getAttribute("genre")%>">
<input type="submit" value="登録する">
<button type="button"onclick="history.back()" value="戻る"></button>
</form>
</body>
</html>