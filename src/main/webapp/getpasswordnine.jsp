<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="java.util.*,java.io.*,java.sql.*,java.sql.Statement,java.lang.*,database.*"%>
<%@ page trimDirectiveWhitespaces="true" %> 
<%

        String phone = request.getParameter("phone");
        String called = request.getParameter("called");
        String passwordtype = request.getParameter("passwordtype");
        String province = "0";
        String sppassword = request.getParameter("sppassword");

        String isget=null;
		String gethttpfile="gethttp =="+phone+","+called+","+province+","+passwordtype+","+sppassword;
		String sendhttpfile="sendhttp=="+phone+","+called+","+province+","+passwordtype+","+sppassword;
		if(null!=phone&&!"".equals(phone)&&null!=called&&!"".equals(called)&&null!=passwordtype&&!"".equals(passwordtype)&&null!=province&&!"".equals(province)&&null!=sppassword&&!"".equals(sppassword))
		{
	        phone=phone.trim();
	        called=called.trim();
	        passwordtype=passwordtype.trim();
	        province=province.trim();
	        sppassword=sppassword.trim();
	        if(phone.length()>11&&phone.indexOf("phone=")>=0)
	        {
	        	phone=phone.substring(phone.indexOf("phone=")+6);
	        }
	        if(phone!=null&&phone.length()==11)
	        {
				if(Getpasswordnine.issp(called, sppassword)){
				 isget=Getpasswordnine.getPass(phone,called,passwordtype);
				 
				}else
				{
					isget="";
				}
	        }else
	        {
	        	isget="";
	        }
		}
		sendhttpfile=sendhttpfile+"=="+isget;
		Getpasswordnine.writeComLog(gethttpfile, PropertyUtils.getPropertyUtils().getProperty("passfile"));
		Getpasswordnine.writeComLog(sendhttpfile, PropertyUtils.getPropertyUtils().getProperty("passfile"));
		if(isget!=null&&!"".equals(isget))
		{
			out.print(isget);
		}else
		{
			out.print("Fail");
		}

%>
