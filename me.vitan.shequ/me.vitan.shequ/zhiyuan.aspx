<%@ Page Title="" Language="C#" MasterPageFile="~/manager.Master" AutoEventWireup="true" CodeBehind="zhiyuan.aspx.cs" Inherits="me.vitan.shequ.zhiyuan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>志愿者管理</title>
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
            height: 400px;
            width: 280px;
            background: #bdc3c7;
            border-radius: 7px;
            border: 1px solid #3df44c;
            margin: 8px 8px
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
            <h3><i class="fa fa-angle-right"></i>志愿者管理</h3>
            <div class="row">
                <div class="col-md-12">
                    <div class="content-panel" style="height: auto">
                        <h4><i class="fa fa-angle-right"></i>志愿者管理</h4>
                        <hr />
                        <div style="margin-left: 10%">
                            <asp:DataList ID="DataList1" runat="server" OnItemCommand="DataList1_ItemCommand" RepeatColumns="3" OnEditCommand="DataList1_EditCommand" OnUpdateCommand="DataList1_UpdateCommand" OnCancelCommand="DataList1_CancelCommand" OnDeleteCommand="DataList1_DeleteCommand"
                                RepeatDirection="Horizontal" CssClass="tables" DataKeyNames="序号">
                                <ItemTemplate>
                                    <div class="div_item" runat="server">
                                        <div class="fl">
                                            <h2><%#Eval("姓名") %></h2>
                                            <p>性别：<%#Eval("性别")%></p>
                                            <p>出生年月：<%#Eval("出生年月")%></p>
                                            <p>籍贯: <%#Eval("籍贯")%></p>
                                            <p>学历: <%#Eval("学历")%></p>
                                            <p>婚姻状况: <%#Eval("婚姻状况")%></p>
                                            <p>政治面貌: <%#Eval("政治面貌")%></p>
                                            <p>健康状况: <%#Eval("健康状况")%></p>
                                            <p>联系电话: <%#Eval("联系电话")%></p>
                                            <p>邮箱: <%#Eval("邮箱")%></p>
                                            <br />
                                            <asp:Button ID="lbtnEdit" runat="server" Text="更新" CommandName="edit" ForeColor="Red" CssClass="btn"></asp:Button>
                                            <asp:Button ID="btn_delete" runat="server" Text="删除" CommandName="delete" OnClientClick="return confirm('确定删除吗？')" CssClass="btn" />
                                        </div>
                                    </div>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <div class="div_item" runat="server">
                                        <div class="fl">
                                            <h2>
                                                <asp:TextBox ID="TextBox1" Text='<%#Eval("姓名") %>' runat="server"></asp:TextBox></h2>
                                            <p>性别：<asp:TextBox ID="TextBox2" Text='<%#Eval("性别")%>' runat="server"></asp:TextBox></p>
                                            <p>出生年月：<asp:TextBox ID="TextBox3" Text='<%#Eval("出生年月")%>' runat="server"></asp:TextBox></p>
                                            <p>籍贯:<asp:TextBox ID="TextBox4" Text='<%#Eval("籍贯")%>' runat="server"></asp:TextBox></p>
                                            <p>学历:<asp:TextBox ID="TextBox5" Text='<%#Eval("学历")%>' runat="server"></asp:TextBox></p>
                                            <p>婚姻状况:<asp:TextBox ID="TextBox6" Text='<%#Eval("婚姻状况")%>' runat="server"></asp:TextBox></p>
                                            <p>政治面貌:<asp:TextBox ID="TextBox7" Text='<%#Eval("政治面貌")%>' runat="server"></asp:TextBox></p>
                                            <p>健康状况:<asp:TextBox ID="TextBox8" Text='<%#Eval("健康状况")%>' runat="server"></asp:TextBox></p>
                                            <p>联系电话:<asp:TextBox ID="TextBox9" Text='<%#Eval("联系电话")%>' runat="server"></asp:TextBox></p>
                                            <p>邮箱:<asp:TextBox ID="TextBox10" Text='<%#Eval("邮箱")%>' runat="server"></asp:TextBox></p>
                                            <br />
                                            <asp:Button ID="lbtnupdate" runat="server" Text="更新" CommandName="update" CssClass="btn" ></asp:Button>
                                            <asp:Button ID="lbtnCancel" runat="server" Text="取消" CommandName="cancel" CssClass="btn" ></asp:Button> 
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
                                    <asp:Button ID="Button1" runat="server" CommandName="search" Text="GO" Height="30px" CssClass="btn" />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtPage" ErrorMessage="请输入数字（除了数值0）" ValidationExpression="[1-9]+(\d)*"></asp:RegularExpressionValidator>
                                    <br>
                                </FooterTemplate>
                            </asp:DataList>
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
                        <table class="table" style="margin-left: 20%">
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
                                    <td>出生年月：</td>
                                    <td>
                                        <asp:TextBox ID="cs" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>籍贯：</td>
                                    <td>
                                        <asp:TextBox ID="jg" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>

                                    <td>学历：</td>
                                    <td>
                                        <asp:TextBox ID="xl" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>婚姻状况：</td>
                                    <td>
                                        <asp:TextBox ID="hy" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>政治面貌：</td>
                                    <td>
                                        <asp:TextBox ID="zz" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>健康状况：</td>
                                    <td>
                                        <asp:TextBox ID="jk" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>联系电话：</td>
                                    <td>
                                        <asp:TextBox ID="dh" runat="server"></asp:TextBox>
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
                                        <asp:Button ID="Button3" runat="server" Text="添加" CssClass="btn" OnClick="Button3_Click"></asp:Button>
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
