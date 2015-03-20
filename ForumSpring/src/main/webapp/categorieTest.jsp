<%-- 
    Document   : categorieTest
    Created on : 21 févr. 2015, 15:50:25
    Author     : anthony
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">







        <title>Topics - Forum</title>
    </head>
    <body>
        <div class="container-fluid">
            <div class="container container-pad" id="property-listings">

                <div class="row">
                    <div class="col-md-12">
                        <h1>Million Dollar Home Listings</h1>
                        <p>A snippet I recently used to display homes for a local brokerage.  Focused more on images when accessed through mobile</p>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-6"> 
                        <c:forEach items="${categorie}" var ="cat">
                            <c:url value="/Categorie/${cat.cat_nom}/ListeTopics" var ="categorieLink">
                                <c:param name="cat_id" value="${cat.cat_id}"/>
                                <c:param name="cat_nom" value="${cat.cat_nom}"/>
                            </c:url>
                            <!-- Begin Listing: 609 W GRAVERS LN-->
                            <div class="brdr bgc-fff pad-10 box-shad btm-mrg-20 property-listing">
                                <div class="media">
                                    <a class="pull-left" href="#" target="_parent">
                                        <img alt="image" class="img-responsive" src="http://images.prd.mris.com/image/V2/1/Yu59d899Ocpyr_RnF0-8qNJX1oYibjwp9TiLy-bZvU9vRJ2iC1zSQgFwW-fTCs6tVkKrj99s7FFm5Ygwl88xIA.jpg"></a>

                                    <div class="clearfix visible-sm"></div>

                                    <div class="media-body fnt-smaller">
                                        <a href="#" target="_parent"></a>

                                        <h4 class="media-heading">
                                            <a href="${categorieLink}">${cat.cat_nom}>${cat.cat_nom} <small class="pull-right">Voir les sujets ! </small></a></h4>


                                        <ul class="list-inline mrg-0 btm-mrg-10 clr-535353">
                                            <li>${cat.cat_nombre_commentaire} Sujets</li>

                                            <li style="list-style: none">|</li>

                                            <li>${cat.cat_nombre_topics} Réponses</li>


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




    </body>




</html>

