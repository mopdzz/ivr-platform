<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="java.util.*,java.io.*,java.sql.*,java.sql.Statement,java.lang.*"%>

<%  
	    Connection conn =null ;
	    Statement pstmt = null;
        ResultSet rst = null; 
        GregorianCalendar gcTemp = new GregorianCalendar();
        java.text.NumberFormat nf =  java.text.NumberFormat.getInstance();
		nf.setMaximumFractionDigits(2);
		java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
		gcTemp.add(GregorianCalendar.DATE,0);
		sdf.format(gcTemp.getTime());
        String starttime=sdf.format(gcTemp.getTime());
        
        String stoptime=sdf.format(gcTemp.getTime());
         ArrayList al = new ArrayList();
        %>
<html>
<head>
<script Language="JavaScript" src="js/iOffice_Popup.js"></script>
<style type="text/css">
<!--
.style4 {font-size: 18px}
-->
</style>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>短信按时间查询条件输入页</title>
</head>

<body>
<p>&nbsp;</p>
<form name="form1" method="post" action="smstimephone.jsp">
  <div align="center">
    <p>请在下表中输入业务查询条件</p>
    <table width="50%" border="1">
      <tr>
        <td>开始时间</td>
        <td><input name=starttime id=starttime style="CURSOR: text" <%if(starttime!=null){%>value="<%=starttime%>"<%}else{%>value=""<%}%>>
        <img src="images/date.gif" onClick="fPopUpCalendarDlg(starttime);return false" alt="选择日期"></td>
      </tr>
      <tr>
        <td>结束时间</td>
        <td><input name=stoptime id=stoptime style="CURSOR: text" <%if(stoptime!=null){%>value="<%=stoptime%>"<%}else{%>value=""<%}%>>
        <img src="images/date.gif" onClick="fPopUpCalendarDlg(stoptime);return false" alt="选择日期"></td>
      </tr>
      <tr>
        <td>手机号码</td>
        <td><table width="100%" border="0">
          <tr>
            <td><input type="text" name="phone">
          </tr>
        </table></td>
      </tr>
      <tr>
        <td colspan="2"><div align="center">
          <input type="submit" name="Submit2" value="提交">
        　
        <input type="reset" name="Submit3" value="重置">
        </div></td>
      </tr>
    </table>
  </div>
</form>
<p align="center"><a href="menu.jsp">返回</a></p>
</body>
</html>
