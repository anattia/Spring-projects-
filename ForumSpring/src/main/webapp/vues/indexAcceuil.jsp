<%-- 
    Document   : index
    Created on : 3 févr. 2015, 23:16:31
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
        <link href="<c:url value="/resources/css/menu.css" />" rel="stylesheet">
        <link href="<c:url value="/resources/css/cat.css" />" rel="stylesheet">
        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
        <title>JSP Page</title>
    </head>
    <body>

        <jsp:include page="menu.jsp" /><br />
        <div class="container-fluid">
            <div class="container container-pad" id="property-listings" >

                <div class="row">
                    <div class="col-md-12 white-background">
                        <jsp:include page="include/welcome.jsp"></jsp:include>

                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-12 white-background"> 
                        
                        <c:forEach items="${categorie}" var ="cat">
                            <c:url value="/Categorie/${cat.cat_nom}/ListeTopics" var ="categorieLink">
                                <c:param name="cat_id" value="${cat.cat_id}"/>
                                <c:param name="cat_nom" value="${cat.cat_nom}"/>
                            </c:url>
                            <!-- Begin Listing: 609 W GRAVERS LN-->
                            <div class="brdr bgc-fff pad-12 box-shad btm-mrg-20 property-listing">
                                <div class="media">
                                    <a class="pull-left" href="#" target="_parent">
                                        <img alt="image" class="img-responsive" src="<c:url value="/resources/images/${cat.cat_nom}.jpg"/>"/></a>

                                    <div class="clearfix visible-sm"></div>

                                    <div class="media-body fnt-smaller">
                                        <a href="#" target="_parent"></a>

                                        <h4 class="media-heading">
                                            <a href="${categorieLink}">${cat.cat_nom} <small class="pull-right">Voir les sujets ! </small></a></h4>


                                        <ul class="list-inline mrg-0 btm-mrg-10 clr-535353">
                                            <li>${cat.cat_nombre_topics} Sujets</li>

                                            <li style="list-style: none">|</li>

                                            <li>${cat.cat_nombre_commentaire} Réponses</li>


                                        </ul>

                                        <p class="hidden-xs">

                                        </p><span class="fnt-smaller fnt-lighter fnt-arial"></span>
                                    </div>
                                </div>
                            </div><!-- End Listing-->
                        </c:forEach>

                    </div><!-- End Col -->
                </div><!-- End row -->
            </div><!-- End container -->
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
