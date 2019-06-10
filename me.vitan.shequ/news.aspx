<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="news.aspx.cs" Inherits="me.vitan.shequ.news" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="css/template.css" rel="stylesheet" />
    <link href="css/index.css" rel="stylesheet" />
    <link href="lib/bootstrap.min.css" rel="stylesheet" />
    <link href="lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <title>通知详情</title>
    <style>
        #NewsTTL {
            text-align: center;
            padding: 8px;
            border-bottom: 1px solid #eaeaea;
            font-family: "微软雅黑", "Arial";
            color: #533;
        }

        #NewsDate, #NewsFrom {
            color: #777;
            font-size: 12px;
            margin-left: 10px;
        }

        #div_newsHoldr {
            padding: 10px;
        }


        .cke_show_borders {
            font-family: "微软雅黑", "Arial";
            color: #666;
        }

        .tc {
            text-align: center;
        }

        .tl {
            text-align: left;
        }

        .tr {
            text-align: right;
        }

        .cke_show_borders h3 {
            font-size: 16px;
            font-weight: bold;
            color: #444;
        }

        .cke_show_borders p {
            font-size: 14px;
            line-height: 20px;
            text-indent: 2em;
        }

        .cke_show_borders img {
            padding: 4px;
            border: 1px solid #eaeaea;
            margin: 10px auto;
            width: 200px;
            height: 200px;
        }

        #b {
            width: 800px;
            height: 800px;
        }
        #div_news p:nth-child(2n+1){
            text-align:left !important;
            margin-left:30px !important;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <section id="container">
            <header class="header black-bg">
                <div class="sidebar-toggle-box">
                    <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
                </div>
                <a href="iindex.aspx" class="logo"><b>社区管理<span>系统</span></b></a>
                <div class="nav notify-row" id="top_menu">
                    <ul class="nav top-menu">
                    </ul>
                </div>
                <div class="top-menu">
                    <ul class="nav pull-right top-menu">
                        <li>
                            <a class="logout" href="login.aspx">登陆</a>
                        </li>
                        <li><a class="logout" href="center.aspx">个人中心</a></li>
                    </ul>
                </div>
            </header>
        </section>
        <main id="main" class="site-main">
            <section class="carousel slide section-slide carousel-inner">
                <div id="div_news" style="margin-top:50px;">
            <asp:ListView ID="lv_newsDetail" runat="server" DataSourceID="SqlDataSource1" ItemPlaceholderID="news_holder">
                <LayoutTemplate>
                    <div runat="server" id="news_holder"></div>
                </LayoutTemplate>

                <ItemTemplate>
                    <h1 id="NewsTTL"><%#Eval("title") %></h1>
                    <p class="tc">
                        <span id="NewsDate">日期: <%#Eval("time","{0:d}") %></span>
                        <span id="NewsFrom">来源: <%#Eval("from") %></span>
                    </p>

                    <div id="newsContent" class="cke_show_borders">
                        <%#Eval("content") %>
                    </div>

                </ItemTemplate>


            </asp:ListView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:communityConnectionString %>" SelectCommand="SELECT * FROM [tongzhi] WHERE ([id] = @id)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="id" QueryStringField="id" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
            </section>

        </main>

        <footer class="site-footer">
            <div class="text-center">
                <p>
                    &copy; Copyrights <strong>Vitan</strong>. All Rights Reserved
                </p>
                <div class="credits">
                    社区管理系统 <a href="https://vitan.me">vitan.me</a>
                </div>
            </div>
        </footer>
        <div class="scroll-to-top" data-spy="affix" data-offset-top="200"><a href="#page" class="smooth-scroll"><i class="fa fa-arrow-up"></i></a></div>

        <script src="lib/jquery/jquery.js"></script>
        <link href="lib/bootstrap.min.css" rel="stylesheet" />
        <script src="lib/carousel.js"></script>
        <script type="text/javascript">
    </form>
</body>
</html>
