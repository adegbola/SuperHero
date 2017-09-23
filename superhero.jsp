<%-- 
    Document   : superhero
    Created on : Jul 25, 2017, 11:21:08 AM
    Author     : Kelsey
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 
    Add a col to hold the summary table - have it take up half the row 
-->


<html>
    <head>
        <title>SuperHero</title>
        <!-- Bootstrap core CSS -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">        
    </head>
    <body>
        <div class="container">
            <h1>SuperHero</h1>
            <hr/>
            <div class="navbar">
                <ul class="nav nav-tabs">
                    <li role="presentation">
                        
                        <a href="${pageContext.request.contextPath}/index.jsp">
                            Home
                        </a>
                    </li>
                    <li role="presentation"
                        class="active">
                        <a href="${pageContext.request.contextPath}/displaySuperhero">
                            Superhero
                        </a>
                    </li>
                    <li role="presentation">
                        <a href="${pageContext.request.contextPath}/displaySighting">
                            Sighting
                        </a>
                    </li>
                     <li role="presentation">
                        <a href="${pageContext.request.contextPath}/displayLocation">
                            Location
                        </a>
                    </li>
                    <li role="presentation">
                        <a href="${pageContext.request.contextPath}/displaySearchPage">
                            Search
                        </a>
                    </li>
                </ul>    
            </div>
            <!-- Main Page Content Start -->
            <div class="row">

                <div class="col-md-6">
                    <h2>My SuperHeroes</h2>
                    
                    <table id="superHeroTable" class="table table-hover">
                        <tr>
                            <th width="20%">SuperHeroName</th>
                            <th width="35%">Description</th>
                            <th width="35%">SuperPower</th>
                            <th width="10%"></th>
                        </tr>
                    
                    <c:forEach var="currentSuperhero" items="${SuperheroList}">
                        <tr>
                            <td>
                                <a href="displaySuperHeroDetails?superheroId=${currentSuperhero.superheroId}">
                                <c:out value="${currentSuperhero.firstName}"/> <c:out value="${currentSuperhero.lastName}"/>
                            </td>
                            <td>
                                <c:out value="${currentSuperhero.description}"/>
                            </td>
                            <td>
                                <c:out value="${currentSuperhero.superPower}"/>
                            </td>
                            <td>
                                <a href="displayEditSuperheroForm?superheroId=${currentSuperhero.superheroId}">
                                Edit
                            </td>
                            <td>
                                 <a href="deleteSuperhero?superheroId=${currentSuperhero.superheroId}">
                                Delete
                            </td>
                        </tr>
                    </c:forEach>
                    </table>  
                    <!-- 
                        Add col to hold the new contact form - have it take up the other 
                        half of the row
                    -->
                    <div class="col-md-8">
                        <h2>Add New SuperHero</h2>
                        <form class="form-horizontal" 
                              role="form" method="POST" 
                              action="createSuperhero">
                            <div class="form-group">
                                <label for="add-first-name" class="col-md-4 control-label">First Name:</label>
                                <div class="col-md-8">
                                    <input type="text" class="form-control" name="firstName" placeholder="First Name"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="add-last-name" class="col-md-4 control-label">Last Name:</label>
                                <div class="col-md-8">
                                    <input type="text" class="form-control" name="lastName" placeholder="Last Name"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="add-description" class="col-md-4 control-label">Description:</label>
                                <div class="col-md-8">
                                    <input type="text" class="form-control" name="Description" placeholder="Description:"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="add-superpower" class="col-md-4 control-label">SuperPower:</label>
                                <div class="col-md-8">
                                    <input type="superpower" class="form-control" name="superpower" placeholder="SuperPower:"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-offset-4 col-md-8">
                                    <input type="submit" class="btn btn-default" value="Create Superhero"/>
                                </div>
                            </div>

                        </form>

                    </div> <!-- End col div -->

                </div> <!-- End row div -->

                <!-- Main Page Content Stop -->    
            </div>











  

        <!-- Placed at the end of the document so the pages load faster -->
        <script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

    </body>
</html>