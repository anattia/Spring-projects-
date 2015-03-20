<%-- 
    Document   : menu
    Created on : 7 févr. 2015, 20:39:30
    Author     : anthony
--%>
<%@taglib prefix="sec" uri = "http://www.springframework.org/security/tags" %>
<%@taglib  prefix ="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<nav class="navbar navbar-fixed-left navbar-minimal animate" role="navigation">
    <div class="navbar-toggler animate">
        <span class="menu-icon"></span>
    </div>
    <ul class="navbar-menu animate">
        <li>
            <a href="/ForumSpring/" class="animate">
                <span class="desc animate"> Acceuil </span>
                <span class="glyphicon glyphicon-home"></span>
            </a>
        </li>
        <sec:authorize ifNotGranted = "ROLE_ADMIN,ROLE_USER">
            <li>
                <a href="<c:url value="/connexion_login"/>" class="animate"> 
                    <span class="desc animate"> Inscription </span>
                    <span class="glyphicon glyphicon-user"></span>
                </a>
            </li>
        </sec:authorize>
        <sec:authorize ifAnyGranted = "ROLE_USER,ROLE_ADMIN">
            <c:url value="/Profile" var ="profilLink">

            </c:url>
            <li>
                <a href="${profilLink}?username=<sec:authentication property="principal.username"/>" class="animate">
                    <span class="desc animate"> Mon compte </span>
                    <span class="glyphicon glyphicon-user"></span>
                </a>
            </li>
        </sec:authorize>

        <li>
            <a href="/ForumSpring/ListeTopicsAll" class="animate">
                <span class="desc animate"> Afficher tous les sujets </span>
                <span class="glyphicon glyphicon-list"></span>
            </a>
        </li>
        <li>
            <a href="Topics/CreateTopics" class="animate">
                <span class="desc animate"> Creer votre propre forum !  </span>
                <span class="glyphicon glyphicon-upload"></span>
            </a>
        </li>
    </ul>
</nav>
