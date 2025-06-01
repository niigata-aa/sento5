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
    <header>
        <%@include file="header.jsp"%>
    </header>
    <!-- メインコンテンツ -->
    <main class="main-container">
        <!-- メニューコンテナ -->
        <div class="menu-container">
            <div class="menubutton">
                <!-- マイページボタン -->
                <input type="button" onclick="location.href='mypage.jsp'" value="マイページ">
            </div>
            <div class="menubutton">
                <!-- 店舗検索ボタン -->
                <form action="shop-list-servlet" method="post">
                    <input type="submit" value="店舗検索">
                </form>
            </div>
            <div class="menubutton">
                <!-- 店舗登録ボタン -->
                <input type="button" onclick="location.href='shopRegist.jsp'" value="店舗登録">
            </div>
        </div>
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
