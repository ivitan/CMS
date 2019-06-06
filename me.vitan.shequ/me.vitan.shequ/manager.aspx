﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="manager.aspx.cs" Inherits="me.vitan.shequ.manager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta charset="utf-8"/>
  <title>社区管理系统</title>
  <!-- Bootstrap core CSS -->
  <link href="lib/bootstrap.min.css" rel="stylesheet" />
  <!--external css-->
    <link href="lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
  <!-- Custom styles for this template -->
  <link href="css/style.css" rel="stylesheet" />
    <link href="css/style-responsive.css" rel="stylesheet" />
</head>

<body>
  <section id="container">
    <header class="header black-bg">
      <div class="sidebar-toggle-box">
        <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
      </div>
      <a href="index.html" class="logo"><b>社区管理<span>系统</span></b></a>
      <div class="nav notify-row" id="top_menu">
        <ul class="nav top-menu">

        </ul>
      </div>
      <div class="top-menu">
        <ul class="nav pull-right top-menu">
          <li>
            <a class="logout" href="login.html">登陆</a>
          </li>
        </ul>
      </div>
    </header>
    <aside>
      <div id="sidebar" class="nav-collapse ">
        <ul class="sidebar-menu" id="nav-accordion">
          <p class="centered">
            <a href="profile.html"><img src="img/ivitan.png" class="img-circle" width="80"/></a>
          </p>
          <h5 class="centered">管理员</h5>
          <li class="sub-menu">
            <a class="active" href="javascript:;">
              <i class="fa fa-server"></i>
              <span>社区服务</span>
            </a>
            <ul class="sub">
              <li class="active">
                <a href="basic_table.html">健康管理</a>
              </li>
              <li>
                <a href="responsive_table.html">社区文体</a>
              </li>
              <li>
                <a href="advanced_table.html">下岗职工</a>
              </li>
              <li>
                <a href="advanced_table.html">志愿者管理</a>
              </li>
            </ul>
          </li>
          <li class="sub-menu">
            <a class="active" href="javascript:;">
              <i class="fa fa-info-circle"></i>
              <span>社区情况</span>
            </a>
            <ul class="sub">
              <li class="active">
                <a href="basic_table.html">社区情况</a>
              </li>
              <li>
                <a href="responsive_table.html">居民档案</a>
              </li>
            </ul>
          </li>
          <li class="sub-menu">
            <a class="active" href="javascript:;">
              <i class="fa fa-edit"></i>
              <span>综合治理</span>
            </a>
            <ul class="sub">
              <li class="active">
                <a href="basic_table.html">治安管理</a>
              </li>
              <li>
                <a href="responsive_table.html">纠纷调解</a>
              </li>
            </ul>
          </li>
          <li class="sub-menu">
            <a class="active" href="javascript:;">
              <i class="fa fa-user"></i>
              <span>民政工作</span>
            </a>
            <ul class="sub">
              <li class="active">
                <a href="basic_table.html">残疾人管理</a>
              </li>
              <li>
                <a href="responsive_table.html">低保管理</a>
              </li>
              <li>
                <a href="advanced_table.html">社区团体</a>
              </li>
            </ul>
          </li>
        </ul>
      </div>
    </aside>
    <section id="main-content">
      <section class="wrapper">
        <h3><i class="fa fa-angle-right"></i> 查询</h3>
        <div class="row">
          <div class="col-md-12">
            <div class="content-panel">
              <h4><i class="fa fa-angle-right"></i> Basic Table</h4>
              <hr/>

            </div>
          </div>
        </div>
        <!-- row -->
        <h3><i class="fa fa-angle-right"></i> 添加</h3>
        <div class="row">
          <div class="col-md-12">
            <div class="content-panel">
              <h4><i class="fa fa-angle-right"></i> Basic Table</h4>
              <hr/>

            </div>
          </div>
        </div>
        <!-- row -->
        <h3><i class="fa fa-angle-right"></i> 所有</h3>
        <div class="row">
          <div class="col-md-12">
            <div class="content-panel">
              <h4><i class="fa fa-angle-right"></i> Basic Table</h4>
              <hr/>

            </div>
          </div>
        </div>
      </section>
    </section>
    <footer class="site-footer">
      <div class="text-center">
        <p>
          &copy; Copyrights <strong>Vitan</strong>. All Rights Reserved
        </p>
        <div class="credits">
          社区管理系统 <a href="https://vitan.me">vitan.me</a>
        </div>
      </div>
    </footer>
    <!--footer end-->
  </section>
    <script src="lib/jquery/jquery.min.js"></script>
    <script src="lib/bootstrap/js/bootstrap.min.js"></script>
    <script src="lib/jquery.dcjqaccordion.2.7.js"></script>
    <script src="lib/jquery.scrollTo.min.js"></script>
    <script src="lib/common-scripts.js"></script>
   
</body>

</html>
