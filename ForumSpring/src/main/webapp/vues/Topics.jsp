<%-- 
    Document   : tableTest
    Created on : 2 mars 2015, 20:55:13
    Author     : anthony
--%>

<%@taglib  prefix ="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="sec" uri = "http://www.springframework.org/security/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
        <link href="<c:url value="/resources/css/cat.css" />" rel="stylesheet">
        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
        <link href="<c:url value="/resources/css/menu.css" />" rel="stylesheet">
    </head>



    <body>
        <jsp:include page="menu.jsp" /><br />
        <div class="container">
            <h1>Cliquer sur l'icone de filtrage <small>(<i class="glyphicon glyphicon-filter"></i>)</small></h1>
            <div class="row">
                <div class="col-md-12 col-sm-12 white-background">
                    <jsp:include page ="include/welcome.jsp"></jsp:include>
                    <sec:authorize ifNotGranted="ROLE_USER">
                        <button type="button" class="btn btn-success" data-toggle="modal" data-target=".bs-example-modal-lg">Creer votre propre forum</button>
                    </sec:authorize>
                    <sec:authorize ifAnyGranted ="ROLE_USER,ROLE_ADMIN">
                        <a href="/ForumSpring/Topics/CreateTopics">    
                            <button type="button" class="btn btn-success">Creer votre propre forum</button> 
                        </a>
                    </sec:authorize> <br /> 
                    <div class="panel panel-primary" style="margin-top: 50px;">
                        <div class="panel-heading">
                            <h3 class="panel-title">Developers</h3>
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
                                    <th style="color:black;">Réponses</th>
                                    <th style="color:black;">Crée le : </th>
                                    <th style="color:black;">Crée par : </th>
                                    <th style="color:black;">Dernière réponse : </th>
                                    <th style="color:black;">Accès : </th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${ListTopics}" var="top">
                                    <c:url value="/Topics/ListComment" var ="topicLink">
                                        <c:param name="topic_id" value="${top.topic_id}"/>
                                        <c:param name="cat_nom" value="${top.topic_nom}"/>
                                        <c:param name="cat_id" value="${top.cat_id}"/>


                                    </c:url>
                                    <c:if test="${top.validation == 1}">
                                    <tr>
                                        <c:if test = "${top.type_topic == 'Public'}">
                                            <td class="text-success"><a href="${topicLink}">${top.topic_nom}</a></td>
                                            </c:if>
                                            <c:if test = "${top.type_topic == 'Privé'}">
                                                <sec:authorize ifNotGranted ="ROLE_USER,ROLE_ADMIN">
                                                <td class="text-success"><a href="<c:url value="/connexion_login?action=discussPrivate"/>">${top.topic_nom}</a></td>
                                                </sec:authorize>
                                                <sec:authorize ifAnyGranted = "ROLE_USER,ROLE_ADMIN">
                                                <td class="text-success"><a href="${topicLink}">${top.topic_nom}</a></td>
                                                </sec:authorize>
                                            </c:if>
                                        <td class="text-success"><c:out value="${top.topic_nombre_reponse}"/></td>
                                        <td class="text-success"><fmt:formatDate  type="both" 
                                                         dateStyle="medium" timeStyle="medium" 
                                                         value="${top.date_creation}"/></td>
                                        <td class="text-success"><c:out value="${top.username}"/></td>
                                        <td class="text-primary"><fmt:formatDate  type="both" 
                                                         dateStyle="medium" timeStyle="medium" 
                                                         value="${top.topic_date_der_reponse}"/> par <p class="text-warning">'<c:out value="${top.topic_auteur_der_reponse}"/></p></td>

                                        <td class="text-success"><c:out value="${top.type_topic}"/></td>

                                    </tr>
                                    </c:if>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>

            </div>
        </div>

        <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
            <div class="modal-backdrop fade in" style="height: 2099px;"></div>
            <div id="login-overlay" class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">fermer</span></button>
                        <h4 style="color:black;" class="modal-title" id="myModalLabel">Se connecter au forum !</h4>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-xs-6">
                                <div class="well">
                                    <form id="loginForm" method="POST" action="<c:url value='/j_spring_security_check' />" novalidate="novalidate">
                                        <div class="form-group">
                                            <label for="username" style="color:black;" class="control-label">Username</label>
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
                                <p class="lead" style="color:black;">Inscrivez vous <span class="text-success">GRATUITEMENT </span></p>
                                <ul class="list-unstyled" style="line-height: 2">
                                    <li style="color:black;"><span class="glyphicon glyphicon-ok"></span> Participez au fil de discussion</li>
                                    <li style="color:black;"><span class="glyphicon glyphicon-ok"></span> Creez votre propre forum</li>
                                    <li style="color:black;"><span class="glyphicon glyphicon-ok"></span> Parametrage de votre profil </li>
                                    <li style="color:black;"><a href="/read-more/"><u>En savoir plus </u></a></li>
                                </ul>
                                <p><a href="/new-customer/" class="btn btn-info btn-block">Oui! , S'inscrire maintenant ! </a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>



        <script src="<c:url value="/resources/js/jquery.js" />"></script>
        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
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
            });
        </script>
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