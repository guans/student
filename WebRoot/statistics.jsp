<%@ page contentType="text/html;charset=gb2312" import="java.sql.*"%>
<jsp:useBean id="student" scope="page" class="student.students"></jsp:useBean>
<jsp:useBean id="sqlBean" scope="page" class="student.sqlBean"></jsp:useBean>
<%@ page
	import="org.jfree.chart.ChartFactory,org.jfree.chart.JFreeChart,org.jfree.chart.plot.PlotOrientation,org.jfree.chart.servlet.ServletUtilities,org.jfree.data.category.CategoryDataset,org.jfree.data.general.DatasetUtilities"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
			
			
			
			//����������ʽ  
   StandardChartTheme standardChartTheme=new StandardChartTheme("CN");  
   //���ñ�������  
   standardChartTheme.setExtraLargeFont(new Font("����",Font.BOLD,20));  
   //����ͼ��������  
   standardChartTheme.setRegularFont(new Font("����",Font.PLAIN,15));  
   //�������������  
   standardChartTheme.setLargeFont(new Font("����",Font.PLAIN,15));  
   //Ӧ��������ʽ  
   ChartFactory.setChartTheme(standardChartTheme);
   
   
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'statistics.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	</head>

	<body>
		<%@ page
			import="org.jfree.chart.*,org.jfree.chart.plot.PiePlot,org.jfree.data.general.DefaultPieDataset,org.jfree.chart.servlet.ServletUtilities,java.awt.*"%>
		<%
			request.setCharacterEncoding("GBK"); //���ñ��뷽ʽ				

			// ��Ŀ�Ŀ
			String exam_sub = request.getParameter("course_name");
			// ��� �༶
			String exam_class = request.getParameter("course_class");

			out.print(exam_sub);
			out.print(exam_class);
			int all = 0, m_90 = 0, m_80 = 0, m_70 = 0, m_60 = 0, m_other = 0;
			//������
			String sq_all = "SELECT  count(*) FROM STU_SCORE WHERE S_SUBJECT_NAME='"
					+ exam_sub + "' AND S_CLASS='" + exam_class + "'";
			ResultSet rss = sqlBean.executeQuery(sq_all);
			while (rss.next()) {
				all = rss.getInt("count(*)");
				out.println("������" + all);
			}

			//90��������
			String sql_90 = "SELECT  count(*) FROM STU_SCORE WHERE S_SUBJECT_NAME='"
					+ exam_sub
					+ "' AND S_CLASS='"
					+ exam_class
					+ "'and S_SCORE>'90'";
			rss = sqlBean.executeQuery(sql_90);
			while (rss.next()) {
				m_90 = rss.getInt("count(*)");
				out.println("90up����" + m_90);
			}
			//80-90����
			String sql_80 = "SELECT  count(*) FROM STU_SCORE WHERE S_SUBJECT_NAME='"
					+ exam_sub
					+ "' AND S_CLASS='"
					+ exam_class
					+ "'and S_SCORE>'80'";
			rss = sqlBean.executeQuery(sql_80);
			while (rss.next()) {
				m_80 = rss.getInt("count(*)") - m_90;
				out.println("80-90����" + m_80);
			}
			//70-80����
			String sql_70 = "SELECT  count(*) FROM STU_SCORE WHERE S_SUBJECT_NAME='"
					+ exam_sub
					+ "' AND S_CLASS='"
					+ exam_class
					+ "'and S_SCORE>'70'";
			rss = sqlBean.executeQuery(sql_70);
			while (rss.next()) {
				m_70 = rss.getInt("count(*)") - m_90 - m_80;
				out.println(m_70);
			}
			//60-70����
			String sql_60 = "SELECT  count(*) FROM STU_SCORE WHERE S_SUBJECT_NAME='"
					+ exam_sub
					+ "' AND S_CLASS='"
					+ exam_class
					+ "'and S_SCORE>'60'";
			rss = sqlBean.executeQuery(sql_60);
			while (rss.next()) {
				m_60 = rss.getInt("count(*)") - m_90 - m_80 - m_70;
				out.println(m_60);
			}
			//60һ������
			float para1 = (float) m_90 / (float) all;
			float para2 = (float) m_80 / (float) all;
			float para3 = (float) m_70 / (float) all;
			float para4 = (float) m_60 / (float) all;
			float para5 = 1 - para1 - para2 - para3 - para4;

            m_other=all-m_90-m_80-m_70-m_60;
			double[][] data = new double[][] { { m_90 }, { m_80 }, { m_70 },
					{ m_60 } ,{m_other}};
			String[] rowKeys = { "90����", "80-90", "70-80", "60-70","60����" };
			String[] columnKeys = { "" };
			CategoryDataset dataset1 = DatasetUtilities.createCategoryDataset(
					rowKeys, columnKeys, data);
			JFreeChart chart1 = ChartFactory
					.createBarChart3D("ѧ���ɼ��ֲ�ͳ��ͼ", "�ֲ�", "����", dataset1,
							PlotOrientation.VERTICAL, true, false, false);

			String filename1 = ServletUtilities.saveChartAsPNG(chart1, 500, 300,
					null, session);
			String graphURL1 = request.getContextPath()
					+ "/DisplayChart?filename=" + filename1;
		%>
		
		
		
<br>
<br>
<table width="800" border="1" bgcolor=F3364F align="center">  
<tbody>
 <tr> 
    <td width="250">ѧ��ͳ��</td>  
    </tr>
    <tr>
    <td>90������</td> 
    <td><%=m_90 %>��</td>   
  </tr>
   <tr>
    <td>80��-90��</td> 
    <td><%=m_80%>��</td>   
  </tr>
   <tr>
    <td>70��-80��</td> 
    <td><%=m_70%>��</td>   
  </tr>
   <tr>
    <td>60��-70��</td> 
    <td><%=m_60%>��</td>   
  </tr>
   <tr>
    <td>60������</td> 
    <td><%=all-m_90-m_80-m_70-m_60%>��</td>   
  </tr>
 </table>
 <br>
 <br>
 
 
 
		<img src="<%=graphURL1%>" width=500 height=300 border=0
			usemap="#<%= filename1 %>">
	<br>
	<br>
	<br>
	<br>
		<%
			//�������ݼ�
			DefaultPieDataset dataset = new DefaultPieDataset();
			dataset.setValue("90������", para1);
			dataset.setValue("80-90��", para2);
			dataset.setValue("70-80��", para3);
			dataset.setValue("60-70��", para4);
			dataset.setValue("60������", para5);
			//ͨ������������JFreeChart����
			JFreeChart chart = ChartFactory.createPieChart3D("ѧ���ɼ��ֲ�ͼ",
					dataset, true, false, false);
			PiePlot pieplot = (PiePlot) chart.getPlot();
			pieplot.setLabelFont(new Font("����", 0, 12));
			//û�����ݵ�ʱ����ʾ������
			pieplot.setNoDataMessage("��������ʾ");
			pieplot.setCircular(false);
			pieplot.setLabelGap(0.02D);
			String filename = ServletUtilities.saveChartAsPNG(chart, 500, 300,
					null, session);
			String graphURL = request.getContextPath()
					+ "/DisplayChart?filename=" + filename;
		%>
		<img src="<%=graphURL%>" width=500 height=300 border=0
			usemap="#<%= filename %>">





	</body>
</html>
