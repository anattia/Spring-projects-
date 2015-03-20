<%-- 
    Document   : profile
    Created on : 5 mars 2015, 21:31:03
    Author     : anthony
--%>
<%@taglib  prefix ="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@taglib prefix="sec" uri = "http://www.springframework.org/security/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
        <link href="<c:url value="/resources/css/custom_menu.css" />" rel="stylesheet">

        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
        <title>Mon profile </title>
    </head>
    <body>
        <jsp:include page="menu.jsp" /><br />
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 white-background toppad" >


                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h3 class="panel-title"><sec:authentication property="principal.username"/></h3>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-3 col-lg-3 " align="center"> <img alt="User Pic" src="${picture}" class="media-object  img-circle"> 
                                </div>


                                <div class=" col-md-9 col-lg-9 col-md-offset-2 col-lg-offset-2">

                                    <table class="table table-user-information">
                                        <tbody>
                                            <c:if test="${empty infos}">
                                            <p> La liste est vide </p>
                                        </c:if>
                                        <c:forEach items="${infos}" var = "i">
                                            <tr>
                                                <td class="text-info">Pseudo:</td>
                                                <td style="color:black;"><sec:authentication property="principal.username"/></td>
                                            </tr>
                                            <tr>
                                                <td class="text-info">Email:</td>
                                                <td >${i.email}</td>
                                            </tr>

                                            <tr> 
                                                <td class="text-info">Nombre de commentaires</td>
                                                <td >${nbC}</td>

                                            </tr>
                                            <tr> 
                                                <td class="text-info">Nombre de Topics crées</td>
                                                <td >${nbT}</td>

                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>

                                    <a href="/ForumSpring/Topics/CreateTopics">    
                                        <button type="button" class="btn btn-success">Creer votre propre forum</button> 
                                    </a>
                                    <a href="#" class="btn btn-primary"></a>
                                </div>
                            </div>
                        </div>
                        <div class="panel-footer">
                            <a data-original-title="Broadcast Message" data-toggle="tooltip" type="button" class="btn btn-sm btn-primary"><i class="glyphicon glyphicon-envelope"></i></a>
                            <span class="pull-right">
                                <a href="edit.html" data-original-title="Edit this user" data-toggle="tooltip" type="button" class="btn btn-sm btn-warning"><i class="glyphicon glyphicon-edit"></i></a>
                                <a data-original-title="Remove this user" data-toggle="tooltip" type="button" class="btn btn-sm btn-danger"><i class="glyphicon glyphicon-remove"></i></a>
                            </span>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <!-- jQuery -->
        <script src="<c:url value="/resources/js/jquery.js" />"></script>
        <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
        <script> $(function () {
                /* START OF DEMO JS - NOT NEEDED */
                if (window.location == window.parent.location) {
                    $('#fullscreen').html('<span class="glyphicon glyphicon-resize-small"></span>');
                    $('#fullscreen').attr('href', 'http://bootsnipp.com/mouse0270/snippets/PbDb5');
                    $('#fullscreen').attr('title', 'Back To Bootsnipp');
                }
                $('#fullscreen').on('click', function (event) {
                    event.preventDefault();
                    window.parent.location = $('#fullscreen').attr('href');
                });
                $('#fullscreen').tooltip();
                /* END DEMO OF JS */

                $('.navbar-toggler').on('click', function (event) {
                    event.preventDefault();
                    $(this).closest('.navbar-minimal').toggleClass('open');
                })
            });</script>
    </body>
</html>
