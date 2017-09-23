<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Location</title>
        <!-- Bootstrap core CSS -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">        
    </head>
    <body>
        <div class="container">
            <h1>Location</h1>
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
                            SuperHeroes
                        </a>
                    </li>
                    <li role="presentation">
                        <a href="${pageContext.request.contextPath}/displaySighting">
                            Sighting
                        </a>
                    </li>
                    <li role="presentation">
                        <a href="${pageContext.request.contextPath}/displayOrganization">
                            Organization
                        </a>
                    </li>
                    <li role="presentation"
                           class="active">
                     
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
                    <h2>Location</h2>
                    
                    <table id="superHeroTable" class="table table-hover">
                        <tr>
                            <th width="15%">location Name</th>
                            <th width="35%">Location Description</th>
                            <th width="35%">location Address</th>
                            <th width="10%">longitude</th>
                            <th width="10%">latitude</th>
                            <th width="5%"></th>
                        </tr>
                    
                    <c:forEach var="currentLocation" items="${LocationList}">
                        <tr>
                            <td>
                                <a href="displayLocationDetails?locationId=${currentLocation.locationId}">
                                <c:out value="${currentLocation.locationName}"/> 
                            </td>
                            <td>
                                <c:out value="${currentLocation.locationDescription}"/>
                            </td>
                            <td>
                                <c:out value="${currentLocation.locationAddress}"/>
                            </td>
                             <td>
                                <c:out value="${currentLocation.longitude}"/>
                            </td>
                             <td>
                                <c:out value="${currentLocation.latitude}"/>
                            </td>
                            <td>
                                <a href="displayEditLocationForm?locationId=${currentLocation.locationId}">
                                Edit
                            </td>
                            <td>
                                 <a href="deleteLocation?locationId=${currentLocation.locationId}">
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
                        <h2>Add New Location</h2>
                        <form class="form-horizontal" 
                              role="form" method="POST" 
                              action="createLocation">
                            <div class="form-group">
                                <label for="add-location-name" class="col-md-4 control-label">Location Name:</label>
                                <div class="col-md-8">
                                    <input type="text" class="form-control" name="locationName" placeholder="Location Name"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="add-location-description" class="col-md-4 control-label">Location Description:</label>
                                <div class="col-md-8">
                                    <input type="text" class="form-control" name="LocationDescription" placeholder="Location Description"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="add-Address" class="col-md-4 control-label">Location Address:</label>
                                <div class="col-md-8">
                                    <input type="text" class="form-control" name="locationAddress" placeholder="Address:"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="add-longitude" class="col-md-4 control-label">Longitude</label>
                                <div class="col-md-8">
                                    <input type="text" class="form-control" name="longitude" placeholder="Longitude"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="add-latitude" class="col-md-4 control-label">Latitude</label>
                                <div class="col-md-8">
                                    <input type="text" class="form-control" name="latitude" placeholder="Latitude"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-offset-4 col-md-8">
                                    <input type="submit" class="btn btn-default" value="Create Location"/>
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

