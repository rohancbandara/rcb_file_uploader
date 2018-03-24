<%@page import="com.sun.scenario.effect.ImageData"%>
<%@page import="com.rcb.controller.DbConnection"%>
<%@page import="java.sql.*" %>

<%@page import="java.io.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Image Output</title>
</head>
<body>

            
	<%
	try

    {
        

        byte imgData[] = null;

        
        Blob image;
        
        String fname="1";
		String sql="SELECT * from image WHERE first_name = '"+fname+"'";
		DbConnection db= new DbConnection();
		ResultSet rs=db.getData(sql);
		while(rs.next()){
			//out.println("cheking if loop\n");
			//image=rs.getBlob("photo");
			//out.println("\nImage is "+image);
			//imgData = image.getBytes(1, (int) image.length());
			//out.println("\nImgData is"+imgData);
            //response.setContentType("image/jpg");
            
            
            //OutputStream o = response.getOutputStream();
            //o.write(imgData);
            %>
            <h1>Image</h1>
            <img src="<%=rs.getBlob("photo")%>" alt="images Here" width="130px" height="90px">
            
          
          
         
          
          
          <%

			  //o.flush();
		}
		



      

    } catch (Exception e)

    {
        out.println("Unable To Display image");

        out.println("Image Display Error=" + e.getMessage());
		e.printStackTrace();
        return;

    } 
	
	%>
</body>
</html>