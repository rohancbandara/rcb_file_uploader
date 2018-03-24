<%@page import="com.sun.scenario.effect.ImageData"%>
<%@page import="rcb.com.controller.DbConnection"%>
<%@page import="java.sql.*" %>

<%@page import="java.io.*" %>

<%!Connection con;

    Statement stmt;

    ResultSet rs7;%>


<%  String name = request.getParameter("n");

            out.println("Name" + name);

            try

            {
                byte b;

                byte imgData[] = null;

                Blob image;
                String fname="1";
				String sql="SELECT * from image WHERE first_name = '"+fname+"'";
				DbConnection db=new DbConnection();
				ResultSet rs=db.getData(sql);
				while(rs.next()){
					//out.println("cheking if loop\n");
					image=rs.getBlob("photo");
					//out.println("\nImage is "+image);
					

                    imgData = image.getBytes(1, (int) image.length());

                    //out.println("\nImgData is"+imgData);
                    
                   
                    
                    response.setContentType("image/jpg");

                    OutputStream o = response.getOutputStream();

                    o.write(imgData);
                    
                  

    				  o.flush();
				}
				
		


              

            } catch (Exception e)

            {
                out.println("Unable To Display image");

                out.println("Image Display Error=" + e.getMessage());
				e.printStackTrace();
                return;

            } 
                   

               

              
%>