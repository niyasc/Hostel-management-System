<%-- 
    Document   : admin_add_hall
    Created on : 4 Nov, 2012, 8:59:28 PM
    Author     : niyasc
--%>

<%@ page contentType="text/html" language="java"
import="java.sql.*" errorPage="" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css" />
</head>
<center><div class="heading">Enter Account Information</div>
<%    if(request.getParameter("message")!=null){
        out.println("<div class=warning>"+request.getParameter("message")+"</div>");
    }
       else{
       out.println("</br>");
        
       }
    
    
       %>
    <form method="POST" action="insert_account.jsp">
    <table style="margin-left: auto;margin-right: auto">
        <tr>
            <td >User Name</td>

            <td ><input type="text"  name="name" required/></td>
        </tr>
        <tr>
            <td >Password</td>

            <td ><input type="password"  name="password1" required/></td>
        </tr>
        <tr>
            <td >Confirm Password</td>

            <td ><input type="password"  name="password2" required/></td>
        </tr>
        <tr>
            <td >Select Hostel</td>
<td >
            <%
String url = "jdbc:mysql://localhost:3306/hms";
String user= "root";
String pass= "123456";
try{
Class.forName ("com.mysql.jdbc.Driver").newInstance ();
Connection conn = DriverManager.getConnection(url, user, pass);
Statement stmt = conn.createStatement();
String query="select hid,name from Hostel where hid in (select Hostel_id from hostel_hall"
 + " where Hall_id="+session.getAttribute("h_no")+")";
ResultSet rs = stmt.executeQuery(query);
out.println("<select name='hostel'>");
out.println("<option>None</option>");
while(rs.next())
       {
    out.println("<option>"+rs.getString("name")+"</option>");
       }
out.println("</select>");
rs.close();
conn.close();
}catch(Exception e)
{
out.println(e.toString());
}
         
             %></td>
        </tr>
        <tr>
            <td style="text-align: center"><input type="submit" value="Create Account"/></td>
        </tr>

    </table>
    </form>
    
</center>
</html>
