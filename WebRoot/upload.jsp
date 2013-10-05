<form action="<%=request.getContextPath()%>/UploadServlet?action=student" enctype="multipart/form-data" 
method="post">

文本1：<input type="text" name="text1" value="文本1"><br>
文件2：<input type="text" name="text2" value="文本2"><br>
文件1：<input type="file" name="file1"><br>
文件2：<input type="file" name="file2"><br>
文件2：<input type="file" name="file3"><br>
<input type="submit" value="开始上传" >
</form>