<%-- 
    Document   : createTopics
    Created on : 14 févr. 2015, 14:57:21
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
        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="menu.jsp"></jsp:include><br />
            <div class="container">
                <div class="row">
                    <div class="col-sm-10 col-sm-offset-1 white-background" id="logout">

                        <div class="alert alert-success" id="topicFormResponse"></div>

                        <div class="alert alert-info" role="alert" id="alert-info-top">Creez votre propre topics, la communauté participera avec grand intéret ! </div>

                        <form  class="form-horizontal" id="TopicsForm" role="form"> 
                            <div class="form-group">
                                <label for="uploadMedia" class="col-sm-2 control-label">Nom de votre sujet </label>
                                <div class="col-sm-10">                    
                                    <div class="input-group">

                                        <input type="text" class="form-control" name="topic_nom" id="uploadMedia">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="uploadMedia" class="col-sm-2 control-label">Votre pseudo  </label>
                                <div class="col-sm-10">                    
                                    <div class="input-group">

                                        <input type="text" class="form-control" name="username" value="<sec:authentication property="principal.username"/>" id="uploadMedia"/>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="email" class="col-sm-2 control-label">Description de votre sujet </label>
                            <div class="col-sm-6">
                                <textarea class="form-control" name="topic_description" id="addComment" rows="5"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="type_topic" class="col-sm-2 control-label">Type de votre fil de discussion </label>
                            <div class="col-sm-10 col-lg-offset-2">
                                <label class="radio-inline">
                                    <input type="radio" name="type_topic" value="Privé">Privé
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="type_topic" value="Public">Public
                                </label>
                                
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="email" class="col-sm-2 control-label">Selectionnez une catégorie</label>
                            <div class="col-sm-6">
                                <select name="cat_id"   class="form-control multiselect multiselect-icon"  >
                                    <c:forEach items="${categorie}" var="categorie" >
                                        <option value="${categorie.cat_id} ">${categorie.cat_nom}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">                    
                                <button class="btn btn-success btn-circle text-uppercase" type="submit" id="submitComment"><span class="glyphicon glyphicon-send"></span> Valider</button>
                            </div>
                        </div>            
                    </form>
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
        <script>

            $(document).ready(function () {
                $('#TopicsForm').submit(function (e) {

                    // will pass the form data using the jQuery serialize function
                    $.post('${pageContext.request.contextPath}/InsertTopicsBdd', $(this).serialize(), function (response) {
                        setTimeout("jQuery('#TopicsForm').fadeOut();", 1500);
                        $('#alert-info-top').hide();
                        $('#topicFormResponse').text(response);

                    });

                    e.preventDefault(); // prevent actual form submit and page reload
                });
            });

        </script>
    </body>
</html>
