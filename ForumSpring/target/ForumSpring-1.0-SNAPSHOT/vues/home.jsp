<%-- 
    Document   : home
    Created on : 31 janv. 2015, 21:27:13
    Author     : anthony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix ="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@taglib prefix="sec" uri = "http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
        <link href="<c:url value="/resources/css/menu.css" />" rel="stylesheet">
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="menu.jsp"></jsp:include><br />
            <div class="container">
                <div class="row">
                    <div class="col-sm-10 col-sm-offset-1 white-background" id="inscription">

                        <h2>Inscrivez vous ! </h2>

                        <form id="newPersonForm" >
                            <div class="form-group">
                                <label for="nameInput">Name: </label>
                                <input class="form-control" type="text" name="username" id="nameInput" required/>
                            </div>

                            <br/>
                            <div class="form-group">
                                <label for="ageInput">Email: </label>
                                <input class="form-control" type="text" name="email" id="emailInput" required/>

                            </div>
                            <br/>
                            <div class="form-group">
                                <label for="ageInput">password: </label>
                                <input class="form-control" type="text" name="password" id="passwordInput" required/>
                                <br/>
                            </div>

                            <input type="submit" class="btn btn-success" value="Save Person" /><br/><br/>

                        </form>
                        <div id="personFormResponse" class="alert-success"> </div>
                    </div>

                </div>

            </div>
            <script src="<c:url value="/resources/js/jquery.js" />"></script>
        <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
        <script>
            $(document).ready(function () {
                $('#newPersonForm').submit(function (e) {

                    // will pass the form data using the jQuery serialize function
                    $.post('${pageContext.request.contextPath}/Personne/person', $(this).serialize(), function (response) {
                        alert("Suces de l'ajout !");
                        $('#newPersonForm').hide();
                        $('#personFormResponse').text(response);
                    });

                    e.preventDefault(); // prevent actual form submit and page reload
                });
            });

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
    </body>
</html>
