<%-- 
    Document   : ListePersonne
    Created on : 31 janv. 2015, 14:49:49
    Author     : anthony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix ="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
        <link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="row">
            <div class="container">
                <div class="col-lg-12">
                    <h1>Liste des utilisateurs ! Vous êtes identifié comme étant : ${id}</h1>

                    <table class="table table-hover " >
                        <thead>
                            <tr>
                                <th>Nom</th>
                                <th>Password</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${personne}" var="perso">
                                <tr>
                                    <td class="text-success"><c:out value="${perso.username}"/></td>
                                    <td class="text-success"><c:out value="${perso.password}"/></td>
                                </tr>
                            <br>
                        </c:forEach>
                        </tbody>
                    </table>

                </div>
            </div>
        </div>


    </body>
</html>
