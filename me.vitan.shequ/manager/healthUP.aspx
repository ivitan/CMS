<%@ Page Title="" Language="C#" MasterPageFile="manager.Master" AutoEventWireup="true" CodeBehind="healthUP.aspx.cs" Inherits="me.vitan.shequ.healthUP" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="/lib/jquery/jquery.js"></script>
    <title>修改信息</title>
    <style>
        .tupian {
            width: 130px;
            height: 160px;
            border: 1px solid #99cccc;
            margin: 10px;
        }
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#ContentPlaceHolder1_photo").change(function () {
                var url = "/images/";
                $("#ContentPlaceHolder1_Image1").attr("src", url + $(this).val());
            });
            $("#ContentPlaceHolder1_Button1").click(function () {
                var sextext = $("#ContentPlaceHolder1_DropDownList1").find("option:selected").text();
                if (sextext == "—请选择性别—")
                    alert("尚未选择性别");
                var depttext = $("#ContentPlaceHolder1_DropDownList3").find("option:selected").text();
                if (depttext == "—请选择系别—")
                    alert("尚未选择所在系");
                var phototext = $("#ContentPlaceHolder1_photo").find("option:selected").text();
                if (phototext == "")
                    alert("尚未选择照片");
            });
        });
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#ContentPlaceHolder1_FileUpload1").val(""); //防止后退键重复提交
        });
        function checkSize(obj_file) {
            var _size = obj_file.files[0].size; //获取上传文件大小
            if (_size > 8000000) {
                alert("超过8M"); //限制上传文件大小
                $(obj_file).focus();
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="main-content">
        <section class="wrapper">
            <h3><i class="fa fa-angle-right"></i>修改信息</h3>
            <div class="row">
                <div class="col-md-12">
                    <div class="content-panel">
                        <h4><i class="fa fa-angle-right">
                            <asp:Label ID="Label1" runat="server" Text=""></asp:Label></i></h4>
                        <table class="tabls table-condensed table-hover" style="margin-left: 30%; padding: 10px;">
                            <tr>
                                <td>
                                    <asp:FileUpload ID="FileUpload1" runat="server" Width="243px" onchange="checkSize(this)" /></td>
                                <td>
                                    <asp:Button ID="Button2" runat="server" Text="上传" Style="height: 27px" CssClass="btn btn-success" OnClick="Button2_Click" /></td>
                                <td>
                                    <asp:Label ID="Label2" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:ListBox ID="photo" runat="server" Rows="8" Width="130px" Height="160px"></asp:ListBox>
                                </td>
                                <td>
                                    <asp:Image ID="Image1" runat="server" CssClass="tupian" />
                                </td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>姓名：</td>
                                <td>
                                    <asp:TextBox ID="name" runat="server" CssClass="input"></asp:TextBox>
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>性别：</td>
                                <td>
                                    <asp:DropDownList ID="DropDownList1" runat="server">
                                        <asp:ListItem Value="weixuanze">—请选择性别—</asp:ListItem>
                                        <asp:ListItem Value="男" Selected="True">男</asp:ListItem>
                                        <asp:ListItem Value="女">女</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>年龄：</td>
                                <td>
                                    <asp:TextBox ID="age" runat="server" CssClass="input"></asp:TextBox>
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>健康状况：</td>
                                <td>
                                    <asp:TextBox ID="hea" runat="server" CssClass="input"></asp:TextBox>
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>联系方式：</td>
                                <td>
                                    <asp:TextBox ID="phone" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Button ID="Button1" runat="server" Text="修改" CssClass="btn btn-primary" OnClick="Button1_Click" />
                                </td>
                                <td>
                                    <asp:Button ID="Button3" runat="server" Text="删除" CssClass="btn btn-success" OnClick="Button3_Click" />
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div style="clear: both; padding: 10px;">
                    </div>
                </div>
            </div>
        </section>
    </section>
</asp:Content>
