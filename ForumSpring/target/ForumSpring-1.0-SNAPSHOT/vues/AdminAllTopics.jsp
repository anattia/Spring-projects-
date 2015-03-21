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
<%@taglib prefix="sec" uri = "http://www.springframework.org/security/tags" %>

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
                        <li>
                            <a href="/ForumSpring/Admin/NewCategory"><i class="fa fa-fw fa-bar-chart-o"></i> Nouvelle  categorie</a>
                        </li>
                        <li>
                            <a href="/ForumSpring/Admin/ValidationComments"><i class="fa fa-fw fa-bar-chart-o"></i> Valider commentaire</a>
                        </li>
                        <li class="active">
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
                        <div class="col-lg-10">
                            <div class="col-md-12 col-sm-12 white-background">
                                <c:if test = "${!empty Success_topics}"> 
                                    <div class="alert alert-success">
                                        ${Success_topics}
                                    </div>
                                </c:if>
                                <c:if test = "${!empty Success_prive}"> 
                                    <div class="alert alert-success">
                                        ${Success_prive}
                                    </div>
                                </c:if>
                                <c:if test = "${!empty Success_public}"> 
                                    <div class="alert alert-success">
                                        ${Success_public}
                                    </div>
                                </c:if>
                                <div class="panel panel-primary" style="margin-top: 50px;">
                                    <div class="panel-heading">
                                        <h3 class="panel-title">Gestionnaire de fil des discussions </h3>
                                        <div class="pull-right">
                                            <span class="clickable filter" data-toggle="tooltip" title="Toggle table filter" data-container="body">
                                                <i class="glyphicon glyphicon-filter"></i>
                                            </span>
                                        </div>
                                    </div>
                                    <div class="panel-body">
                                        <input type="text" class="form-control" id="dev-table-filter" data-action="filter" data-filters="#dev-table" placeholder="Taper le début du nom de votre sujet" />
                                    </div>
                                    <table class="table table-hover" id="dev-table">
                                        <thead>
                                            <tr>
                                                <th style="color:black;">Sujet</th>
                                                <th style="color:black;">Description</th>
                                                <th style="color:black;">Réponses</th>
                                                <th style="color:black;">Crée le : </th>
                                                <th style="color:black;">Crée par : </th>
                                                <th style="color:black;">Dernière réponse : </th>
                                                <th style="color:black;">Accès : </th>
                                                
                                                <th>Action </th>
                                                <th>Changer type </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${ListTopics}" var="top">
                                                <c:url value="/Topics/ListComment" var ="topicLink">
                                                    <c:param name="topic_id" value="${top.topic_id}"/>
                                                    <c:param name="cat_nom" value="${top.topic_nom}"/>
                                                    <c:param name="cat_id" value="${top.cat_id}"/>


                                                </c:url>
                                                <tr>

                                                    <td class="text-success"><a href="${topicLink}">${top.topic_nom}</a></td>
                                                    <td class="text-success"><c:out value="${top.topic_description}"/></td>
                                                    <td class="text-success"><c:out value="${top.topic_nombre_reponse}"/></td>
                                                    <td class="text-success"><fmt:formatDate  type="both" 
                                                                     dateStyle="medium" timeStyle="medium" 
                                                                     value="${top.date_creation}"/></td>
                                                    <td class="text-success"><c:out value="${top.username}"/></td>
                                                    <td class="text-primary"><fmt:formatDate  type="both" 
                                                                     dateStyle="medium" timeStyle="medium" 
                                                                     value="${top.topic_date_der_reponse}"/> par <p class="text-warning">'<c:out value="${top.topic_auteur_der_reponse}"/></p></td>

                                                    <td class="text-success"><c:out value="${top.type_topic}"/></td>
                                                   

                                                    <td class="text-center">
                                                        <a href="SupprimerComments?action=delete&idCommentS=${comms.comment_id}" class="btn btn-success btn-xs">
                                                            <span class="fa fa-trash-o"></span> Supprimer </a></td>
                                                            <c:if test="${top.type_topic == 'Public'}">
                                                        <td class="text-center">
                                                            <a href="ListeTopicsValidate?action=typePrive&idTopic=${top.topic_id}&redirect=all" class="btn btn-danger btn-xs">
                                                                <span class="fa fa-trash-o"></span>Passer en privé</a></td>
                                                            </c:if>
                                                            <c:if test="${top.type_topic == 'Privé'}">
                                                        <td class="text-center">
                                                            <a href="ListeTopicsValidate?action=typePublic&idTopic=${top.topic_id}&redirect=all" class="btn btn-danger btn-xs">
                                                                <span class="fa fa-ok"></span>Passer en public </a></td>
                                                            </c:if>

                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>


                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- jQuery -->
        <script src="<c:url value="/resources/js/jquery.js" />"></script>
        <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
        <script>
            /**
             */
            (function () {
                'use strict';
                var $ = jQuery;
                $.fn.extend({
                    filterTable: function () {
                        return this.each(function () {
                            $(this).on('keyup', function (e) {
                                $('.filterTable_no_results').remove();
                                var $this = $(this), search = $this.val().toLowerCase(), target = $this.attr('data-filters'), $target = $(target), $rows = $target.find('tbody tr');
                                if (search == '') {
                                    $rows.show();
                                } else {
                                    $rows.each(function () {
                                        var $this = $(this);
                                        $this.text().toLowerCase().indexOf(search) === -1 ? $this.hide() : $this.show();
                                    })
                                    if ($target.find('tbody tr:visible').size() === 0) {
                                        var col_count = $target.find('tr').first().find('td').size();
                                        var no_results = $('<tr class="filterTable_no_results" style="color:black;"><td colspan="' + col_count + '">Aucun résultat ne correspond à votre recherche </td></tr>')
                                        $target.find('tbody').append(no_results);
                                    }
                                }
                            });
                        });
                    }
                });
                $('[data-action="filter"]').filterTable();
            })(jQuery);

            $(function () {
                // attach table filter plugin to inputs
                $('[data-action="filter"]').filterTable();

                $('.container').on('click', '.panel-heading span.filter', function (e) {
                    var $this = $(this),
                            $panel = $this.parents('.panel');

                    $panel.find('.panel-body').slideToggle();
                    if ($this.css('display') != 'none') {
                        $panel.find('.panel-body input').focus();
                    }
                });
                $('[data-toggle="tooltip"]').tooltip();
            })
        </script>
    </body>
</html>
