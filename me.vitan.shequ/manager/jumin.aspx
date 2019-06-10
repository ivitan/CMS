﻿<%@ Page Title="" Language="C#" MasterPageFile="manager.Master" AutoEventWireup="true" CodeBehind="jumin.aspx.cs" Inherits="me.vitan.shequ.jumin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>居民档案管理</title>
        <style>
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
            padding: 5px;
            height: 331px;
            width: 280px;
            background: #f3f4f5;
            border-radius: 7px;
            margin:8px 8px;
            box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.26);
        }

            .div_item:hover {
                background-color: #e8e8e8;
                border-radius: 5px;
            }

            .div_item h2 {
                font-family: "微软雅黑";
                font-size: 16px;
                color: #992668;
                letter-spacing: 2px;
                margin: 0px 0px 10px 0px;
            }

            .div_item p {
                font-size: 12px;
                color: #000000;
                margin: 0px 0px 10px 0px;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <section id="main-content">
        <section class="wrapper">
            <!-- row -->
            <h3><i class="fa fa-angle-right"></i>居民档案管理</h3>
            <div class="row">
                <div class="col-md-12">
                    <div class="content-panel" style="height:auto">
                        <h4><i class="fa fa-angle-right"></i>居民档案管理</h4>
                        <hr />
                        <div style="margin-left: 3%">
                            <div style="margin-left: 8%">
                                <asp:DataList ID="DataList1" runat="server" OnItemCommand="DataList1_ItemCommand" RepeatColumns="3" OnEditCommand="DataList1_EditCommand" OnUpdateCommand="DataList1_UpdateCommand" OnCancelCommand="DataList1_CancelCommand" OnDeleteCommand="DataList1_DeleteCommand"
                                RepeatDirection="Horizontal" CssClass="tables" DataKeyNames="序号">
                                    <itemtemplate>
                                        <div class="div_item" runat="server">
                                            <div class="fl">
                                                <br />
                                                <h2><%#Eval("姓名") %></h2>
                                                <p>性别：<%#Eval("性别")%></p>
                                                <p>年龄：<%#Eval("年龄")%></p>
                                                <p>身份证号码：<%#Eval("身份证号码")%></p>
                                                <p>联系方式: <%#Eval("联系方式")%></p>
                                                <p>家庭住址: <%#Eval("家庭住址")%></p>
                                                <p>是否签约: <%#Eval("是否签约")%></p>
                                                <p>是否贫困: <%#Eval("是否贫困")%></p>
                                                <br />
                                            <asp:Button ID="lbtnEdit" runat="server" Text="更新" CommandName="edit" CssClass="btn btn-success"></asp:Button>
                                            <asp:Button ID="btn_delete" runat="server" Text="删除" CommandName="delete" OnClientClick="return confirm('确定删除吗？')" CssClass="btn btn-primary" />
                                            </div>
                                        </div>
                                    </itemtemplate>
                                    <EditItemTemplate>
                                    <div class="div_item" runat="server">
                                        <div class="fl">
                                            <p>姓名：<asp:TextBox ID="TextBox1" Text='<%#Eval("姓名") %>' runat="server"></asp:TextBox></p>
                                            <p>性别：<asp:TextBox ID="TextBox2" Text='<%#Eval("性别")%>' runat="server"></asp:TextBox></p>
                                            <p>身份证号码：<asp:TextBox ID="TextBox3" Text='<%#Eval("身份证号码")%>' runat="server"></asp:TextBox></p>
                                            <p>联系方式:<asp:TextBox ID="TextBox4" Text='<%#Eval("联系方式")%>' runat="server"></asp:TextBox></p>
                                            <p>家庭住址:<asp:TextBox ID="TextBox5" Text='<%#Eval("家庭住址")%>' runat="server"></asp:TextBox></p>
                                            <p>是否签约:<asp:TextBox ID="TextBox6" Text='<%#Eval("是否签约")%>' runat="server"></asp:TextBox></p>
                                            <p>是否贫困:<asp:TextBox ID="TextBox7" Text='<%#Eval("是否贫困")%>' runat="server"></asp:TextBox></p>
                                            <p>年龄:<asp:TextBox ID="TextBox8" Text='<%#Eval("年龄")%>' runat="server"></asp:TextBox></p>
                                            <br />
                                            <asp:Button ID="lbtnupdate" runat="server" Text="更新" CommandName="update" CssClass="btn btn-success" ></asp:Button>
                                            <asp:Button ID="lbtnCancel" runat="server" Text="取消" CommandName="cancel" CssClass="btn btn-primary" ></asp:Button> 
                                        </div>
                                    </div>
                                </EditItemTemplate>
                                    <footertemplate>
                                        <br />
                                        共有<asp:Label ID="labCount" runat="server" ForeColor="#FF3300" Width="12px" />页
                   当前<asp:Label ID="labNowPage" runat="server" ForeColor="Brown">1</asp:Label>页
                    <asp:LinkButton ID="lnkbtnFirst" runat="server" CommandName="first" Font-Underline="False" ForeColor="Black" Width="43px">首页</asp:LinkButton>
                                        <asp:LinkButton ID="lnkbtnFront" runat="server" CommandName="pre" Font-Underline="False" ForeColor="Black" Width="62px">上一页</asp:LinkButton>
                                        <asp:LinkButton ID="lnkbtnNext" runat="server" CommandName="next" Font-Underline="False" ForeColor="Black" Width="61px">下一页</asp:LinkButton>
                                        <asp:LinkButton ID="lnkbtnLast" runat="server" Font-Overline="False" CommandName="last" Font-Underline="False" ForeColor="Black" Width="38px">尾页</asp:LinkButton>
                                        跳转至：<asp:TextBox ID="txtPage" runat="server" Width="25px" Height="21px"></asp:TextBox>
                                        <asp:Button ID="Button1" runat="server" CommandName="search" Text="GO" Height="30px" CssClass="btn" />
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtPage" ErrorMessage="请输入数字（除了数值0）" ValidationExpression="[1-9]+(\d)*"></asp:RegularExpressionValidator>
                                        <br>
                                    </footertemplate>
                                </asp:DataList>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- row -->
            <h3><i class="fa fa-angle-right"></i>添加信息</h3>
            <div class="row">
                <div class="col-md-12">
                    <div class="content-panel">
                        <h4><i class="fa fa-angle-right"></i>添加信息</h4>
                        <hr />
                        <table class="tabls table-condensed table-hover" style="margin-left: 35%">
                            <tbody>
                                <tr>
                                    <td>姓名：</td>
                                    <td>
                                        <asp:TextBox ID="xm" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>性别：</td>
                                    <td>
                                        <asp:TextBox ID="xb" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>年龄：</td>
                                    <td>
                                        <asp:TextBox ID="nl" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>身份证号码：</td>
                                    <td>
                                        <asp:TextBox ID="sf" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>

                                    <td>联系方式：</td>
                                    <td>
                                        <asp:TextBox ID="lx" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>家庭住址：</td>
                                    <td>
                                        <asp:TextBox ID="zz" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>是否签约：</td>
                                    <td>
                                        <asp:TextBox ID="qy" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>是否贫困：</td>
                                    <td>
                                        <asp:TextBox ID="pk" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>邮箱：</td>
                                    <td>
                                        <asp:TextBox ID="yx" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Button ID="Button3" runat="server" Text="添加" CssClass="btn btn-success" OnClick="Button3_Click"></asp:Button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </section>
    </section>
</asp:Content>