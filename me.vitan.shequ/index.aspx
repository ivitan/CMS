<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="me.vitan.shequ.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>主页</title>
    <link href="css/template.css" rel="stylesheet" />
    <link href="css/index.css" rel="stylesheet" />
    <link href="lib/bootstrap.min.css" rel="stylesheet" />
    <link href="lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        .table {
            text-align: left !important;
        }

        ul {
            list-style: none;
        }

        .poster-main {
            position: relative;
            margin-left: 13%;
            margin-top: 50px;
        }

            .poster-main a, .poster-main img {
                display: block;
                width: 100%;
                height: 100%;
            }

            .poster-main img {
            }

            .poster-main .poster-list {
                width: 1000px;
                height: 500px;
            }

                .poster-main .poster-list .poster-item {
                    width: 200px;
                    height: 500px;
                    position: absolute;
                    left: 0;
                    top: 0;
                }

            .poster-main .poster-btn {
                position: absolute;
                top: 0;
                cursor: pointer;
                filter: opacity(.5) brightness(1);
            }

                .poster-main .poster-btn:hover {
                    filter: opacity(1) brightness(2);
                }

            .poster-main .poster-prev-btn {
                left: 0;
                background: url(/img/left.png) no-repeat center center;
            }

            .poster-main .poster-next-btn {
                right: 0;
                background: url(/img/right.png) no-repeat center center;
            }

        .poster-item-title {
            font-size: 18px;
            text-align: center;
            line-height: 48px;
            display: block;
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
                <a href="index.aspx" class="logo"><b>社区管理<span>系统</span></b></a>
                <div class="nav notify-row" id="top_menu">
                    <ul class="nav top-menu">
                    </ul>
                </div>
                <div class="top-menu">
                    <ul class="nav pull-right top-menu">
                        <li>
                            <a class="logout" href="login.aspx">登陆</a>
                        </li>
                        <li><a class="logout" href="usercenter.aspx">个人中心</a></li>
                    </ul>
                </div>
            </header>
        </section>
        <main id="main" class="site-main">
            <section class="section section-portfolio">
                <div class="container">
                    <h2 class="section-title"><span>活动剪影</span></h2>
                    <div class="poster-main">
                        <div class="poster-btn poster-prev-btn"></div>
                        <ul class="poster-list">
                            <li class="poster-item"><a href="#">
                                <img src="/images/1.jpg" /></a>
                                <span class="poster-item-title">活动 1</span>
                            </li>
                            <li class="poster-item"><a href="#">
                                <img src="/images/2.jpg" /></a>
                                <span class="poster-item-title">活动 2</span>
                            </li>
                            <li class="poster-item"><a href="#">
                                <img src="/images/3.jpg" /></a>
                                <span class="poster-item-title">活动 3</span>
                            </li>
                            <li class="poster-item"><a href="#">
                                <img src="/images/4.jpg" /></a>
                                <span class="poster-item-title">活动 4</span>
                            </li>
                            <li class="poster-item"><a href="#">
                                <img src="/images/5.jpg" /></a>
                                <span class="poster-item-title">活动 5</span>
                            </li>
                        </ul>
                        <div class="poster-btn poster-next-btn"></div>
                    </div>
                </div>
            </section>
            <section id="pricing" class="section section-center section-pricing">
                <div class="container">
                    <h2 class="section-title"><span>近期活动</span></h2>
                    <div class="pricing-table">
                        <div class="row">
                            <asp:ListView ID="ListView1" runat="server" ItemPlaceholderID="itemholder" DataSourceID="SqlDataSource3">
                                <LayoutTemplate>
                                    <div id="itemholder" class="panel panel-primary" runat="server"></div>
                                </LayoutTemplate>
                                <ItemTemplate>
                                    <div class="col-md-3 col-sm-6">
                                        <div class="panel panel-primary">
                                            <header class="panel-heading">
                                                <h3><%#Eval("主题") %></h3>
                                            </header>
                                            <div class="panel-body">
                                                <table class="table">
                                                    <tbody>
                                                        <tr class="active">
                                                            <td>活动时间：<%#Eval("活动时间")%></td>
                                                        </tr>
                                                        <tr class="active">
                                                            <td>活动地点：<%#Eval("活动地点")%></td>
                                                        </tr>
                                                        <tr class="active">
                                                            <td>面向对象：<%#Eval("面向对象")%></td>
                                                        </tr>
                                                        <tr class="active">
                                                            <td>活动内容: <%#Eval("活动内容")%></td>
                                                        </tr>
                                                        <tr class="active">
                                                            <td>备注: <%#Eval("备注")%></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <footer class="panel-footer"><a href='baoming.aspx?hd=<%#Eval("主题") %>' class="btn btn-block btn-primary">立即报名</a></footer>
                                            <br />
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:ListView>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:communityConnectionString %>" SelectCommand="SELECT * FROM [wenti]"></asp:SqlDataSource>
                        </div>
                    </div>
                </div>
            </section>

            <section class="section section-portfolio">
                <div class="container">
                    <h2 class="section-title"><span>重要公告</span></h2>
                    <div class="pricing-table">
                        <div class="row">
                            <asp:ListView ID="lv_newsDetail" runat="server" DataSourceID="SqlDataSource2" ItemPlaceholderID="news_holder">
                                <LayoutTemplate>
                                    <div runat="server" id="news_holder"></div>
                                </LayoutTemplate>
                                <ItemTemplate>
                                    <div class="col-md-3 col-sm-6">
                                        <div class="panel panel-primary">
                                            <header class="panel-heading">
                                                <h2><%#Eval("title")%></h2>
                                            </header>
                                            <div class="panel-body">
                                                <table class="table">
                                                    <tbody>
                                                        <tr class="active">
                                                            <td><%#Eval("from")%></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <footer class="panel-footer">
                                                <a href="news.aspx?id=<%#Eval("id") %>" class="btn btn-block btn-primary">阅读详情</a>
                                            </footer>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:ListView>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:communityConnectionString %>" SelectCommand="SELECT * FROM [tongzhi]"></asp:SqlDataSource>
                        </div>
                    </div>
                </div>

            </section>
            <section id="portfolio" class="section section-portfolio">
                <div class="container">
                    <h2 class="section-title"><span>资料下载</span></h2>
                    <p style="font-size: 16px; color: Red;">
                        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">文件下载</asp:LinkButton>
                    </p>
                    <div class="entry-thumbnail">
                    </div>
                </div>
            </section>
            <section class="section section-portfolio">
                <div class="container">
                    <h2 class="section-title"><span>社区安保</span></h2>
                    <div class="pricing-table">
                        <div class="row">
                            <asp:ListView ID="ListView2" runat="server" ItemPlaceholderID="itemholder" DataSourceID="SqlDataSource4">
                                <LayoutTemplate>
                                    <div id="itemholder" class="panel panel-primary" runat="server"></div>
                                </LayoutTemplate>
                                <ItemTemplate>
                                    <div class="col-md-3 col-sm-6">
                                        <div class="panel panel-primary">
                                            <header class="panel-heading">
                                                <h3><%#Eval("地点") %></h3>
                                            </header>
                                            <div class="panel-body">
                                                <table class="table">
                                                    <tbody>
                                                        <tr class="active">
                                                            <td>负责人：<%#Eval("负责人")%></td>
                                                        </tr>
                                                        <tr class="active">
                                                            <td>是否有监控：<%#Eval("是否有监控")%></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:ListView>
                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:communityConnectionString %>" SelectCommand="SELECT * FROM [zhian]"></asp:SqlDataSource>
                        </div>
                    </div>
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
            //$(".poster-main").Carousel("init");

            $(".poster-main").Carousel({
                "width": 800,
                "height": 260,
                "posterWidth": 450,
                "posterHeight": 252,
                "scale": 0.85,
                "speed": 1000,
                "autoPlay": true,
                "delay": 1500,
                "verticalAlign": "middle"
            });
        </script>
    </form>
</body>
</html>
