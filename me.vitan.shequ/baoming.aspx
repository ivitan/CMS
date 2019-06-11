<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="baoming.aspx.cs" Inherits="me.vitan.shequ.baoming" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>活动报名中心</title>
    <link href="css/template.css" rel="stylesheet" />
    <link href="css/index.css" rel="stylesheet" />
    <link href="lib/bootstrap.min.css" rel="stylesheet" />
    <link href="lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
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
        <section id="main-content">
            <section class="wrapper" style="margin-left: -10%">
                <!-- row -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="content-panel" style="height: auto">
                            <h4><i class="fa fa-angle-right"></i>活动报名</h4>
                            <hr />
                            <table class="tabls table-condensed table-hover" style="margin-left: 35%">
                                <tr>
                                    <td class="tableleft">报名人</td>
                                    <td>
                                        <asp:TextBox ID="peo" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="tableleft">活动名称</td>
                                    <td>
                                        <asp:TextBox ID="hd" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="tableleft">联系方式</td>
                                    <td>
                                        <asp:TextBox ID="phone" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="tableleft"></td>
                                    <td>
                                        <asp:Button ID="Button1" runat="server" Text="报名" class="btn btn-primary" OnClick="Button1_Click" />&nbsp;&nbsp;
                                    <button type="button" class="btn btn-success" name="backid" id="backid2">返回</button>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </section>
        </section>

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
    </form>
</body>
</html>
