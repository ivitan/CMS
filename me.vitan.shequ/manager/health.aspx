<%@ Page Title="" Language="C#" MasterPageFile="manager.Master" AutoEventWireup="true"
    CodeBehind="health.aspx.cs" Inherits="me.vitan.shequ.health" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/css/health.css" rel="stylesheet" type="text/css" />
    <script src="../lib/search.js"></script>
    <title>健康管理</title>
    <style>
        .suggest_link {
            background-color: #fff;
            padding: 2px 6px 2px 6px;
        }

        .suggest_link_over {
            background: #e8e2fe;
            padding: 2px 6px 2px 6px;
        }

        #search_suggest {
            position: absolute;
            background-color: #ffffff;
            text-align: left;
            border: 1px solid #000000;
            width: 200px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="main-content">
        <section class="wrapper">
            <h3><i class="fa fa-angle-right"></i>查询</h3>
            <div class="row">
                <div class="col-md-12">
                    <div class="content-panel" style="height: 400px">
                        <h4><i class="fa fa-angle-right"></i>结果</h4>
                        <hr />
                        <div style="margin-left: 40%; margin-bottom: 30px">
                            <br />
                            <asp:TextBox type="text" size="35" Width="200" autocomplete="off" ID="txtSearch" name="txtSearch" onkeyup='searchSuggest(this);' runat="server" CssClass="input"></asp:TextBox><input type="submit" value="搜 索" onclick="return search1();" class="btn btn-primary" />
                            <div id="search_suggest" style="display: none"></div>
                        </div>
                        <asp:ListView ID="ListView1" runat="server" ItemPlaceholderID="itemholder" DataSourceID="SqlDataSource1">
                            <LayoutTemplate>
                                <div id="itemholder" runat="server"></div>
                            </LayoutTemplate>
                            <ItemTemplate>
                                <div class="item" id="a1" runat="server">
                                    <img alt="" src='<%#Eval("img","/images/{0}") %>' />
                                    <div class="itemfl">
                                        <br />
                                        <h3><%#Eval("name") %></h3>
                                        <p>年龄：<%#Eval("age")%></p>
                                        <p>性别：<%#Eval("sex")%></p>
                                        <p>健康状况：<%#Eval("health") %></p>
                                        <p>联系电话：<%#Eval("phone") %></p>
                                        <a href='/manager/healthUp.aspx?id=<%#Eval("id") %>&name=<%#Eval("name") %>' style="text-decoration: none; font-size: 14px; color: Red; margin-left: auto">修改信息</a>
                                    </div>
                                    <div class="clr"></div>
                                </div>
                            </ItemTemplate>
                        </asp:ListView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:communityConnectionString %>" SelectCommand="SELECT * FROM [health] WHERE (([name] LIKE '%' + @name + '%') OR ([health] LIKE '%' + @health + '%'))">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="txtSearch" Name="name" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="txtSearch" Name="health" PropertyName="Text" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>
                <script>
                    function search1() {
                        if (document.search.txtSearch.value == "") {
                            alert('请输入你要查询的内容');
                            document.search.txtSearch.focus();
                            return false;
                        }
                    }
                </script>
            </div>
            <!-- row -->
            <h3><i class="fa fa-angle-right"></i>添加</h3>
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
                                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>年龄：</td>
                                    <td>
                                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>健康状况：</td>
                                    <td>
                                        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>性别：</td>
                                    <td>
                                        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>

                                    <td>电话：</td>
                                    <td>
                                        <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Button ID="Button3" runat="server" Text="添加" OnClick="Button3_Click" CssClass="btn btn-primary"></asp:Button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-- row -->
            <h3><i class="fa fa-angle-right"></i>所有</h3>
            <div class="row">
                <div class="col-md-12">
                    <div class="content-panel">
                        <h4><i class="fa fa-angle-right"></i>信息</h4>
                        <hr />
                        <div style="margin-left: -10%">
                            <asp:DataList ID="DataList1" runat="server"
                                OnItemCommand="DataList1_ItemCommand" RepeatColumns="3" OnItemDataBound="DataList1_ItemDataBound"
                                RepeatDirection="Horizontal" CssClass="">
                                <ItemTemplate>
                                    <div class="all_query">
                                        <div class="div_item" runat="server">
                                            <img alt="" src='<%#Eval("img","/images/{0}") %>' />
                                            <div class="fl">
                                                <h3><%#Eval("name") %></h3>
                                                <p>性别：<%#Eval("sex") %></p>
                                                <p>年龄：<%#Eval("age")%></p>
                                                <p>健康状况：<%#Eval("health")%></p>
                                                <p>联系方式:<%#Eval("phone") %></p>
                                                <a href='/manager/healthUp.aspx?id=<%#Eval("id") %>&name=<%#Eval("name") %>' style="text-decoration: none; font-size: 14px; color: Red; margin-left: auto">修改信息</a>
                                            </div>
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
                                    <asp:Button ID="Button1" runat="server" CommandName="search" Text="GO" Height="30px" CssClass="btn" />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtPage" ErrorMessage="请输入数字（除了数值0）" ValidationExpression="[1-9]+(\d)*"></asp:RegularExpressionValidator>
                                    <br>
                                </FooterTemplate>
                            </asp:DataList>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </section>
</asp:Content>
