<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.Bean.ShopBean,java.util.List"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>トップページ</title>
    <link rel="stylesheet" href="css/top.css">
</head>
<body>
    <!-- ヘッダー -->

        <%@include file="header.jsp"%>
    <!-- メインコンテンツ -->
    <main class="main-container">
    システムの説明
        <!-- 平均評価点ランキング -->
        <div class="ave-container">
            <h2>平均評価点ランキング</h2>
            <div class="rankcontainer">
                <%
                List<ShopBean> shoprankList = (List<ShopBean>) request.getAttribute("shoprankList");
                int rank = 1;
                if (shoprankList == null || shoprankList.isEmpty()) {
                %>
                    <div class="notlist">何もありません</div>
                <%
                } else {
                    for (ShopBean shop : shoprankList) {
                %>
                <div class="rankbox">
                    <p>第<%= rank %>位</p>
                    <p><%= shop.getShopName() %></p>
                    <p>平均評価点：<%= Math.floor(shop.getAverageRate() * 10) / 10 %>点</p>
                    <!-- 店舗詳細へのリンク -->
                    <form action="shop-detail" method="POST">
                     
                    <%if( session.getAttribute("userId")==null) {%>
                    	<%= request.getAttribute("Message")!= null ? request.getAttribute("Message"): ""%>
                    	<%}; %>	
                        <div class="image">
                            <input type="image" src="/ramen/upload/<%= shop.getPhoto() %>"alt="<%= shop.getPhoto() %>" title="<%= shop.getShopName() %>">
							<input type="hidden" name="shopId" value="<%= shop.getShopId() %>">
                        </div>    
                    </form>
                </div>
                <%
				rank++;
                    }
                }
                %>
            </div>
        </div>
    </main>
</body>
</html>
