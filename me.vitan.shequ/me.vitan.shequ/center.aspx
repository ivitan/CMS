<%@ Page Title="" Language="C#" MasterPageFile="~/manager.Master" AutoEventWireup="true" CodeBehind="center.aspx.cs" Inherits="me.vitan.shequ.center" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="main-content">
        <section class="wrapper">
            <!-- row -->
            <h3><i class="fa fa-angle-right"></i>个人中心</h3>
            <div class="row">
                <div class="col-md-12">
                    <div class="content-panel" style="height: auto">
                        <h4><i class="fa fa-angle-right"></i>个人中心</h4>
                        <hr />
                        <table class="tabls table-condensed table-hover" style="margin-left:35%">
                            <tr>
                                <td class="tableleft">旧密码</td>
                                <td>
                                    <asp:TextBox ID="password" runat="server" TextMode="Password"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="tableleft">新密码</td>
                                <td>
                                    <asp:TextBox ID="newPassword" runat="server" TextMode="Password"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="tableleft"></td>
                                <td><asp:Button ID="Button1" runat="server" Text="保存" class="btn btn-primary" />&nbsp;&nbsp;
                                    <button type="button" class="btn btn-success" name="backid" id="backid">返回</button>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </section>
    </section>
</asp:Content>
