
<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="java.util.*,java.io.*,java.sql.*,java.sql.Statement,java.lang.*,database.*"%>
<%

        String starttime = request.getParameter("starttime");
        String endtime = request.getParameter("endtime");
        String time = request.getParameter("time");
String backurl="all.jsp?starttime="+starttime+"&endtime="+endtime+"&time="+time;

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>��ҳ��</title>
</head>
<body>
<%
out.println("<p align=\"center\"><a href=\"datafile.jsp?time="+time+"&type=3&starttime="+starttime+"&endtime="+endtime+"\">����30</a></p>");
out.println("<p align=\"center\"><a href=\"datafile.jsp?time="+time+"&type=5&starttime="+starttime+"&endtime="+endtime+"\">����71</a></p>");
out.println("<p align=\"center\"><a href=\"datafile.jsp?time="+time+"&type=10&starttime="+starttime+"&endtime="+endtime+"\">����622</a></p>");
out.println("<p align=\"center\"><a href=\"datafile.jsp?time="+time+"&type=9&starttime="+starttime+"&endtime="+endtime+"\">����23</a></p>");
out.println("<p align=\"center\"><a href=\"datafile.jsp?time="+time+"&type=12&starttime="+starttime+"&endtime="+endtime+"\">����92</a></p>");
out.println("<p align=\"center\"><a href=\"datafile.jsp?time="+time+"&type=13&starttime="+starttime+"&endtime="+endtime+"\">����93</a></p>");
out.println("<p align=\"center\"><a href=\"datafile.jsp?time="+time+"&type=14&starttime="+starttime+"&endtime="+endtime+"\">����94</a></p>");
out.println("<p align=\"center\"><a href=\"datafile.jsp?time="+time+"&type=15&starttime="+starttime+"&endtime="+endtime+"\">����95</a></p>");
out.println("<p align=\"center\"><a href=\"datafile.jsp?time="+time+"&type=16&starttime="+starttime+"&endtime="+endtime+"\">ͨ��9</a></p>");
out.println("<p align=\"center\"><a href=\"datafile.jsp?time="+time+"&type=17&starttime="+starttime+"&endtime="+endtime+"\">ͨ��502</a></p>");
out.println("<p align=\"center\"><a href=\"datafile.jsp?time="+time+"&type=18&starttime="+starttime+"&endtime="+endtime+"\">ͨ��582</a></p>");
out.println("<p align=\"center\"><a href=\"datafile.jsp?time="+time+"&type=19&starttime="+starttime+"&endtime="+endtime+"\">ͨ��585</a></p>");
out.println("<p align=\"center\"><a href=\"datafile.jsp?time="+time+"&type=20&starttime="+starttime+"&endtime="+endtime+"\">tom116</a></p>");
out.println("<p align=\"center\"><a href=\"datafile.jsp?time="+time+"&type=21&starttime="+starttime+"&endtime="+endtime+"\">tom117</a></p>");
out.println("<p align=\"center\"><a href=\"datafile.jsp?time="+time+"&type=22&starttime="+starttime+"&endtime="+endtime+"\">tom118</a></p>");
out.println("<p align=\"center\"><a href=\"datafile.jsp?time="+time+"&type=23&starttime="+starttime+"&endtime="+endtime+"\">tom119</a></p>");
out.println("<p align=\"center\"><a href=\"datafile.jsp?time="+time+"&type=24&starttime="+starttime+"&endtime="+endtime+"\">����ͨ601</a></p>");
out.println("<p align=\"center\"><a href=\"datafile.jsp?time="+time+"&type=25&starttime="+starttime+"&endtime="+endtime+"\">����ͨ602</a></p>");
out.println("<p align=\"center\"><a href=\"datafile.jsp?time="+time+"&type=26&starttime="+starttime+"&endtime="+endtime+"\">����ͨ603</a></p>");
out.println("<p align=\"center\"><a href=\"datafile.jsp?time="+time+"&type=27&starttime="+starttime+"&endtime="+endtime+"\">����ͨ604</a></p>");
out.println("<p align=\"center\"><a href=\"datafile.jsp?time="+time+"&type=28&starttime="+starttime+"&endtime="+endtime+"\">ͨ��4</a></p>");
out.println("<p align=\"center\"><a href=\"datafile.jsp?time="+time+"&type=29&starttime="+starttime+"&endtime="+endtime+"\">ͨ��503</a></p>");
out.println("<p align=\"center\"><a href=\"datafile.jsp?time="+time+"&type=30&starttime="+starttime+"&endtime="+endtime+"\">ͨ��666</a></p>");
out.println("<p align=\"center\"><a href=\"datafile.jsp?time="+time+"&type=31&starttime="+starttime+"&endtime="+endtime+"\">ͨ��999</a></p>");
out.println("<p align=\"center\"><a href=\"datafile.jsp?time="+time+"&type=32&starttime="+starttime+"&endtime="+endtime+"\">����3003</a></p>");
out.println("<p align=\"center\"><a href=\"datafile.jsp?time="+time+"&type=33&starttime="+starttime+"&endtime="+endtime+"\">����3004</a></p>");
out.println("<p align=\"center\"><a href=\"datafile.jsp?time="+time+"&type=34&starttime="+starttime+"&endtime="+endtime+"\">����3005</a></p>");
out.println("<p align=\"center\"><a href=\"datafile.jsp?time="+time+"&type=35&starttime="+starttime+"&endtime="+endtime+"\">����691</a></p>");
out.println("<p align=\"center\"><a href=\"datafile.jsp?time="+time+"&type=36&starttime="+starttime+"&endtime="+endtime+"\">����696</a></p>");
out.println("<p align=\"center\"><a href=\"datafile.jsp?time="+time+"&type=37&starttime="+starttime+"&endtime="+endtime+"\">����697</a></p>");
out.println("<p align=\"center\"><a href=\"datafile.jsp?time="+time+"&type=38&starttime="+starttime+"&endtime="+endtime+"\">����698</a></p>");
out.println("<p align=\"center\"><a href=\"datafile.jsp?time="+time+"&type=39&starttime="+starttime+"&endtime="+endtime+"\">����699</a></p>");
%>

</body>
<%
out.print("<p align=\"center\"><a href=\""+backurl+"\">����</a></p>");

%>
</html>