<%-- 
    Document   : TopicsCommentTest
    Created on : 4 févr. 2015, 00:22:10
    Author     : anthony
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix ="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="row">
            <div class="panel panel-default widget">
                <div class="panel-heading">
                    <span class="glyphicon glyphicon-comment"></span>
                    <h3 class="panel-title">
                        Recent Comments</h3>
                    <span class="label label-info">
                        78</span>
                </div>
                <div class="panel-body">
                    <ul class="list-group">
                        <li class="list-group-item">
                            <div class="row">
                                <div class="col-xs-2 col-md-1">
                                    <img src="http://placehold.it/80" class="img-thumbnail img-responsive" alt="" /></div>
                                <div class="col-xs-6 col-md-6">
                                    <div>
                                        <a href="http://www.jquery2dotnet.com/2013/10/google-style-login-page-desing-usign.html">
                                            Google Style Login Page Design Using Bootstrap</a>
                                        <div class="mic-info">
                                            By: <a href="#">Bhaumik Patel</a> on 2 Aug 2013
                                        </div>
                                    </div>
                                    <div class="comment-text">
                                        Awesome design
                                    </div>
                                    <div class="action">
                                        <button type="button" class="btn btn-primary btn-xs" title="Edit">
                                            <span class="glyphicon glyphicon-pencil"></span>
                                        </button>
                                        <button type="button" class="btn btn-success btn-xs" title="Approved">
                                            <span class="glyphicon glyphicon-ok"></span>
                                        </button>
                                        <button type="button" class="btn btn-danger btn-xs" title="Delete">
                                            <span class="glyphicon glyphicon-trash"></span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </li>

                    </ul>
                    <a href="#" class="btn btn-primary btn-sm btn-block" role="button"><span class="glyphicon glyphicon-refresh"></span> More</a>
                </div>
            </div>
        </div>

    </body>
</html>
