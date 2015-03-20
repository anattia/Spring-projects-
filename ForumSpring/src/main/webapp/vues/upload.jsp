<%-- 
    Document   : upload
    Created on : 1 mars 2015, 18:11:02
    Author     : anthony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form method="POST" action="uploadFile" enctype="multipart/form-data">
            File to upload: <input type="file" name="file"><br /> 
            Name: <input type="text" name="name"><br /> <br /> 
            <input type="submit" value="Upload"> Press here to upload the file!
        </form>    </body>
</html>
