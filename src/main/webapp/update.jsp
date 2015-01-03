<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="java.util.*,java.io.*,java.sql.*,java.sql.Statement,java.lang.*,database.*"%>

<%  
        GregorianCalendar gcTemp = new GregorianCalendar();
        java.text.NumberFormat nf =  java.text.NumberFormat.getInstance();
		nf.setMaximumFractionDigits(2);
		java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
		gcTemp.add(GregorianCalendar.DATE,-1);
		sdf.format(gcTemp.getTime());
        String starttime=sdf.format(gcTemp.getTime());
        
        String stoptime=sdf.format(gcTemp.getTime());
        Connection conn =null ;
        Statement pstmt = null;
        ResultSet rst = null;
        String sql=null;
        String id="";
        ArrayList idlist=new ArrayList();
        ArrayList namelist=new ArrayList();
        	try
        	{
        		conn =MysqlConnect.newConnection();
        		pstmt = conn.createStatement();

         		String sql1="select id,passwordtypename from ivr_nine_passwordtype where state=1";
         		 rst=pstmt.executeQuery(sql1);          
         	     while(rst.next()){
         	    	idlist.add(rst.getString(1));
         	    	namelist.add(rst.getString(2));
         	     }
        	}catch(Exception e)
        	{
        		e.printStackTrace();
        	}
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
<title>查询业务销售量</title>
</head>

<body>
<p>&nbsp;</p>
<form name="form1" method="post" action="updateresult.jsp">
  <div align="center">
    <p>调整业务量</p>
    </br>
    <table width="50%" border="1">
      <tr>
        <td>开始时间</td>
        <td><input name=starttime id=starttime style="CURSOR: text" <%if(starttime!=null){%>value="<%=starttime%>"<%}else{%>value=""<%}%>>
        <img src="images/date.gif" onClick="fPopUpCalendarDlg(starttime);return false" alt="选择日期"></td>
      </tr>
        </br>
      <tr>
       <p>选择卡的类型</p>
       </tr>
       <tr>
     <select name="id" id="zhou" action="">
     <option value="" selected>-----请选择-----</option>
     <%
     for(int i=0;i<idlist.size();i++)
     {
    	out.println("<option value=\""+idlist.get(i)+"\">"+namelist.get(i)+"</option>");
    	
     }
     %>
    </select>
    </tr>
      </br>
    <tr>
       <p>请输入调整的业务量</p>
           </tr>
       <tr>
        <p>
          <input type="text" name="phone">
        </p>
        </tr>
      <tr>
        <td colspan="2"><div align="center">
          <input type="submit" name="Submit2" value="提交">
        </div></td>
      </tr>
    </table>
  </div>
</form>
</body>
<p align="center"><a href="menu.jsp">返回</a></p>
</html>
