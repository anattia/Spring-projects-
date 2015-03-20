<%-- 
    Document   : InsertCategorie
    Created on : 8 févr. 2015, 15:25:18
    Author     : anthony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
        <link href="<c:url value="/resources/css/sb-admin.css" />" rel="stylesheet">

        <link href="<c:url value="/resources/css/font-awesome-4.1.0/css/font-awesome.min.css" />" rel="stylesheet">

        <title>JSP Page</title>

    </head>
    <body>
        <div id="wrapper">

            <!-- Navigation -->
            <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="/ForumSpring/AdminIndex">Gestion du forum</a>
                </div>
                <!-- Top Menu Items -->
                <ul class="nav navbar-right top-nav">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-envelope"></i> <b class="caret"></b></a>
                        <ul class="dropdown-menu message-dropdown">
                            <c:forEach items="${messages}" var="msg" begin="1" end="5">
                                <li class="message-preview">
                                    <a href="#">
                                        <div class="media">
                                            <span class="pull-left">
                                                <img class="media-object" src="http://www.icone-png.com/png/2/2133.png" 
                                                     style="width:50px; height: 50px;" alt="">
                                            </span>
                                            <div class="media-body">
                                                <h5 class="media-heading"><strong><c:out value="${msg.personnemessage}"/></strong>
                                                </h5>
                                                <p class="small text-muted"><i class="fa fa-clock-o"></i>${msg.objet}</p>
                                                <p><c:out value="${fn:substring(msg.contenu,1,30)}"/>...</p>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                            </c:forEach>
                            <c:choose>
                                <c:when test="${!empty messages}">
                                    <li class="message-footer">
                                        <a href="/ProjetBureaux-war/ListeMessage">Afficher tous les messages</a>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li class="message-footer">
                                        <p>&nbsp;Aucun message reçu</p>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                        </ul>
                    </li>

                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i>  ${sessionScope.pseudoSession} <b class="caret"></b></a>
                        <ul class="dropdown-menu">

                            <li>
                                <a href="/ProjetBureaux-war/ListeMessage"><i class="fa fa-fw fa-envelope"></i> Inbox</a>
                            </li>

                            <li class="divider"></li>
                            <li>
                                <a href="/Admin/logout?logout"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
                            </li>

                        </ul>
                    </li>
                </ul>
                <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
                <div class="collapse navbar-collapse navbar-ex1-collapse">
                    <ul class="nav navbar-nav side-nav">
                        <li >
                            <a href="/ProjetBureaux-war/IndexAdmin"><i class="fa fa-fw fa-dashboard"></i> Accueil </a>
                        </li>
                        <li class="active">
                            <a href="/ForumSpring/Admin/NewCategory"><i class="fa fa-fw fa-bar-chart-o"></i> Nouvelle  categorie</a>
                        </li>
                        <li>
                            <a href="/ForumSpring/Admin/ValidationComments"><i class="fa fa-fw fa-bar-chart-o"></i> Valider commentaire</a>
                        </li>
                        <li >
                            <a href="/ForumSpring/Admin/ListeTopics"><i class="fa fa-fw fa-bar-chart-o"></i> Gérer les fils de discussions</a>
                        </li>


                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </nav>

            <div id="page-wrapper">

                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="row">
                        <div class="col-lg-6">
                            <c:if test="${!empty erreur}">
                                <div class="alert alert-danger" role="alert">
                                    <i class="fa fa-exclamation-triangle"></i>
                                    <span class="sr-only">Error:</span>
                                    ${erreur}
                                </div>
                            </c:if>

                            <form action="InsertNewCategory" method ="post">
                                <input class="form-control" type="text" name="categorie" placeholder="Entrez une catégorie">
                                <br />
                                <input type="submit" value="Ajouter" class="btn btn-success">

                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- jQuery -->
        <script src="<c:url value="/resources/js/jquery.js" />"></script>
        <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
    </body>
</html>
