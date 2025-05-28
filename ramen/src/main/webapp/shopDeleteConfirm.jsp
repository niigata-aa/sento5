<%--店舗削除確認画面--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>店舗削除確認</title>
</head>
<body>
<h1>店舗削除確認画面</h1>
<form action="shop-delete-confirm" method="post">
	この店舗を削除しますか<br>
	店名かな：<%=request.getAttribute("shopKana")%><br>
	店名：<%=request.getAttribute("shopName")%><br>
	住所：<%=request.getAttribute("address")%><br>
	営業時間：<%=request.getAttribute("openTime")%>～<%=request.getAttribute("closeTime")%><br>
	定休日：<%=request.getAttribute("closedDay") %><br>
	詳細：<%=request.getAttribute("detail")%><br>
	写真：<img class="photo"src=<%%> alt="<% %>+の店舗の写真">
	<button onclick="history.back()" value="戻る"></button>
	<input type="submit" value="削除">
</form>
</body>
</html>