<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="java.util.*,java.io.*,java.sql.*,java.sql.Statement,java.lang.*"%>

<%  
        GregorianCalendar gcTemp = new GregorianCalendar();
        GregorianCalendar gccTemp = new GregorianCalendar();
        java.text.NumberFormat nf =  java.text.NumberFormat.getInstance();
		nf.setMaximumFractionDigits(2);
		java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
		gcTemp.add(GregorianCalendar.DATE,0);
		gccTemp.add(GregorianCalendar.DATE,1);
		sdf.format(gcTemp.getTime());
        String starttime=sdf.format(gcTemp.getTime());
        
        String stoptime=sdf.format(gccTemp.getTime());
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
<title>��ѯҵ��������</title>
</head>

<body>
<p>&nbsp;</p>
<form name="form1" method="post" action="all1.jsp">
  <div align="center">
    <p>�����±�������ҵ���ѯ����</p>
    <table width="50%" border="1">
      <tr>
        <td>��ʼʱ��</td>
        <td><input name=starttime id=starttime style="CURSOR: text" <%if(starttime!=null){%>value="<%=starttime%>"<%}else{%>value=""<%}%>>
        <img src="images/date.gif" onClick="fPopUpCalendarDlg(starttime);return false" alt="ѡ������"></td>
      </tr>
      <tr>
        <td>����ʱ��</td>
        <td><input name=stoptime id=stoptime style="CURSOR: text" <%if(stoptime!=null){%>value="<%=stoptime%>"<%}else{%>value=""<%}%>>
        <img src="images/date.gif" onClick="fPopUpCalendarDlg(stoptime);return false" alt="ѡ������"></td>
      </tr>
      <tr>
        <td colspan="2"><div align="center">
          <input type="submit" name="Submit2" value="�ύ">
        ��
        <input type="reset" name="Submit3" value="����">
        </div></td>
      </tr>
    </table>
  </div>
</form>
</body>
<p align="center"><a href="menu.jsp">����</a></p>
</html>
