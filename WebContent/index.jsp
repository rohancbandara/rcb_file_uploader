<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
      <title>Image Upload</title>
      <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
      <script src="js/jquery.min.js" type="text/javascript"></script>
      <script src="js/javaScript.js" type="text/javascript"></script>
      
</head>
<body>
    <form action="test" method="post" enctype="multipart/form-data">
    <table width="400px" align="center" border=0>
       <tr>
           <td align="center" colspan=2>
            Image Details</td>
       </tr>
       <tr>
           <td>First Name </td>
           <td>
               <input type="text" name="firstname">
           </td>
       </tr>
       <tr>
           <td>Last Name </td>
           <td>
               <input type="text" name="lastname">
           </td>
       </tr>
       <tr>
           <td>Image Link:</td>
           <td>
           <img id="blah" src="#" alt="your image" /> 
               <input type="file" name="file" onchange="readURL(this);" />
               
               
               
               
           </td>
       </tr>
       <tr>
           <td></td>
           <td>
              <input type="submit" name="submit" value="Submit"></td>
       </tr>
   </table>
</form>
</body>
</html>