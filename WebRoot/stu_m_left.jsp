
<%@ page contentType="text/html;charset=gb2312" language="java"%>
<HTML><HEAD><LINK href="taskedit_php_files/turbocrm.css" type=text/css 
rel=stylesheet>



<BODY>
<SCRIPT language=javascript src="taskedit_php_files/tabcontrol.js"></SCRIPT>
	<!-- -->
      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR height=8>
          <TD></TD></TR>
        <TR>
          <TD>
            <TABLE cellSpacing=0 cellPadding=0 width="100%" 230>
              <TBODY>
              <TR vAlign=top>
                <TD>
                  <DIV class=activeVTab id=tabDivtaskMore2_0 
                  onclick="blur();SetActiveVTab(taskMore2,'taskMore2_0');">
                  <TABLE cellSpacing=0 cellPadding=0 width="95%">
                    <TBODY>
                    <TR>
                      <TD class=ttTable>学生档案</TD>
                      <TD width="1%">&nbsp;</TD>
                    </TR></TBODY></TABLE></DIV>
					
                  <DIV class=vtabContent id=cntDivtaskMore2_0 
                  style="DISPLAY: block; OVERFLOW: auto; HEIGHT: 230px">
				  <!-- -->
                  <TABLE cellSpacing=0 cellPadding=0 width="99%" border=0>
                    <tr>
					<td><li><a href=stu_file.jsp target='frmright'>显示档案</a></li></td>
					</tr>
					<tr>
					<td><li><a href=yidong_manage.jsp target='frmright'>异动管理</a></li></td>
					</tr>
					<tr>
					<td><li><a href=adjust_manage.jsp target='frmright'>学生调班</a></li></td>
					</tr>
					<tr>
					<td><li><a href=retire_manage.jsp target='frmright'>学生休学</a></li></td>
					</tr>
					<tr>
					<td><li><a href=thran_manage.jsp target='frmright'>学生转学</a></li></td>
					</tr>
					<tr>
					<td><li><a href=recover_manage.jsp target='frmright'>学生复学</a></li></td>
					</tr>
					
					
					</TABLE>
					<!-- -->
                  </DIV>
                  
                  <DIV class=normalVTab id=tabDivtaskMore2_1 
                  onclick="blur();SetActiveVTab(taskMore2,'taskMore2_1');">
                  <TABLE cellSpacing=0 cellPadding=0 width="95%">
                    <TBODY>
                    <TR>
                      <TD class=ttTable>公告栏</TD>
                      <TD width="1%">&nbsp;</TD>
                    </TR></TBODY></TABLE></DIV>
                  <DIV class=vtabContent id=cntDivtaskMore2_1 
                  style="DISPLAY: none; OVERFLOW: auto; HEIGHT: 230px">
				  <!-- -->
                  <TABLE cellSpacing=0 cellPadding=0 width="99%" border=0>
                   <tr>
					<td><li><a href=inter_mail.jsp target='frmright'>增加公告</a></li></td>
					</tr>
					<tr>
					<td><li><a href=inter_mail.jsp target='frmright'>所有公告</a></li></td>
					</tr>
				   </TABLE>
				   <!-- -->
				   </DIV>
                  <DIV class=normalVTab id=tabDivtaskMore2_2 
                  onclick="blur();SetActiveVTab(taskMore2,'taskMore2_2');">
                  <TABLE cellSpacing=0 cellPadding=0 width="95%">
                    <TBODY>
                    <TR>
                      <TD class=ttTable>日程安排</TD>
                      <TD width="1%">&nbsp;</TD>
                    </TR></TBODY></TABLE></DIV>
                    
                  <DIV class=vtabContent id=cntDivtaskMore2_2 
                  style="DISPLAY: none; OVERFLOW: auto; HEIGHT: 230px">
				  <!-- -->
                  <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
					<tr>
					<td><li><a href=inter_mail.jsp target='frmright'>增加日程安排</a></li></td>
					</tr>
					</TABLE>
					<!-- -->
					</DIV>
					
                  <DIV class=normalVTab id=tabDivtaskMore2_3 
                  style="BORDER-BOTTOM: #777777 1px solid" 
                  onclick="blur();SetActiveVTab(taskMore2,'taskMore2_3');">
                  <TABLE cellSpacing=0 cellPadding=0 width="95%">
                    <TBODY>
                    <TR>
                      <TD class=ttTable>考试管理</TD>
                      <TD width="1%">&nbsp;</TD>
                    </TR></TBODY></TABLE></DIV>
                    
                  <DIV class=vtabContent id=cntDivtaskMore2_3
                  style="BORDER-TOP: medium none; DISPLAY: none; OVERFLOW: auto; BORDER-BOTTOM: #777777 1px solid; HEIGHT: 230px">
                  <TABLE cellSpacing=0 cellPadding=0 width="99%" border=0>
                    <tr>
					<td><li><a href=Exam_set.jsp target='frmright'>考试设置</a></li></td>
					</tr>
					<tr>
					<td><li><a href=Exam_scoreInput.jsp target='frmright'>考试成绩录入</a></li></td>
					</tr>
					<tr>
					<td><li><a href=Exam_scoreSearch.jsp target='frmright'>考试成绩查询</a></li></td>
					</tr>
					</TABLE></DIV></TD></TR></TBODY></TABLE>
					
					
					
					
					<DIV class=normalVTab id=tabDivtaskMore2_4 
                  style="BORDER-BOTTOM: #777777 1px solid" 
                  onclick="blur();SetActiveVTab(taskMore2,'taskMore2_4');">
                  <TABLE cellSpacing=0 cellPadding=0 width="95%">
                    <TBODY>
                    <TR>
                      <TD class=ttTable>我的短信</TD>
                      <TD width="1%">&nbsp;</TD>
                    </TR></TBODY></TABLE></DIV>
                  <DIV class=vtabContent id=cntDivtaskMore2_4 
                  style="BORDER-TOP: medium none; DISPLAY: none; OVERFLOW: auto; BORDER-BOTTOM: #777777 1px solid; HEIGHT: 230px">
                  <TABLE cellSpacing=0 cellPadding=0 width="99%" border=0>
                    <tr>
					<td><li><a href=inter_mail.jsp target='frmright'>查看我的短信</a></li></td>
					</tr>
					</TABLE></DIV></TD></TR></TBODY></TABLE>
				
					
					<DIV class=normalVTab id=tabDivtaskMore2_5 
                  style="BORDER-BOTTOM: #777777 1px solid" 
                  onclick="blur();SetActiveVTab(taskMore2,'taskMore2_5');">
                  <TABLE cellSpacing=0 cellPadding=0 width="95%">
                    <TBODY>
                    <TR>
                      <TD class=ttTable>我的文档</TD>
                      <TD width="1%">&nbsp;</TD>
                    </TR></TBODY></TABLE></DIV>
                  <DIV class=vtabContent id=cntDivtaskMore2_5 
                  style="BORDER-TOP: medium none; DISPLAY: none; OVERFLOW: auto; BORDER-BOTTOM: #777777 1px solid; HEIGHT: 230px">
                  <TABLE cellSpacing=0 cellPadding=0 width="99%" border=0>
                    <tr>
					<td><li><a href=inter_mail.jsp target='frmright'>查看我的文档</a></li></td>
					</tr>
					</TABLE></DIV></TD></TR></TBODY></TABLE>
					
					<DIV class=normalVTab id=tabDivtaskMore2_6 
                  style="BORDER-BOTTOM: #777777 1px solid" 
                  onclick="blur();SetActiveVTab(taskMore2,'taskMore2_6');">
                  <TABLE cellSpacing=0 cellPadding=0 width="95%">
                    <TBODY>
                    <TR>
                      <TD class=ttTable>通讯录</TD>
                      <TD width="1%">&nbsp;</TD>
                    </TR></TBODY></TABLE></DIV>
                  <DIV class=vtabContent id=cntDivtaskMore2_6 
                  style="BORDER-TOP: medium none; DISPLAY: none; OVERFLOW: auto; BORDER-BOTTOM: #777777 1px solid; HEIGHT: 230px">
                  <TABLE cellSpacing=0 cellPadding=0 width="99%" border=0>
                    <tr>
					<td><li><a href=inter_mail.jsp target='frmright'>查看我的通讯录</a></li></td>
					</tr>
					</TABLE></DIV></TD></TR></TBODY></TABLE>
					
					<DIV class=normalVTab id=tabDivtaskMore2_7 
                  style="BORDER-BOTTOM: #777777 1px solid" 
                  onclick="blur();SetActiveVTab(taskMore2,'taskMore2_7');">
                  <TABLE cellSpacing=0 cellPadding=0 width="95%">
                    <TBODY>
                    <TR>
                      <TD class=ttTable>部门管理</TD>
                      <TD width="1%">&nbsp;</TD>
                    </TR></TBODY></TABLE></DIV>
                  <DIV class=vtabContent id=cntDivtaskMore2_7 
                  style="BORDER-TOP: medium none; DISPLAY: none; OVERFLOW: auto; BORDER-BOTTOM: #777777 1px solid; HEIGHT: 230px">
                  <TABLE cellSpacing=0 cellPadding=0 width="99%" border=0>
                    <tr>
					<td><li><a href=inter_mail.jsp target='frmright'>我的部门</a></li></td>
					</tr>
					</TABLE></DIV></TD></TR></TBODY></TABLE>
					
					<DIV class=normalVTab id=tabDivtaskMore2_8 
                  style="BORDER-BOTTOM: #777777 1px solid" 
                  onclick="blur();SetActiveVTab(taskMore2,'taskMore2_8');">
                  <TABLE cellSpacing=0 cellPadding=0 width="95%">
                    <TBODY>
                    <TR>
                      <TD class=ttTable>个人设置</TD>
                      <TD width="1%">&nbsp;</TD>
                    </TR></TBODY></TABLE></DIV>
                  <DIV class=vtabContent id=cntDivtaskMore2_8 
                  style="BORDER-TOP: medium none; DISPLAY: none; OVERFLOW: auto; BORDER-BOTTOM: #777777 1px solid; HEIGHT: 230px">
                  <TABLE cellSpacing=0 cellPadding=0 width="99%" border=0>
                    <tr>
					<td><li><a href=inter_mail.jsp target='frmright'>设置个人信息</a></li></td>
					</tr>
					</TABLE></DIV></TD></TR></TBODY></TABLE>
					
					<DIV class=normalVTab id=tabDivtaskMore2_9 
                  style="BORDER-BOTTOM: #777777 1px solid" 
                  onclick="blur();SetActiveVTab(taskMore2,'taskMore2_9');">
                  <TABLE cellSpacing=0 cellPadding=0 width="95%">
                    <TBODY>
                    <TR>
                      <TD class=ttTable>规章制度</TD>
                      <TD width="1%">&nbsp;</TD>
                    </TR></TBODY></TABLE></DIV>
                  <DIV class=vtabContent id=cntDivtaskMore2_9 
                  style="BORDER-TOP: medium none; DISPLAY: none; OVERFLOW: auto; BORDER-BOTTOM: #777777 1px solid; HEIGHT: 230px">
                  <TABLE cellSpacing=0 cellPadding=0 width="99%" border=0>
                    <tr>
					<td><li><a href=inter_mail.jsp target='frmright'>显示规章制度</a></li></td>
					</tr>
					</TABLE></DIV></TD></TR></TBODY></TABLE>
					
					
					
					 
					<!---->
            <SCRIPT language=javascript>taskMore2 = new TabControl('taskMore2',0);
			AddTabItem(taskMore2,'taskMore2_0','tabDivtaskMore2_0','cntDivtaskMore2_0');
			AddTabItem(taskMore2,'taskMore2_1','tabDivtaskMore2_1','cntDivtaskMore2_1');
			AddTabItem(taskMore2,'taskMore2_2','tabDivtaskMore2_2','cntDivtaskMore2_2');
			AddTabItem(taskMore2,'taskMore2_3','tabDivtaskMore2_3','cntDivtaskMore2_3');
			AddTabItem(taskMore2,'taskMore2_4','tabDivtaskMore2_4','cntDivtaskMore2_4');
			AddTabItem(taskMore2,'taskMore2_5','tabDivtaskMore2_5','cntDivtaskMore2_5');
			AddTabItem(taskMore2,'taskMore2_6','tabDivtaskMore2_6','cntDivtaskMore2_6');
			AddTabItem(taskMore2,'taskMore2_7','tabDivtaskMore2_7','cntDivtaskMore2_7');
			AddTabItem(taskMore2,'taskMore2_8','tabDivtaskMore2_8','cntDivtaskMore2_8');
			AddTabItem(taskMore2,'taskMore2_9','tabDivtaskMore2_9','cntDivtaskMore2_9');
			
			
			
			</SCRIPT>
        
</BODY></HTML>
