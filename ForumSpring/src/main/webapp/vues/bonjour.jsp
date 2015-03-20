<%-- 
    Document   : bonjour
    Created on : 31 janv. 2015, 11:19:15
    Author     : anthony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix ="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="row">
            <div class="container">
                <div class="col-lg-6">
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
                                <td><c:out value="${perso.username}"/></td>
                            <td><c:out value="${perso.password}"/></td>
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
