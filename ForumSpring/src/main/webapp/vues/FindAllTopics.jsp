<%-- 
    Document   : FindAllTopics
    Created on : 7 févr. 2015, 21:22:28
    Author     : anthony
--%>
<%@taglib  prefix ="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
        <link href="<c:url value="/resources/css/menu.css" />" rel="stylesheet">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="menu.jsp" />
        <div class="row">
            <div class="container">
                <div class="col-sm-offset-3 col-sm-6 col-md-offset-3 col-md-6 white-background">
                    <h1>Liste des categories ! choisissez l'une d'entre elle !  : ${id}</h1>
                    <h4><c:out value="${topics}"/></h4>
                    <p> Vous êtes ici : <a href="/ForumSpring/"> ForumSpring </a> >> Topics </p>
                    <table class="table table-hover " >
                        <thead>
                            <tr>
                                <th>Sujet</th>
                                <th>Réponses</th>
                                <th>Crée le : </th>
                                <th>Crée par : </th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${ListTopics}" var="top">
                                <c:url value="/TopicsComment/${top.topic_nom}/ListeTopics" var ="topicLink">
                                    <c:param name="cat_id" value="${top.topic_id}"/>
                                    <c:param name="cat_nom" value="${top.topic_nom}"/>
                                </c:url>
                                <tr>
                                    <td class="text-success"><a href="${topicLink}">${top.topic_nom}</a></td>
                                    <td class="text-success"><c:out value="${top.topic_nombre_reponse}"/></td>
                                    <td class="text-success"><fmt:formatDate  type="both" 
                                                     dateStyle="medium" timeStyle="medium" 
                                                     value="${top.date_creation}"/></td>
                                    <td class="text-success"><c:out value="${top.username}"/></td>
                                </tr>
                            <br>
                        </c:forEach>
                        </tbody>
                    </table>

                </div>
            </div>
        </div>
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
</html>
