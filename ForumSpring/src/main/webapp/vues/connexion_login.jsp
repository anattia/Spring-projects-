<%-- 
    Document   : connexion_login
    Created on : 23 févr. 2015, 16:02:54
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
                        <div class="col-xs-6">
                            <div class="well">
                            <c:if test="${!empty erreur}">
                                <div class="alert alert-danger">
                                    ${erreur}
                                </div>
                            </c:if>
                            <c:if test="${!empty success}">
                                <div class="alert alert-success">
                                    ${success}
                                </div>
                            </c:if>

                            <form id="loginForm" method="POST" action="<c:url value='/j_spring_security_check' />" novalidate="novalidate">
                                <div class="form-group">
                                    <label for="username" style="color:black;" class="control-label">Nom ou pseudonyme</label>
                                    <input type="text" class="form-control" id="username" name="j_username" value="" required="" title="Please enter you username" placeholder="example@gmail.com">
                                    <span class="help-block"></span>
                                </div>
                                <div class="form-group">
                                    <label for="password" style="color:black;" class="control-label">Password</label>
                                    <input type="password" class="form-control" id="password" name="j_password" value="" required="" title="Please enter your password">
                                    <span class="help-block"></span>
                                </div>
                                <div id="loginErrorMsg" class="alert alert-error hide">Wrong username og password</div>
                                <button type="submit" class="btn btn-success btn-block">Connexion</button>
                                <a href="/forgot/" class="btn btn-default btn-block">Mot de passe oublier ?</a>
                            </form>
                        </div>
                    </div>
                    <div class="col-xs-6">
                        <div class="well">
                            <p class="lead" style="color:black;">Inscrivez vous <span class="text-success">GRATUITEMENT </span></p>
                            <form id="newPersonForm"  method="POST" action="<c:url value="/InsertPersonBdd"></c:url>">
                                    <div class="form-group" >
                                        <label for="nameInput">Nom ou pseudonyme: </label>
                                        <input class="form-control" type="text" name="username" id="nameInput" required/>
                                    </div>

                                    <br/>
                                    <div class="form-group">
                                        <label for="ageInput">Email: </label>
                                        <input class="form-control" type="email" name="email" id="emailInput" required/>
                                    <c:if test="${!empty erreurEmail}">
                                        <span style="color:red;"> ${erreurEmail}</span>
                                    </c:if>

                                </div>
                                <div class="form-group">
                                    <label for="ageInput">Lien de votre photo: </label>
                                    <input class="form-control" type="text" name="picture" id="emailInput"/>

                                </div>
                                <br/>
                                <div class="form-group">
                                    <label for="ageInput">password: </label>
                                    <input class="form-control" type="password" name="password" id="passwordInput" required/>
                                    <br/>
                                </div>

                                <input type="submit" class="btn btn-success" value="Save Person" /><br/><br/>

                            </form>

                            <ul class="list-unstyled" style="line-height: 2">
                                <li style="color:black;"><span class="glyphicon glyphicon-ok"></span> Participez au fil de discussion</li>
                                <li style="color:black;"><span class="glyphicon glyphicon-ok"></span> Creez votre propre forum</li>
                                <li style="color:black;"><span class="glyphicon glyphicon-ok"></span> Parametrage de votre profil </li>
                                
                            </ul>
                            <p><a href="/ForumSpring/connexion_login/" class="btn btn-info btn-block">Oui! , S'inscrire maintenant ! </a></p>
                        </div>
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
