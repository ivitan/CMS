<%@ Page Title="" Language="C#" MasterPageFile="manager.Master" AutoEventWireup="true" CodeBehind="center.aspx.cs" Inherits="me.vitan.shequ.center" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>个人中心</title>
    <script src="/lib/jquery/jquery.js"></script>
    <link href="/css/style.css" rel="stylesheet" />
    <link href="/lib/bootstrap.min.css" rel="stylesheet" />
    <link href="/css/style-responsive.css" rel="stylesheet" />
    <script>
        $(document).ready(function () {
            $("#ContentPlaceHolder1_role").bind("click", function () {
                alert("暂时不支持修改身份。");
                $("#ContentPlaceHolder1_role").css("background-color", "rgb(208, 208, 208)");
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="main-content">
        <section class="wrapper">
            <!-- row -->
            <h3><i class="fa fa-angle-right"></i>个人中心</h3>
            <div class="row">
                <div class="col-md-12">
                    <div class="content-panel" style="height: auto">
                        <h4><i class="fa fa-angle-right"></i>修改密码</h4>
                        <hr />
                        <table class="tabls table-condensed table-hover" style="margin-left: 35%">
                            <tr>
                                <td>旧密码</td>
                                <td>
                                    <asp:TextBox ID="password" runat="server" TextMode="Password"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>新密码</td>
                                <td>
                                    <asp:TextBox ID="newPassword" runat="server" TextMode="Password"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <asp:Button ID="Button1" runat="server" Text="保存" class="btn btn-primary" OnClick="Button1_Click" />&nbsp;&nbsp;
                                    <button type="button" class="btn btn-success" name="backid" id="backid2">返回</button>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <h3><i class="fa fa-angle-right"></i>个人中心</h3>
            <div class="row">
                <div class="col-md-12">
                    <div class="content-panel" style="height: auto">
                        <h4><i class="fa fa-angle-right"></i>修改信息</h4>
                        <hr />
                        <table class="tables table-condensed table-hover" style="margin-left: 35%">
                            <tr>
                                <td class="tableleft">用户名</td>
                                <td>
                                    <asp:TextBox ID="username" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="tableleft">邮箱</td>
                                <td>
                                    <asp:TextBox ID="email" runat="server" ReadOnly="True"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="tableleft">身份</td>
                                <td>
                                    <asp:TextBox ID="role" runat="server" ReadOnly="True"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="tableleft">注册时间</td>
                                <td>
                                    <asp:TextBox ID="register_time" runat="server" ReadOnly="True"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="tableleft">头像</td>
                                <td>
                                    <asp:Image ID="avatarImg" runat="server" Height="70px" Width="70px" />
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td class="tableleft"></td>
                                <td>
                                    <asp:Button ID="Button2" runat="server" Text="保存" class="btn btn-primary" OnClick="Button2_Click" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <h3><i class="fa fa-angle-right"></i>个人中心</h3>
            <div class="row">
                <div class="col-md-12">
                    <div class="content-panel" style="height: auto">
                        <h4><i class="fa fa-angle-right"></i>修改头像</h4>
                        <hr />
                        <table class="tables table-condensed table-hover" style="margin-left: 35%">

                            <tr>
                                <td class="tableleft">头像</td>
                                <td>
                                    <asp:Image ID="pic" runat="server" Width="70px" Height="70px" />
                                    <br />
                                    <asp:FileUpload ID="pic_upload" runat="server" /><asp:Label ID="lbl_pic" runat="server" class="pic_text"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="tableleft"></td>
                                <td>
                                    <asp:Button ID="Button3" runat="server" Text="保存" class="btn btn-primary" OnClick="Button3_Click" />&nbsp;&nbsp;
                                    <button type="button" class="btn btn-success" name="backid" id="backid">返回</button>
                                </td>
                            </tr>
                            <tr>
                                <td class="tableleft"></td>
                                <td>备注：上传的图片,大小不能超过4M！</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <script>
                $(function () {
                    $('.btn-success').click(function () {
                        window.location.href = "health.aspx";
                    });
                });
            </script>
        </section>
    </section>
</asp:Content>
