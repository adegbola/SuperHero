<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Sighting</title>
        <!-- Bootstrap core CSS -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">        
    </head>
    <body>
        <div class="container">
            <h1>Sighting</h1>
            <hr/>
            <div class="navbar">
                <ul class="nav nav-tabs">
                    <li role="presentation" 
                        class="active">
                        <a href="${pageContext.request.contextPath}/index.jsp">
                            Home
                        </a>
                    </li>
                    <li role="presentation">
                        <a href="${pageContext.request.contextPath}/displaySuperhero">
                            SuperHero
                        </a>
                    </li>
                    <li role="presentation"
                        class="active">
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



            <h2>Sighting</h2>

            <table id="superHeroTable" class="table table-hover">
                <tr>
                    <th width="20%">Date</th>
                    <th width="35%">Location</th>
                    <th width="35%">Hero</th>

                </tr>
                <c:forEach var="currentSighting" items="${SightingList}">
                    <tr>
                        <td>${currentSighting.sightingDate}</td>
                        <td>${currentSighting.locationId}</td>
                        <td>${currentSighting.superheroId}</td>
                        <td>
                            <a href="displayEditSightingForm?sightingId=${currentSighting.sightingId}">
                                Edit
                        </td>
                        <td>
                            <a href="deleteSighting?sightingId=${currentSighting.sightingId}">
                                Delete
                        </td>
                    </tr>
                </c:forEach>
            </table>

            <div class="row">
                <div class="col-md-6">

                    <form method="post"
                          action="createSighting">
                        <div class="form-group">
                            <label class="control-label">Hero</label>
                            <select class="form-control" name="superheroId">
                                <c:forEach var="currentSighting" items="${SuperheroList}">
                                    <option value="${currentSighting.superheroId}">${currentSighting.firstName}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="form-group"> 
                            <label class="control-label">Location</label>
                            <select class="form-control" name="locationId">
                                <c:forEach var="currentLocation" items="${LocationList}">                      
                                    <option value="${currentLocation.locationId}">${currentLocation.locationDescription}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="form-group"> 
                            <label class="control-label" for="date">Date</label>
                            <input class="form-control" id="sightingDate" name="sightingDate" placeholder="YYYY/MM/DD" type="date"/>
                        </div>
                        <div class="form-group"> 
                            <button class="btn btn-primary " name="submit" type="submit">Create Sighting</button>
                        </div>
                    </form>
                </div>
            </div>

        </div>

        <!-- Placed at the end of the document so the pages load faster -->
        <script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

    </body>
</html>

