<%@ Page Title="" Language="C#" MasterPageFile="manager.Master" AutoEventWireup="true" CodeBehind="wenti.aspx.cs" Inherits="me.vitan.shequ.wenti" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>文体活动</title>
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
            margin-bottom: 10px;
            padding: 5px;
            height: 250px;
            width: 280px;
            background: #f3f4f5;
            border-radius: 7px;
            box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.26);
            margin:8px 8px
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
                font-size: 12px;
                color: #050000;
                margin: 0px 0px 10px 0px;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="main-content">
        <section class="wrapper">
            <!-- row -->
            <h3><i class="fa fa-angle-right"></i>添加活动</h3>
            <div class="row">
                <div class="col-md-12">
                    <div class="content-panel">
                        <h4><i class="fa fa-angle-right"></i>添加信息</h4>
                        <hr />
                        <table class="tabls table-condensed table-hover" style="margin-left:35%">
                            <tbody>
                                <tr>
                                    <td>主题：</td>
                                    <td>
                                        <asp:TextBox ID="zt" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>活动时间：</td>
                                    <td>
                                        <asp:TextBox ID="sj" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>面向对象：</td>
                                    <td>
                                        <asp:TextBox ID="dx" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>活动内容:：</td>
                                    <td>
                                        <asp:TextBox ID="nr" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>

                                    <td>地点：</td>
                                    <td>
                                        <asp:TextBox ID="dd" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>备注：</td>
                                    <td>
                                        <asp:TextBox ID="bz" runat="server"></asp:TextBox>
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

            <h3><i class="fa fa-angle-right"></i>文体活动</h3>
            <div class="row">
                <div class="col-md-12">
                    <div class="content-panel" style="height: auto">
                        <h4><i class="fa fa-angle-right"></i>近期文体活动</h4>
                        <hr />
                        <div style="margin-left: 10%">
                            <asp:DataList ID="DataList1" runat="server" OnItemCommand="DataList1_ItemCommand" RepeatColumns="3" OnEditCommand="DataList1_EditCommand" OnUpdateCommand="DataList1_UpdateCommand" OnCancelCommand="DataList1_CancelCommand" OnDeleteCommand="DataList1_DeleteCommand"
                                RepeatDirection="Horizontal" CssClass="tables" DataKeyNames="序号">
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
                                            <asp:Button ID="lbtnEdit" runat="server" Text="更新" CommandName="edit" CssClass="btn btn-primary"></asp:Button>
                                            <asp:Button ID="btn_delete" runat="server" Text="删除" CommandName="delete" OnClientClick="return confirm('确定删除吗？')" CssClass="btn btn-success" />
                                        </div>
                                    </div>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <div class="div_item" runat="server">
                                        <div class="fl">
                                            <p>主题:<asp:TextBox ID="TextBox1" Text='<%#Eval("主题")%>' runat="server"></asp:TextBox></p>
                                            <p>活动时间：<asp:TextBox ID="TextBox2" Text='<%#Eval("活动时间")%>' runat="server"></asp:TextBox></p>
                                            <p>面向对象：<asp:TextBox ID="TextBox3" Text='<%#Eval("面向对象")%>' runat="server"></asp:TextBox></p>
                                            <p>活动地点:<asp:TextBox ID="TextBox4" Text='<%#Eval("活动地点")%>' runat="server"></asp:TextBox></p>
                                            <p>活动内容: <asp:TextBox ID="TextBox5" Text='<%#Eval("活动内容")%>' runat="server"></asp:TextBox></p>
                                            <p>备注:<asp:TextBox ID="TextBox6" Text='<%#Eval("备注")%>' runat="server"></asp:TextBox></p
                                            <br />
                                           <asp:Button ID="lbtnupdate" runat="server" Text="更新" CommandName="update" CssClass="btn btn-success" ></asp:Button>
                                            <asp:Button ID="lbtnCancel" runat="server" Text="取消" CommandName="cancel" CssClass="btn btn-primary" ></asp:Button> 
                                        </div>
                                    </div>
                                </EditItemTemplate>
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
            </div>
        </section>
    </section>
</asp:Content>
