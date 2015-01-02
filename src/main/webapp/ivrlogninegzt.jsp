<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="java.util.*,java.io.*,java.sql.*,java.sql.Statement,java.lang.*,database.*,util.*"%>
<%@ page trimDirectiveWhitespaces="true" %> 
<%
        String id = request.getParameter("id");
        String phone = request.getParameter("mobile");
        String called = request.getParameter("called_number");
        String starttime = request.getParameter("time_begin");
        String endtime = request.getParameter("time_end");

               System.out.print(starttime);
               
               
        starttime = starttime.replaceAll(" ","");
        starttime = starttime.replaceAll(":","");
        starttime = starttime.replaceAll("-","");
        endtime = endtime.replaceAll(" ","");
        endtime = endtime.replaceAll(":","");
        endtime = endtime.replaceAll("-","");
        out.print(starttime);

		String gethttpfile="gethttp =="+phone+","+called+","+starttime+","+endtime;
		String sendhttpfile="sendhttp=="+phone+","+called+","+starttime+","+endtime;
        boolean succ=false;
		if(null!=phone&&!"".equals(phone)&&null!=called&&!"".equals(called)&&null!=starttime&&!"".equals(starttime) &&null!=endtime&&!"".equals(endtime))
		{
	        phone=phone.trim();
	        called=called.trim();
	        starttime=starttime.trim();
	        endtime=endtime.trim();
			succ=Getpasswordnine.insertlog(phone,called,starttime,endtime);

			
		}
		sendhttpfile=sendhttpfile+"=="+succ;
		Getpasswordnine.writeComLog(gethttpfile, PropertyUtils.getPropertyUtils().getProperty("ivrlog"));
		Getpasswordnine.writeComLog(sendhttpfile, PropertyUtils.getPropertyUtils().getProperty("ivrlog"));
		if(succ)
		{
			out.print("Success");
		}else
		{
			out.print("Fail");
		}

%>
