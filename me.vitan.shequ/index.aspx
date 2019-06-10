﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="me.vitan.shequ.index" %>

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

        .fl {
            float: left;
            margin-left: 5px;
        }

        .fr {
            float: left;
            margin-left: 30px;
        }

        .div_item {
            border-bottom: 1px dashed #ededed;
            margin-bottom: 10px;
            padding: 5px;
            height: 200px;
            width: 280px;
            background: #f3f4f5;
            border-radius: 7px;
            box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.26);
            margin: 8px 8px
        }

            .div_item:hover {
                background-color: #e8e8e8;
                border-radius: 5px;
            }

            .div_item h3 {
                font-family: "微软雅黑";
                font-size: 16px;
                color: #f40;
                letter-spacing: 2px;
                margin: 0px 0px 10px 0px;
            }

            .div_item p {
                text-align: left;
                font-size: 12px;
                color: #050000;
                margin: 5px 5px !important;
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
            <section class="carousel slide section-slide carousel-inner">
                <div class="pb-carouselWarp lunbo">
                    <ul class="pb-carousel">
                        <li class="pb-this">
                            <img src="images/1.jpg" alt="" /></li>
                        <li>
                            <img src="images/2.jpg" alt="" /></li>
                        <li>
                            <img src="images/3.jpg" alt="" /></li>
                        <li>
                            <img src="images/4.jpg" alt="" /></li>
                        <li>
                            <img src="images/5.jpg" alt="" /></li>
                    </ul>
                    <ul class="pb-carousel-ind">
                        <li class="pb-this"></li>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                    </ul>
                    <button class="pb-arrow pb-arrow-prev"></button>
                    <button class="pb-arrow pb-arrow-next" id="aa"></button>
                </div>
            </section>

            <section id="features" class="section section-portfolio">
                <div class="container">
                    <h2 class="section-title"><span>近期活动</span></h2>
                    <div class="row">
                        <div style="margin-left: 10%">
                            <asp:DataList ID="DataList1" runat="server" OnItemCommand="DataList1_ItemCommand" RepeatColumns="3"
                                RepeatDirection="Horizontal" CssClass="tables table-condensed table-hover" DataKeyNames="序号">
                                <ItemTemplate>
                                    <div class="div_item" runat="server">
                                        <div class="fl">
                                            <br />
                                            <h3><%#Eval("主题") %></h3>
                                            <p>活动时间：<%#Eval("活动时间")%></p>
                                            <p>活动地点：<%#Eval("活动地点")%></p>
                                            <p>面向对象：<%#Eval("面向对象")%></p>
                                            <p>活动内容: <%#Eval("活动内容")%></p>
                                            <p>备注: <%#Eval("备注")%></p>
                                            <br />
                                        </div>
                                    </div>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <br />
                                    共有<asp:Label ID="labCount" runat="server" ForeColor="#FF3300" Width="12px" />页
                   当前<asp:Label ID="labNowPage" runat="server" ForeColor="Brown">1</asp:Label>页
                    <asp:LinkButton ID="lnkbtnFirst" runat="server" CommandName="first" Font-Underline="False" ForeColor="Black" Width="43px">首页</asp:LinkButton>
                                    <asp:LinkButton ID="lnkbtnFront" runat="server" CommandName="pre" Font-Underline="False" ForeColor="Black" Width="62px">上一页</asp:LinkButton>
                                    <asp:LinkButton ID="lnkbtnNext" runat="server" CommandName="next" Font-Underline="False" ForeColor="Black" Width="61px">下一页</asp:LinkButton>
                                    <asp:LinkButton ID="lnkbtnLast" runat="server" Font-Overline="False" CommandName="last" Font-Underline="False" ForeColor="Black" Width="38px">尾页</asp:LinkButton>
                                    跳转至：<asp:TextBox ID="txtPage" runat="server" Width="25px" Height="21px"></asp:TextBox>
                                    <asp:Button ID="Button1" runat="server" CommandName="search" Text="GO" Height="30px" CssClass="btn btn-success" />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtPage" ErrorMessage="请输入数字（除了数值0）" ValidationExpression="[1-9]+(\d)*"></asp:RegularExpressionValidator>
                                    <br>
                                </FooterTemplate>
                            </asp:DataList>
                        </div>
                    </div>
                </div>
            </section>

            <section class="section section-portfolio">
                <div class="container">
                    <h2 class="section-title"><span>重要公告</span></h2>
                    <div class="entry-thumbnail">
                        <asp:ListView ID="lv_newsDetail" runat="server" DataSourceID="SqlDataSource2" ItemPlaceholderID="news_holder">
                            <LayoutTemplate>
                                <div runat="server" id="news_holder">
                                </div>
                            </LayoutTemplate>
                            <ItemTemplate>
                                <h3 id="NewsTTL">
                                    <a href="news.aspx?id=<%#Eval("id") %>">
                                        <%#Eval("title") %></a></h3>
                            </ItemTemplate>
                        </asp:ListView>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:communityConnectionString %>" SelectCommand="SELECT [id], [title] FROM [tongzhi]"></asp:SqlDataSource>
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
            </section>
            <section class="section section-portfolio">
                <div class="container">
                    <h2 class="section-title"><span>社区安保</span></h2>
                    <div style="margin-left: 3%">
                        <div>
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="序号" DataSourceID="SqlDataSource1" CssClass="table tab-content table-hover">
                                <Columns>
                                    <asp:BoundField DataField="地点" HeaderText="地点" SortExpression="地点" />
                                    <asp:BoundField DataField="负责人" HeaderText="负责人" SortExpression="负责人" />
                                    <asp:BoundField DataField="是否有监控" HeaderText="是否有监控" SortExpression="是否有监控" />
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:communityConnectionString %>" SelectCommand="SELECT * FROM [zhian]"></asp:SqlDataSource>
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
            $(document).ready(function () {
                carousel(
                    $('.lunbo'),	//必选， 要轮播模块(id/class/tagname均可)，必须为jQuery元素
                    {
                        type: 'leftright',	//可选，默认左右(leftright) - 'leftright' / 'updown' / 'fade' (左右/上下/渐隐渐现)
                        arrowtype: 'move',	//可选，默认一直显示 - 'move' / 'none'	(鼠标移上显示 / 不显示 )
                        autoplay: true,	//可选，默认true - true / false (开启轮播/关闭轮播)
                        time: 3000	//可选，默认3000
                    }
                );
            });
        </script>
    </form>

</body>

</html>