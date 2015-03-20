<%-- 
    Document   : ListComment
    Created on : 9 févr. 2015, 16:04:09
    Author     : anthony
--%>
<%@taglib  prefix ="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sec" uri = "http://www.springframework.org/security/tags" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
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
        <title>Topics - Forum</title>
    </head>
    <body>
        <sql:setDataSource var="snapshot" driver="org.apache.derby.jdbc.ClientDriver"
                           url="jdbc:derby://localhost:1527/ForumGestion"
                           user="forum"  password="forum"/>



        <jsp:include page="menu.jsp"></jsp:include><br />
            <div class="container">

                <div class="row">
                    <div class="col-sm-12 col-sm-offset-0 white-background" id="logout">
                        <div class="page-header">

                        <jsp:include page ="include/welcome.jsp"></jsp:include>
                        <c:if test="${!empty success}"> 
                            <div class="alert alert-success">
                                <p> ${success} </p>  
                            </div>
                        </c:if>



                    </div>
                    <div class="comment-tabs">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="active"><a href="#comments-logout" role="tab" data-toggle="tab"><h4 class="reviews text-capitalize">Discussion </h4></a></li>
                            <li><a href="#add-comment" role="tab" data-toggle="tab"><h4 class="reviews text-capitalize">Ajouter un commentaire</h4></a></li>
                            <li><a href="#account-settings" role="tab" data-toggle="tab"><h4 class="reviews text-capitalize">Mon compte</h4></a></li>
                        </ul>            
                        <div class="tab-content">
                            <div class="tab-pane active" id="comments-logout">
                                <c:if test= "${empty ListComms}">
                                    <div class="alert alert-danger">
                                        <p> Aucun commentaire </p>
                                    </div>
                                </c:if>

                                <c:forEach items ="${ListTop}" var = "top">
                                    <ul class="media-list">
                                        <li class="media">
                                            <a class="pull-left" href="#">
                                                <img class="media-object img-circle" src="${pictureP}" alt="profile">
                                            </a>
                                            <div class="media-body">
                                                <div class="well well-lg">
                                                    <h4 class="media-heading text-uppercase reviews">${top.username} </h4>
                                                    <h6 class="media-heading" style="color: red"> Sujet : ${top.topic_nom}</h6><br />
                                                    <ul class="media-date text-uppercase reviews list-inline">
                                                        <li class="dd" style="color:red;">Topic crée le <fmt:formatDate type="date" value="${top.date_creation}"/></li>
                                                    </ul>
                                                    <p class="media-comment">
                                                        <c:out value="${top.topic_description}"/> ${typeTopic}
                                                    </p>
                                                    <a class="btn btn-info btn-circle text-uppercase" href="#" id="reply"><span class="glyphicon glyphicon-share-alt"></span> Repondre</a>
                                                    <a class="btn btn-warning btn-circle text-uppercase" data-toggle="collapse" href="#replyOne"><span class="glyphicon glyphicon-comment"></span> ${top.topic_nombre_reponse} commentarie(s) </a>
                                                </div>              
                                            </div>

                                        </li>          


                                    </ul> 
                                </c:forEach>
                                <c:if test="${typeTopic == 'Privé'}">
                                    <sec:authorize ifNotGranted = "ROLE_USER">
                                        <div class="alert alert-warning">
                                            <p> Vous n'avez pas accès au forum privé </p>
                                        </div>
                                    </sec:authorize>
                                </c:if>
                                <c:if test="${typeTopic == 'Privé'}">
                                    <sec:authorize ifAllGranted = "ROLE_USER">
                                        <c:forEach items="${ListComms}" var="comms">
                                            <sql:query dataSource="${snapshot}" var="result">
                                                SELECT * from USERS where username = '${comms.username}'
                                            </sql:query>
                                            <ul class="media-list">
                                                <li class="media">
                                                    <c:forEach var="row" items="${result.rows}">
                                                        <c:if test="${ row.picutre != 0}">
                                                            <a class="pull-left" href="#">
                                                                <img class="media-object img-circle" src="${row.picture}" alt="profile">
                                                            </a>
                                                        </c:if>
                                                        <c:if test="${empty row.picture}">
                                                            <a class="pull-left" href="#">
                                                                <img class="media-object img-circle" src="<c:url value="/resources/images/avatar.png"/>" alt="profile">
                                                            </a>
                                                        </c:if>
                                                    </c:forEach>
                                                    <div class="media-body">
                                                        <div class="well well-lg">
                                                            <h4 class="media-heading text-uppercase reviews" id="username_ti">${comms.username} </h4>
                                                            <ul class="media-date text-uppercase reviews list-inline">
                                                                <fmt:formatDate type="both" 
                                                                                dateStyle="long" timeStyle="long" value="${comms.comment_date_details}"  />
                                                                <li class="dd"><fmt:formatDate type="date" value="${comms.comment_date}"/></li>
                                                            </ul>
                                                            <p class="media-comment"></p>
                                                            <c:if test="${comms.validation == 0}"> 
                                                                <div class="alert alert-warning">
                                                                    <ul>
                                                                        <li> Ce commentaire est en attente de validation </li>
                                                                    </ul>
                                                                </div>
                                                            </c:if>
                                                            <c:if test="${comms.validation == 1}"> 
                                                                <div class="alert alert-info">
                                                                    <p class="media-comment">
                                                                        ${comms.comment_text}
                                                                    </p>
                                                                </div>
                                                                <c:if test="${!empty comms.media}">
                                                                    <div class="embed-responsive embed-responsive-16by9">
                                                                        <iframe class="embed-responsive-item" src="${comms.media}" allowfullscreen></iframe>
                                                                    </div>
                                                                </c:if>

                                                            </c:if>
                                                            <sec:authorize ifAllGranted="ROLE_ADMIN">
                                                                <c:if test="${comms.validation == 0}"> 
                                                                    <div class="alert alert-success">
                                                                        <p class="media-comment">
                                                                            ${comms.comment_text}
                                                                        </p>
                                                                    </div>
                                                                </c:if>
                                                            </sec:authorize>


                                                            <a class="btn btn-info btn-circle text-uppercase" href="#add-comment" role="tab" data-toggle="tab" id="reply"><span class="glyphicon glyphicon-share-alt"></span> Repondre</a>

                                                            <a class="btn btn-warning btn-circle text-uppercase" data-toggle="collapse" href="#replyOne"><span class="glyphicon glyphicon-warning-sign"></span>Signaler</a>

                                                            <sec:authorize ifAllGranted="ROLE_ADMIN">
                                                                <c:if test="${comms.validation == 0}"> 
                                                                    <a href="?action=add&comment_id=${comms.comment_id}&topic_id=${comms.topic_id}&cat_id=${comms.cat_id}" 
                                                                       class="btn btn-success btn-circle text-uppercase">
                                                                        <span class="glyphicon glyphicon-ok"></span> Valider </a>
                                                                    </c:if>
                                                                </sec:authorize>


                                                        </div>              
                                                    </div>
                                                    <div class="collapse" id="replyOne">
                                                        <ul class="media-list">
                                                            <li class="media media-replied">
                                                                <a class="pull-left" href="#">
                                                                    <img class="media-object img-circle" src="https://s3.amazonaws.com/uifaces/faces/twitter/ManikRathee/128.jpg" alt="profile">
                                                                </a>
                                                                <div class="media-body">
                                                                    <div class="well well-lg">
                                                                        <h4 class="media-heading text-uppercase reviews"><span class="glyphicon glyphicon-share-alt"></span> The Hipster</h4>
                                                                        <ul class="media-date text-uppercase reviews list-inline">
                                                                            <li class="dd">${comms.comment_date}</li>

                                                                        </ul>
                                                                        <p class="media-comment">
                                                                            Nice job Maria.
                                                                        </p>
                                                                        <a class="btn btn-info btn-circle text-uppercase" href="#" id="reply"><span class="glyphicon glyphicon-share-alt"></span> Reply</a>
                                                                    </div>              
                                                                </div>
                                                            </li>
                                                            <li class="media media-replied" id="replied">
                                                                <a class="pull-left" href="#">
                                                                    <img class="media-object img-circle" src="https://pbs.twimg.com/profile_images/442656111636668417/Q_9oP8iZ.jpeg" alt="profile">
                                                                </a>
                                                                <div class="media-body">
                                                                    <div class="well well-lg">
                                                                        <h4 class="media-heading text-uppercase reviews"><span class="glyphicon glyphicon-share-alt"></span> Mary</h4>
                                                                        <ul class="media-date text-uppercase reviews list-inline">
                                                                            <li class="dd">22</li>
                                                                            <li class="mm">09</li>
                                                                            <li class="aaaa">2014</li>
                                                                        </ul>
                                                                        <p class="media-comment">
                                                                            Thank you Guys!
                                                                        </p>
                                                                        <a class="btn btn-info btn-circle text-uppercase" href="#" id="reply"><span class="glyphicon glyphicon-share-alt"></span> Reply</a>
                                                                    </div>              
                                                                </div>
                                                            </li>
                                                        </ul>  
                                                    </div>
                                                </li>          


                                            </ul>

                                        </c:forEach>
                                    </sec:authorize>
                                </c:if>
                                <c:if test="${typeTopic == 'Public'}">
                                    <c:forEach items="${ListComms}" var="comms">
                                        <sql:query dataSource="${snapshot}" var="result">
                                            SELECT * from USERS where username = '${comms.username}'
                                        </sql:query>
                                        <ul class="media-list">
                                            <li class="media">
                                                <c:forEach var="row" items="${result.rows}">
                                                    <c:if test="${ row.picutre != 0}">
                                                        <a class="pull-left" href="#">
                                                            <img class="media-object img-circle" src="${row.picture}" alt="profile">
                                                        </a>
                                                    </c:if>
                                                    <c:if test="${empty row.picture}">
                                                        <a class="pull-left" href="#">
                                                            <img class="media-object img-circle" src="<c:url value="/resources/images/avatar.png"/>" alt="profile">
                                                        </a>
                                                    </c:if>
                                                </c:forEach>
                                                <div class="media-body">
                                                    <div class="well well-lg">
                                                        <h4 class="media-heading text-uppercase reviews" id="username_ti">${comms.username} </h4>
                                                        <ul class="media-date text-uppercase reviews list-inline">
                                                            <fmt:formatDate type="both" 
                                                                            dateStyle="long" timeStyle="long" value="${comms.comment_date_details}"  />
                                                            <li class="dd"><fmt:formatDate type="date" value="${comms.comment_date}"/></li>
                                                        </ul>
                                                        <p class="media-comment"></p>
                                                        <c:if test="${comms.validation == 0}"> 
                                                            <div class="alert alert-warning">
                                                                <ul>
                                                                    <li> Ce commentaire est en attente de validation </li>
                                                                </ul>
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${comms.validation == 1}"> 
                                                            <div class="alert alert-info">
                                                                <p class="media-comment">
                                                                    ${comms.comment_text}
                                                                </p>
                                                            </div>
                                                            <c:if test="${!empty comms.media}">
                                                                <div class="embed-responsive embed-responsive-16by9">
                                                                    <iframe class="embed-responsive-item" src="${comms.media}" allowfullscreen></iframe>
                                                                </div>
                                                            </c:if>

                                                        </c:if>
                                                        <sec:authorize ifAllGranted="ROLE_ADMIN">
                                                            <c:if test="${comms.validation == 0}"> 
                                                                <div class="alert alert-success">
                                                                    <p class="media-comment">
                                                                        ${comms.comment_text}
                                                                    </p>
                                                                </div>
                                                            </c:if>
                                                        </sec:authorize>


                                                        <a class="btn btn-info btn-circle text-uppercase" href="#add-comment" role="tab" data-toggle="tab" id="reply"><span class="glyphicon glyphicon-share-alt"></span> Repondre</a>

                                                        <a class="btn btn-warning btn-circle text-uppercase" data-toggle="collapse" href="#replyOne"><span class="glyphicon glyphicon-warning-sign"></span>Signaler</a>

                                                        <sec:authorize ifAllGranted="ROLE_ADMIN">
                                                            <c:if test="${comms.validation == 0}"> 
                                                                <a href="?action=add&comment_id=${comms.comment_id}&topic_id=${comms.topic_id}&cat_id=${comms.cat_id}" 
                                                                   class="btn btn-success btn-circle text-uppercase">
                                                                    <span class="glyphicon glyphicon-ok"></span> Valider </a>
                                                                </c:if>
                                                            </sec:authorize>


                                                    </div>              
                                                </div>
                                                <div class="collapse" id="replyOne">
                                                    <ul class="media-list">
                                                        <li class="media media-replied">
                                                            <a class="pull-left" href="#">
                                                                <img class="media-object img-circle" src="https://s3.amazonaws.com/uifaces/faces/twitter/ManikRathee/128.jpg" alt="profile">
                                                            </a>
                                                            <div class="media-body">
                                                                <div class="well well-lg">
                                                                    <h4 class="media-heading text-uppercase reviews"><span class="glyphicon glyphicon-share-alt"></span> The Hipster</h4>
                                                                    <ul class="media-date text-uppercase reviews list-inline">
                                                                        <li class="dd">${comms.comment_date}</li>

                                                                    </ul>
                                                                    <p class="media-comment">
                                                                        Nice job Maria.
                                                                    </p>
                                                                    <a class="btn btn-info btn-circle text-uppercase" href="#" id="reply"><span class="glyphicon glyphicon-share-alt"></span> Reply</a>
                                                                </div>              
                                                            </div>
                                                        </li>
                                                        <li class="media media-replied" id="replied">
                                                            <a class="pull-left" href="#">
                                                                <img class="media-object img-circle" src="https://pbs.twimg.com/profile_images/442656111636668417/Q_9oP8iZ.jpeg" alt="profile">
                                                            </a>
                                                            <div class="media-body">
                                                                <div class="well well-lg">
                                                                    <h4 class="media-heading text-uppercase reviews"><span class="glyphicon glyphicon-share-alt"></span> Mary</h4>
                                                                    <ul class="media-date text-uppercase reviews list-inline">
                                                                        <li class="dd">22</li>
                                                                        <li class="mm">09</li>
                                                                        <li class="aaaa">2014</li>
                                                                    </ul>
                                                                    <p class="media-comment">
                                                                        Thank you Guys!
                                                                    </p>
                                                                    <a class="btn btn-info btn-circle text-uppercase" href="#" id="reply"><span class="glyphicon glyphicon-share-alt"></span> Reply</a>
                                                                </div>              
                                                            </div>
                                                        </li>
                                                    </ul>  
                                                </div>
                                            </li>          


                                        </ul>

                                    </c:forEach>
                                </c:if>
                            </div>
                            <div class="tab-pane" id="add-comment">
                                <sec:authorize ifAllGranted="ROLE_USER">
                                    <form action="/ForumSpring/AddComment" method="post" class="form-horizontal" id="commentForm" role="form"> 

                                        <input type="hidden" class="form-control" name="username" value="<sec:authentication property="principal.username"/>" id="uploadMedia">

                                        <input type="hidden" class="form-control" name="cat_id" id="uploadMedia" value="${cat_id}">
                                        <input type="hidden" class="form-control" name="topic_id" id="uploadMedia" value="${topic_id}">

                                        <div class="form-group">
                                            <label for="email" class="col-sm-2 control-label">Votre message </label>
                                            <div class="col-sm-10">
                                                <textarea class="form-control" name="comment_text" id="addComment" rows="5"></textarea>
                                            </div>
                                        </div>

                                        <div class="form-group">

                                            <label for="uploadMedia" class="col-sm-2 control-label">Upload media</label>
                                            <div class="col-sm-10">                    
                                                <div class="input-group">
                                                    <div class="input-group-addon">http://</div> 
                                                    <input type="text" class="form-control" name="media" id="uploadMedia">
                                                </div>
                                            </div>
                                        </div> 
                                        <div class="form-group">
                                            <div class="col-sm-offset-2 col-sm-10">                    
                                                <button class="btn btn-success btn-circle text-uppercase" type="submit" id="submitComment"><span class="glyphicon glyphicon-send"></span>J'envois </button>
                                            </div>
                                        </div>            
                                    </form>
                                </sec:authorize>
                                <sec:authorize ifNotGranted="ROLE_USER">
                                    <div class="alert alert-info">
                                        <p>Vous n'avez pas les droit nécessaires pour pouvoir participer au fil de discussion </p>
                                        <a href="<c:url value="/connexion_login"/>">S'identifier ou s'enregistrer</a>
                                    </div>
                                </sec:authorize>
                            </div><br />
                            <div class="tab-pane" id="account-settings">
                                <sec:authorize ifAllGranted = "ROLE_USER">
                                    <form action="#" method="post" class="form-horizontal" id="accountSetForm" role="form">
                                        <div class="form-group">
                                            <label for="avatar" class="col-sm-2 control-label">Avatar</label>
                                            <div class="col-sm-10">                                
                                                <div class="custom-input-file">
                                                    <label class="uploadPhoto">
                                                        Edit
                                                        <input type="file" class="change-avatar" name="avatar" id="avatar">
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="nickName" class="col-sm-2 control-label">Pseudonyme ou nom</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" name="nickName" id="nickName" value="<sec:authentication property="principal.username"/>">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="email" class="col-sm-2 control-label">Email</label>
                                            <div class="col-sm-10">
                                                <input type="email" class="form-control" name="email" id="email" value="<sec:authentication property="principal.enabled"/>" >
                                            </div>
                                        </div>  
                                        <div class="form-group">
                                            <label for="newPassword" class="col-sm-2 control-label">Nouveau password</label>
                                            <div class="col-sm-10">
                                                <input type="password" class="form-control" name="newPassword" id="newPassword">
                                            </div>
                                        </div> 
                                        <div class="form-group">
                                            <label for="confirmPassword" class="col-sm-2 control-label">Confirmez password</label>
                                            <div class="col-sm-10">
                                                <input type="password" class="form-control" name="confirmPassword" id="confirmPassword">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-offset-2 col-sm-10">                    
                                                <button class="btn btn-primary btn-circle text-uppercase" type="submit" id="submit">Save changes</button>
                                            </div>
                                        </div>            
                                    </form>
                                </sec:authorize>
                            </div>
                        </div>
                    </div>
                </div>
            </div><br />

        </div>
        <!-- jQuery -->
        <script src="<c:url value="/resources/js/jquery.js" />"></script>
        <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
        <script>
            $("#reply").click(function () {
                var text = $("#username_ti").text();
                $("#addComment").val("<b>" + text + "</b>");
            });
        </script>
        <script>
            $(function () {
                //  $('#myTab a:last').tab('show')
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