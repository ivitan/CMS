<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="me.vitan.shequ.register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="save" content="history" />
    <title>注册</title>
    <link href="css/register.css" rel="stylesheet" type="text/css" />
    <script src="lib/jquery/jquery.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("form").val(""); //防止后退键重复提交
            //如果是必填的，则加红星标识.
            $(".required").each(function () {
                var required = $("<strong class='high'> *</strong>"); //创建元素
                $(this).parent().append(required); //然后将它追加到文档中
            });
            //文本框失去焦点后
            $('form :input').blur(function () {
                var $parent = $(this).parent();
                $parent.find(".formtips").remove();
                //验证用户名
                if ($(this).is('#TBusername')) {
                    if (this.value == "" || this.value.length < 6) {
                        var errorMsg = '至少6位的用户名.';
                        $parent.append('<span class="formtips onError">' + errorMsg + '</span>');
                    } else {
                        var okMsg = '用户名格式正确.';
                        $parent.append('<span class="formtips onSuccess">' + okMsg + '</span>');
                    }
                }

                if ($(this).is('#userPhone')) {
                    var myreg = /^(((13[0-9]{1})|(14[0-9]{1})|(17[0-9]{1})|(15[0-3]{1})|(15[5-9]{1})|(18[0-9]{1}))+\d{8})$/;
                    if (this.value == "" || (this.value != "" && !myreg.test(this.value))) {
                        var errorMsg = '请输入正确的手机号.';
                        $parent.append('<span class="formtips onError">' + errorMsg + '</span>');
                    } else {
                        var okMsg = '格式输入正确.';
                        $parent.append('<span class="formtips onSuccess">' + okMsg + '</span>');
                    }
                }

                //验证邮件
                if ($(this).is('#TBemail')) {
                    var reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
                    if (this.value == "" || (this.value != "" && !reg.test(this.value))) {
                        var errorMsg = '请输入正确的邮箱地址.';
                        $parent.append('<span class="formtips onError">' + errorMsg + '</span>');
                    } else {
                        var okMsg = '格式输入正确.';
                        $parent.append('<span class="formtips onSuccess">' + okMsg + '</span>');
                    }
                }

                if ($(this).is('#TBrepassword')) {
                    if (this.value != $('#TBpassword').value) {
                        var errorMsg = '两次密码不一致';
                        $parent.append('<span class="formtips onError">' + errorMsg + '</span>');
                    } else {
                        this.remove("$parent");
                        var okMsg = '两次密码一致.';
                        $parent.append('<span class="formtips onSuccess">' + okMsg + '</span>');
                    }
                }

            }).keyup(function () {
                $(this).triggerHandler("blur");
            }).focus(function () {
                $(this).triggerHandler("blur");
            }); //end blur

            //重置
            $('#res').click(function () {
                $(".formtips").remove();
            });
        })
    </script>
</head>
<body onload="document.forms[0].reset()">
    <div class="container">
        <div class="register-box">
            <div class="title-box">
                <span>用户注册</span>
            </div>
            <div class="main">
                <form method="post" runat="server" autocomplete="off">
                    <div class="username-box">
                        <span class="require">*</span>
                        <label for="username">设置账号</label>
                        <asp:TextBox ID="TBusername" runat="server" CssClass="input"></asp:TextBox>
                    </div>

                    <div class="userPassword-box">
                        <span class="require">*</span>
                        <label for="userPassword">设置密码</label>
                        <asp:TextBox ID="TBpassword" runat="server" type="password" CssClass="input"></asp:TextBox>
                    </div>

                    <div class="userRePassword-box">
                        <span class="require">*</span>
                        <label for="userRePassword">确认密码</label>
                        <asp:TextBox ID="TBrepassword" runat="server" type="password" CssClass="input"></asp:TextBox>
                    </div>

                    <div class="userPhone-box">
                        <span class="require">&nbsp</span>
                        <label for="userPhone">手机号码</label>
                        <asp:TextBox ID="userPhone" runat="server" CssClass="input"></asp:TextBox>
                    </div>

                    <div class="userEmail-box">
                        <span class="require">*</span>
                        <label for="userEmail">电子邮箱</label>
                        <asp:TextBox ID="TBemail" runat="server" CssClass="input"></asp:TextBox>
                    </div>
                    <div class="submit-box">
                        <asp:Button ID="send" runat="server" Text="注册" CssClass="btn" OnClick="send_Click" />
                    </div>
                    <div class="goLogin-box">
                        <input type="reset" value="重置"class="btn" id="res" />
                    </div>
                </form>
                <script type="text/javascript">
                    $('#res').click(function () {
                        $(".formtips").remove();
                    });
                </script>
            </div>
        </div>
    </div>
</body>
</html>

