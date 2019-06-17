<%@ Page Title="" Language="C#" MasterPageFile="manager.Master" AutoEventWireup="true" CodeBehind="canji.aspx.cs" Inherits="me.vitan.shequ.canji" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>残疾人管理</title>
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
            height: 420px;
            width: 280px;
            background: #f3f4f5;
            border-radius: 7px;
            margin: 8px 8px;
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
            <h3><i class="fa fa-angle-right"></i>残疾人管理</h3>
            <div class="row">
                <div class="col-md-12">
                    <div class="content-panel" style="height: auto">
                        <h4><i class="fa fa-angle-right"></i>残疾人管理</h4>
                        <hr />
                        <div style="margin-left: 10%">
                            <asp:DataList ID="DataList1" runat="server" OnItemCommand="DataList1_ItemCommand" RepeatColumns="3" OnEditCommand="DataList1_EditCommand" OnUpdateCommand="DataList1_UpdateCommand" OnCancelCommand="DataList1_CancelCommand" OnDeleteCommand="DataList1_DeleteCommand"
                                RepeatDirection="Horizontal" CssClass="tables" DataKeyNames="序号">
                                <ItemTemplate>
                                    <div class="div_item" runat="server">
                                        <div class="fl">
                                            <h2><%#Eval("姓名") %></h2>
                                            <p>性别:<%#Eval("性别")%></p>
                                            <p>民族:<%#Eval("民族")%></p>
                                            <p>性别:<%#Eval("性别")%></p>
                                            <p>婚姻状况:<%#Eval("婚否")%></p>
                                            <p>身份证号:<%#Eval("身份证号")%></p>
                                            <p>残疾等级:<%#Eval("残疾等级")%></p>
                                            <p>残疾证号:<%#Eval("残疾证号")%></p>
                                            <p>残疾类型:<%#Eval("残疾类型")%></p>
                                            <p>残疾等级:<%#Eval("残疾等级")%></p>
                                            <p>是否建立档案:<%#Eval("是否建立档案")%></p>
                                            <p>联系方式:<%#Eval("联系方式")%></p>
                                            <p>备注:<%#Eval("备注")%></p>
                                              <br />
                                            <asp:Button ID="lbtnEdit" runat="server" Text="更新" CommandName="edit" CssClass="btn btn-success"></asp:Button>
                                            <asp:Button ID="btn_delete" runat="server" Text="删除" CommandName="delete" OnClientClick="return confirm('确定删除吗？')" CssClass="btn btn-primary" />
                                        </div>
                                    </div>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <div class="div_item" runat="server">
                                        <div class="fl">
                                            <br />
                                            <p>姓   名:<asp:TextBox ID="TextBox1" Text='<%#Eval("姓名")%>' runat="server"></asp:TextBox></p>
                                            <p>民   族:<asp:TextBox ID="TextBox2" Text='<%#Eval("民族")%>' runat="server"></asp:TextBox></p>
                                            <p>性   别:<asp:TextBox ID="TextBox3" Text='<%#Eval("性别")%>' runat="server"></asp:TextBox></p>
                                            <p>婚姻状况:<asp:TextBox ID="TextBox4" Text='<%#Eval("婚否")%>' runat="server"></asp:TextBox></p>
                                            <p>身份证号:<asp:TextBox ID="TextBox5" Text='<%#Eval("身份证号")%>' runat="server"></asp:TextBox></p
                                            <p>残疾证号:<asp:TextBox ID="TextBox6" Text='<%#Eval("残疾证号")%>' runat="server"></asp:TextBox></p
                                            <p>残疾类型:<asp:TextBox ID="TextBox7" Text='<%#Eval("残疾类型")%>' runat="server"></asp:TextBox></p
                                            <p>残疾等级:<asp:TextBox ID="TextBox8" Text='<%#Eval("残疾等级")%>' runat="server"></asp:TextBox></p
                                            <p>是否建立档案:<asp:TextBox ID="TextBox9" Text='<%#Eval("是否建立档案")%>' runat="server"></asp:TextBox></p
                                            <p>联系方式:<asp:TextBox ID="TextBox10" Text='<%#Eval("联系方式")%>' runat="server"></asp:TextBox></p
                                            <p>备注:<asp:TextBox ID="TextBox11" Text='<%#Eval("备注")%>' runat="server"></asp:TextBox></p
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
            <!-- row -->
            <h3><i class="fa fa-angle-right"></i>添加信息</h3>
            <div class="row">
                <div class="col-md-12">
                    <div class="content-panel">
                        <h4><i class="fa fa-angle-right"></i>添加信息</h4>
                        <hr />
                        <table class="tablss table-condensed table-hover" style="margin-left: 30%;">
                            <tbody>
                                <tr>
                                    <td >姓名：</td>
                                    <td>
                                        <asp:TextBox ID="xm" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>性别：</td>
                                    <td>
                                        <asp:DropDownList ID="sex" runat="server" CssClass="selectpicker">
                                            <asp:ListItem>男</asp:ListItem>
                                            <asp:ListItem>女</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>民族：</td>
                                    <td>
                                        <asp:TextBox ID="mz" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>婚否：</td>
                                    <td>
                                        <asp:DropDownList ID="mar" runat="server" CssClass="selectpicker">
                                            <asp:ListItem>已婚</asp:ListItem>
                                            <asp:ListItem>未婚</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>

                                    <td>身份证号：</td>
                                    <td>
                                        <asp:TextBox ID="sfz" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>残疾证号：</td>
                                    <td>
                                        <asp:TextBox ID="zjz" runat="server"></asp:TextBox>
                                    </td>
                                    </tr>
                                <tr>
                                    <td>残疾类型：</td>
                                    <td>
                                        <asp:TextBox ID="lx" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>残疾等级：</td>
                                    <td>
                                        <asp:TextBox ID="dj" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>是否建立档案：</td>
                                    <td>
                                        <asp:TextBox ID="jd" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>联系方式：</td>
                                    <td>
                                        <asp:TextBox ID="lxfs" runat="server"></asp:TextBox>
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
                                        <asp:Button ID="Button3" runat="server" Text="添加" CssClass="btn btn-primary" OnClick="Button3_Click"></asp:Button>
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