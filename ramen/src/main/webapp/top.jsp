<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>トップページ</title>
</head>
<body>
<%@include file = "header.jsp" %>

<input type = "button" onclick = "location.href='mypage.jsp'" value = "マイページ">
<input type = "button" onclick = "location.href='shopSearch.jsp'" value = "店舗検索">
<input type = "button" onclick = "location.href='shopRegist.jsp'" value = "店舗登録">
 <h2>平均評価点ランキング</h2>
<%@include file = "ranking.jsp" %>

</body>
</html>