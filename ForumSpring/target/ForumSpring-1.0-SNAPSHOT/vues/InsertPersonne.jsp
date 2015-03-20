<%-- 
    Document   : InsertPersonne
    Created on : 31 janv. 2015, 15:04:41
    Author     : anthony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="sec" uri = "http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>  
        <title>JSP Page</title>
    </head>
    <body>
        <div class="displayUsers"> </div>
        <form:form id="newUserForm" action="InsertPersonneTrue.json" method="POST" modelAttribute ="users">
            <label> Username </label>
            <form:input path="username" placeholder="Votre nom ou pseudo" />
            <label> Password </label>
            <form:input path="password" type="password" placeholder="Votre password" />
            <input type="submit" value="S'inscrire au forum">   
        </form:form>

        <script>
            $(document).ready(function () {
                $('#newUserForm').submit(function (event) {
                    var username = $('#username').val();
                    var password = $('#password').val();
                    var json = {"username": username, "password": password};
                    $.ajax({
                        headers: {
                            'Accept': 'application/json',
                            'Content-Type': 'application/json'
                        },
                        url: $("#newUserForm").attr( "action"),
                        data: JSON.stringify(json),
                        type: 'POST',
                        beforeSend: function (xhr) {
                            xhr.setRequestHeader("Accept", "application/json");
                            xhr.setRequestHeader("Content-Type", "application/json");
                        },
                        success: function (users) {
                            var respContent = "";
                            respContent += "<span class='success'>Un nouvelle utilisateur a ete  crée: [";
                            respContent += users.username + " : ";
                            respContent += users.password + "]</span>";
                            $('#displayUsers').html(respContent);
                        },
                        error : function(){
                            alert("Une erreur s'est produite lors de l'envoi des données");
                        }

                    });
                    event.preventDefault();

                });

            });
        </script>
    </body>
</html>

