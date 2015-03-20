<%-- 
    Document   : AdminLogin
    Created on : 2 févr. 2015, 16:43:03
    Author     : anthony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix ="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
        <link href="<c:url value="/resources/css/connexion.css" />" rel="stylesheet">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <div class="row vertical-offset-100">
                <div class="col-md-4 col-md-offset-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">                                
                            <div class="row-fluid user-row">
                                <img src="http://s11.postimg.org/7kzgji28v/logo_sm_2_mr_1.png" class="img-responsive" alt="Conxole Admin"/>
                            </div>
                        </div>
                        <div class="panel-body">
                            <h4>Formulaire de connexion </h4>
                            <form method="post" action="<c:url value='/j_spring_security_check' />" class="form-signin" >
                                <input class="form-control" type="text" name="j_username" value="" placeholder="Nom"/>
                                <input class="form-control" type="password" name ="j_password" placeholder="password" />
                                <input class="btn btn-lg btn-success btn-block" type="submit" value="connexion"/>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
