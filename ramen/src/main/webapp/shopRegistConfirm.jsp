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
<% 
	ShopBean shopInfo = (ShopBean)session.getAttribute("shopInfo"); 
%>
<form action="shop-regist-servle" method="post">

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
<img src="/fileupload/upload/<%=shopInfo.getPhoto() %>"><br>


<button type="button"onclick="history.back()" value="戻る"></button>
<input type="submit" value="登録">	

</form>

</body>
</html>