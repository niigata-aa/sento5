<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--<%@ page import="java.util.List" %>-->
    
<!--<%-->
<!--//サーブレットの受け取り-->
<!--List<String> list = (List<String>)request.getAttribute("list");-->

<!--%>-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>店舗登録確認</title>
</head>
<body>
<form action="shop-regist-servle" method="post">


<jsp:useBean id="shop" scope="request" class="model.Bean.ShopBean"/>
この内容で登録します<br>
店舗名
<jsp:getProperty property="shopName" name="shop"/><br>
店舗名かな
<jsp:getProperty property="shopKana" name="shop"/><br>
住所
<jsp:getProperty property="addres" name="shop"/><br>
開店時間
<jsp:getProperty property="openTime" name="shop"/><br>
閉店時間
<jsp:getProperty property="endTime" name="shop"/><br>
詳細
<jsp:getProperty property="detaile" name="shop"/><br>
写真ファイル
<jsp:getProperty property="file" name="shop"/><br>
ジャンル
<jsp:getProperty property="genre" name="shop"/><br>

<button type="button"onclick="history.back()" value="戻る"></button>
<input type="submit" value="登録">	

</form>

</body>
</html>