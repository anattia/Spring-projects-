<%-- 
    Document   : accessDenied
    Created on : 23 févr. 2015, 17:20:57
    Author     : anthony
--%>

<%@taglib  prefix ="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sec" uri = "http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
        <link href="<c:url value="/resources/css/menu.css" />" rel="stylesheet">
        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
        <title>Identification </title>
    </head>
    <body>
        <jsp:include page="menu.jsp"></jsp:include><br />   
            <div class="container">
                <div class="row">
                    <div class="col-sm-12 col-sm-offset-0 white-background" id="logout">

                        <div class="alert alert-danger">
                            <ul>
                                <li> Acces restreint</li>
                                <li> Cette page ne vous ai pas autorisée !  </li>
                                <li> Vos droits actuels sont insuffisants ! </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <script src="<c:url value="/resources/js/jquery.js" />"></script>
        <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>

        <script>
            $(function () {
                $('#myTab a:last').tab('show')
            })
        </script>
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

        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

    </body>
</html>
