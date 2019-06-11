<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="me.vitan.shequ.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="shortcut icon" href="favicon.ico" />
    <link href="css/login.css" rel="stylesheet" />
    <script src="lib/jquery/jquery.js" type="text/javascript"></script>
    <title>Login</title>
    <script type="text/javascript">
        function changeCode() {
            var imgNode = document.getElementById("Image1");
            imgNode.src = "Handler.ashx?t=" + (new Date()).valueOf();  // 这里加个时间的参数是为了防止浏览器缓存的问题   
        }
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#email").blur(function () {
                if ($("#email").val() == "") {
                    alert("邮箱不能为空");
                    return false;
                }
                var email = $("#email").val();
                if (!email.match(/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/)) {
                    alert("邮箱格式不正确！请重新输入");
                    $(this).val("");
                    return false;
                }
            });
        });
    </script>
</head>
<body>
    <div class="login-box">
        <form id="form1" class="login-form" runat="server">
            <table border="0">
                <tr>
                    <td>
                        <h1>Welcome</h1>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox class="txtb" ID="email" runat="server" type="text" placeholder="请输入账号"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox class="txtb" ID="pw" runat="server" type="password" placeholder="请输入密码"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="yzm" runat="server" type="text" placeholder="输入验证码"></asp:TextBox></td>
                    <td>
                        <asp:Image ID="Image1" runat="server" AlternateText="验证码图片" ImageUrl="Handler.ashx" Width="110px" Height="38px" onclick="changeCode()" /></td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="btn" runat="server" Text="Login" OnClick="btn_Click" /></td>
                </tr>
            </table>
            <a href="register.aspx" style="font-size: 14px; color:white">新用户注册</a>
        </form>
    </div>
</body>
</html>
