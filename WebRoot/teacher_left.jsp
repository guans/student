<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="java.util.*"%>

<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=gb2312" />
<TITLE>��������</TITLE>
<link href="css/style_left.css" rel="stylesheet" type="text/css" />

<style type="text/css"> 
<!--
*{margin:0;padding:0;border:0;}
body {
 font-family: arial, ����, serif;
 font-size:12px;
}
#nav {
 width:180px;
    line-height: 24px; 
 list-style-type: none;
 text-align:left;
    /*��������ul�˵����иߺͱ���ɫ*/
}
/*==================һ��Ŀ¼===================*/
#nav a {
 width: 160px; 
 display: block;
 padding-left:20px;
 /*Width(һ��Ҫ)�����������Li�����*/
}
#nav li {
 background:#26A8E0; /*һ��Ŀ¼�ı���ɫ*/
 border-bottom:#FF0 1px solid; /*�����һ���ױ�*/
 float:left;
 /*float��left,����Ӧ�����ã���������Firefox����������ʾ
 �̳�Nav��width,���ƿ�ȣ�li�Զ���������*/
}
#nav li a:hover{
 background:#57C5F5; /*һ��Ŀ¼onMouseOver��ʾ�ı���ɫ*/
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
/*==================����Ŀ¼===================*/
#nav li ul {
 list-style:none;
 text-align:left;
}
#nav li ul li{ 
 background: #57C5F5; /*����Ŀ¼�ı���ɫ*/
}
#nav li ul a{
         padding-left:20px;
         width:160px;
 /* padding-left����Ŀ¼�����������ƶ�����Width������������=(�ܿ��-padding-left)*/
}
/*�����Ƕ���Ŀ¼��������ʽ*/
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
 /* ����onmouseover��������ɫ������ɫ*/
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
<li><a href="#Menu=ChildMenu1"  onclick="DoMenu('ChildMenu1')">ѧ������</a>
 <ul id="ChildMenu1" class="collapsed">
 <li><a href="#"> &nbsp&nbspѧ����ѯ</a></li>
  <li><a href="#"> &nbsp&nbspѧ������</a></li>
   <li><a href="#"> &nbsp&nbspѧ��¼��</a></li>
    <li><a href="#"> &nbsp&nbspѧ����ѯ</a></li>

 </ul>
</li>
<li><a href="#Menu=ChildMenu2" onclick="DoMenu('ChildMenu2')">�ɼ�����</a>
 <ul id="ChildMenu2" class="collapsed">
  <li><a href="#">�ɼ�¼��</a></li>
  <li><a href="#">�ɼ���ѯ</a></li>
 <li><a href="#">�ɼ�ͳ��</a></li>

 </ul>
</li>

<li><a href="#Menu=ChildMenu3" onclick="DoMenu('ChildMenu3')">��ְ����Ϣ</a>
 <ul id="ChildMenu3" class="collapsed">
  <li><a href="#">������</a></li>
 <li><a href="#">��������</a></li>
 <li><a href="#">�ҵ��ĵ�</a></li>
 <li><a href="#">��ְ���</a></li>
 <li><a href="#">�ڲ��ʼ�</a></li>
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
 if((LastLeftID!="")&&(emid!=LastLeftID)) //�ر���һ��Menu
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
GetMenuID(); //*������function��˳��Ҫע��һ�£���Ȼ��Firefox��GetMenuID()����Ч��
menuFix();
--></script>

</body>
</html>