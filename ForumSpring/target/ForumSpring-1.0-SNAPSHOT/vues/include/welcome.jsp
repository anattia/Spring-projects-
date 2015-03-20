<%-- 
    Document   : welcome
    Created on : 3 mars 2015, 21:20:14
    Author     : anthony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix ="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="sec" uri = "http://www.springframework.org/security/tags" %>
<h1 class="title">Forum de discussions générales </h1>
<sec:authorize ifAllGranted="ROLE_USER">

    <div class="msg msg-info">
        <h3> Bonjour <sec:authentication property="principal.username"/> </h3>
        <a href="/ForumSpring/logout"><h5> Déconnexion </h5></a>
    </div>
</sec:authorize>

<sec:authorize ifAllGranted="ROLE_ADMIN">

    <div class="msg msg-info">
        <h3> Bonjour Administrateur </h3>
        <a href="/ForumSpring/logout"><h5> Déconnexion  </h5></a>
    </div>

</sec:authorize>

<sec:authorize ifNotGranted="ROLE_USER,ROLE_ADMIN">

    <div class="msg msg-info">
        <h3> Bonjour Visiteur ! </h3>
        <a href="/ForumSpring/connexion_login"><h5> Connexion / Inscription </h5></a>
    </div>
</sec:authorize>
