<%@ page contentType="text/html" language="java"
import="java.sql.*" errorPage="" %>
<%
String url = "jdbc:mysql://localhost:3306/hms";
String user= "root";
String pass= "123456";
if(request.getParameter("name")==null||request.getParameter("name").equals("")){
    %>
<jsp:forward page="add_hall.jsp" >
  <jsp:param name="message" value="Name field can not be left blank" />
</jsp:forward><%
}
else if(request.getParameter("name").indexOf(34)!=-1||request.getParameter("name").indexOf(39)!=-1) {
    %>
    
<jsp:forward page="add_hall.jsp" >
  <jsp:param name="message" value="Name should not contain single or double quotes" />
</jsp:forward>
    <%
}
try{
Class.forName ("com.mysql.jdbc.Driver").newInstance ();
Connection conn = DriverManager.getConnection(url, user, pass);
Statement stmt = conn.createStatement();
String uname = (String)session.getAttribute("username");
String query="select * from Hall where name='"+request.getParameter("name")+"'";
ResultSet rs = stmt.executeQuery(query);
rs.next();
if(rs.getRow()==1)
       {
    rs.close();
    conn.close();%>
<jsp:forward page="add_hall.jsp" >
  <jsp:param name="message" value="Hall already exist" />
</jsp:forward><%
       }

    query="insert into Hall(name,no_of_emp,no_of_hostels) values('"+request.getParameter("name")+"',0,0)";
    stmt.executeUpdate(query);

conn.close();
response.sendRedirect("hall_info.jsp?message=Hall+inserted+Succesfully&type=success");
}catch(Exception e)
{
out.println(e.toString());
}

%>