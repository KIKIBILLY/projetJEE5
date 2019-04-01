<%@ page pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>  

<%  
try{  
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/locationdb","root","");  
PreparedStatement ps=con.prepareStatement("select * from point_location");  
ResultSet rs=ps.executeQuery();  


if(!rs.isBeforeFirst()) {   
}else{  
	
out.print("<select class=\"form-control\" name=\"idPl\">");

while(rs.next()){  
	
	out.print("<option value=\""+rs.getString(1)+"\">"+rs.getString(2)+" </option>");
	
    }
out.print("</select>");

}//end of else for rs.isBeforeFirst  
con.close();  
}catch(Exception e){out.print(e);}   
%>
