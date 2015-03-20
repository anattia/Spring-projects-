<%-- 
    Document   : Topics
    Created on : 3 févr. 2015, 23:26:00
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
        <title>Topics - Forum</title>
    </head>
    <body>
        <div class="container">

            <div class="col-lg-8">
                <div class="well">
                    <form action="" method="POST" id="formComment">
                        <div class="input-group">
                            <input id="formCommentInput" class="form-control input-sm " type="text" placeholder ="Publier un commentaire" />
                            <span class="input-group-btn" onclick="addComment()">     
                                <a href="#" class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-comment"></span> Add Comment</a>
                            </span>
                        </div>
                    </form>
                    <hr> 
                    <ul data-brackets-id="12674" id="sortable" class="list-unstyled ui-sortable">
                        <strong class="pull-left primary-font">James</strong>
                        <small class="pull-right text-muted">
                            <span class="glyphicon glyphicon-time"></span>7 mins ago</small>
                        </br>
                        <li class="ui-state-default">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. </li>
                        </br>
                        <li class="divider"></li>
                        <strong class="pull-left primary-font">Taylor</strong>
                        <small class="pull-right text-muted">
                            <span class="glyphicon glyphicon-time"></span>14 mins ago</small>
                        </br>
                        <li class="ui-state-default">Hey je pense que tu as tort ! </li>
                        </br>
                        <li class="divider"></li>
                        <strong class="pull-left primary-font" id="pseudo"></strong>
                        <small class="pull-right text-muted">
                            <span class="glyphicon glyphicon-time" id="time"></span></small>
                        </br>
                        <li class="ui-state-default" id ="ui-state-default"> </li>
                    </ul>

                </div>   
            </div>
        </div>

        <script>
            function addComment() {
                var recup = document.getElementById("formCommentInput").value;
                document.getElementById("ui-state-default").innerHTML = recup;
                document.getElementById("pseudo").innerHTML = 'anthony';
                document.getElementById("time").innerHTML = 'Il y a 25 mns';
            }
        </script>
    </body>
</html>
