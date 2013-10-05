<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="java.util.*"%>

<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=gb2312" />
<TITLE>左栏帮助</TITLE>
<link href="css/style_left.css" rel="stylesheet" type="text/css" />

<style type="text/css"> 
<!--
*{margin:0;padding:0;border:0;}
body {
 font-family: arial, 宋体, serif;
 font-size:12px;
}
#nav {
 width:180px;
    line-height: 24px; 
 list-style-type: none;
 text-align:left;
    /*定义整个ul菜单的行高和背景色*/
}
/*==================一级目录===================*/
#nav a {
 width: 160px; 
 display: block;
 padding-left:20px;
 /*Width(一定要)，否则下面的Li会变形*/
}
#nav li {
 background:#26A8E0; /*一级目录的背景色*/
 border-bottom:#FF0 1px solid; /*下面的一条白边*/
 float:left;
 /*float：left,本不应该设置，但由于在Firefox不能正常显示
 继承Nav的width,限制宽度，li自动向下延伸*/
}
#nav li a:hover{
 background:#57C5F5; /*一级目录onMouseOver显示的背景色*/
}
#nav a:link  {
 color:#666; text-decoration:none;
}
#nav a:visited  {
 color:#666;text-decoration:none;
}
#nav a:hover  {
 color:#FFF;text-decoration:none;font-weight:bold;
}
/*==================二级目录===================*/
#nav li ul {
 list-style:none;
 text-align:left;
}
#nav li ul li{ 
 background: #57C5F5; /*二级目录的背景色*/
}
#nav li ul a{
         padding-left:20px;
         width:160px;
 /* padding-left二级目录中文字向右移动，但Width必须重新设置=(总宽度-padding-left)*/
}
/*下面是二级目录的链接样式*/
#nav li ul a:link  {
 color:#666; text-decoration:none;
}
#nav li ul a:visited  {
 color:#666;text-decoration:none;
}
#nav li ul a:hover {
 color:#F3F3F3;
 text-decoration:none;
 font-weight:normal;
 background:#26A8E0;
 /* 二级onmouseover的字体颜色、背景色*/
}
/*==============================*/
#nav li:hover ul {
 left: auto;
}
#nav li.sfhover ul {
 left: auto;
}
#content {
 clear: left; 
}
#nav ul.collapsed {
 display: none;
}
-->
#PARENT{
 width:300px;
 padding-left:20px;
}
</style>


<script type="text/javascript" src="css/accordian.pack.js"></script>
</head>
<BODY>
<div id="PARENT" align="left">
<ul id="nav">
<li><a href="#Menu=ChildMenu1"  onclick="DoMenu('ChildMenu1')">学生管理</a>
 <ul id="ChildMenu1" class="collapsed">
 <li><a href="#"> &nbsp&nbsp学生查询</a></li>
  <li><a href="#"> &nbsp&nbsp学生档案</a></li>
   <li><a href="#"> &nbsp&nbsp学生录入</a></li>
    <li><a href="#"> &nbsp&nbsp学生查询</a></li>

 </ul>
</li>
<li><a href="#Menu=ChildMenu2" onclick="DoMenu('ChildMenu2')">成绩管理</a>
 <ul id="ChildMenu2" class="collapsed">
  <li><a href="#">成绩录入</a></li>
  <li><a href="#">成绩查询</a></li>
 <li><a href="#">成绩统计</a></li>

 </ul>
</li>

<li><a href="#Menu=ChildMenu3" onclick="DoMenu('ChildMenu3')">教职工信息</a>
 <ul id="ChildMenu3" class="collapsed">
  <li><a href="#">公告栏</a></li>
 <li><a href="#">工作交办</a></li>
 <li><a href="#">我的文档</a></li>
 <li><a href="#">教职工活动</a></li>
 <li><a href="#">内部邮件</a></li>
</ul>
</li>

</div>
<script type=text/javascript><!--
var LastLeftID = "";
function menuFix() {
 var obj = document.getElementById("nav").getElementsByTagName("li");
 
 for (var i=0; i<obj.length; i++) {
  obj[i].onmouseover=function() {
   this.className+=(this.className.length>0? " ": "") + "sfhover";
  }
  obj[i].onMouseDown=function() {
   this.className+=(this.className.length>0? " ": "") + "sfhover";
  }
  obj[i].onMouseUp=function() {
   this.className+=(this.className.length>0? " ": "") + "sfhover";
  }
  obj[i].onmouseout=function() {
   this.className=this.className.replace(new RegExp("( ?|^)sfhover\\b"), "");
  }
 }
}
function DoMenu(emid)
{
 var obj = document.getElementById(emid); 
 obj.className = (obj.className.toLowerCase() == "expanded"?"collapsed":"expanded");
 if((LastLeftID!="")&&(emid!=LastLeftID)) //关闭上一个Menu
 {
  document.getElementById(LastLeftID).className = "collapsed";
 }
 LastLeftID = emid;
}
function GetMenuID()
{
 var MenuID="";
 var _paramStr = new String(window.location.href);
 var _sharpPos = _paramStr.indexOf("#");
 
 if (_sharpPos >= 0 && _sharpPos < _paramStr.length - 1)
 {
  _paramStr = _paramStr.substring(_sharpPos + 1, _paramStr.length);
 }
 else
 {
  _paramStr = "";
 }
 
 if (_paramStr.length > 0)
 {
  var _paramArr = _paramStr.split("&");
  if (_paramArr.length>0)
  {
   var _paramKeyVal = _paramArr[0].split("=");
   if (_paramKeyVal.length>0)
   {
    MenuID = _paramKeyVal[1];
   }
  }

 }
 
 if(MenuID!="")
 {
  DoMenu(MenuID)
 }
}
GetMenuID(); //*这两个function的顺序要注意一下，不然在Firefox里GetMenuID()不起效果
menuFix();
--></script>

</body>
</html>