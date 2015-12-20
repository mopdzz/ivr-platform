<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="database.Getpasswordnine,database.PropertyUtils"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
		String ip = request.getRemoteAddr();
        String phone = request.getParameter("phone");
        String called = request.getParameter("called");
        String passwordtype = request.getParameter("passwordtype");
        String province = "0";
        String sppassword = request.getParameter("sppassword");

        String isget=null;
		Long startTime = System.currentTimeMillis();
		String gethttpfile="gethttp =="+phone+","+called+","+province+","+passwordtype+","+sppassword+","+ip;
		String sendhttpfile="sendhttp=="+phone+","+called+","+province+","+passwordtype+","+sppassword;
		try {
			if (null != phone && !"".equals(phone) && null != called && !"".equals(called) && null != passwordtype && !"".equals(passwordtype) && null != province && !"".equals(province) && null != sppassword && !"".equals(sppassword)) {
				phone = phone.trim();
				called = called.trim();
				passwordtype = passwordtype.trim();
				province = province.trim();
				sppassword = sppassword.trim();
				if (phone.length() > 11 && phone.indexOf("phone=") >= 0) {
					phone = phone.substring(phone.indexOf("phone=") + 6);
				}
				if (phone != null && phone.length() == 11) {
					if (Getpasswordnine.issp(called, sppassword)) {
						isget = Getpasswordnine.getPass(phone, called, passwordtype, sppassword);

					} else {
						isget = "";
					}
				} else {
					isget = "";
				}
			}
		} catch (Exception e){
			sendhttpfile = sendhttpfile + "= error =" + e.toString();
		}
		sendhttpfile=sendhttpfile+"=="+isget;
		Getpasswordnine.writeComLog(gethttpfile, PropertyUtils.getPropertyUtils().getProperty("passfile"));
		Getpasswordnine.writeComLog(sendhttpfile + " , time:" + (System.currentTimeMillis()-startTime), PropertyUtils.getPropertyUtils().getProperty("passfile"));
		if(isget!=null&&!"".equals(isget))
		{
			out.print(isget);
		}else
		{
			out.print("Fail");
		}

%>
