<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- Directive for Spring Form tag libraries -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
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
            <h1>Edit Location</h1>
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
            <sf:form class="form-horizontal" role="form" modelAttribute="location"
                     action="editLocation" method="POST">
                <div class="form-group">
                    <label for="add-location-name" class="col-md-4 control-label">Location Name:</label>
                    <div class="col-md-4">
                        <sf:input type="text" class="form-control" id="add-location-name"
                                  path="locationName" placeholder="Location Name"/>
                        <sf:errors path="locationName" cssclass="error"></sf:errors>
                    </div>
                </div>
                    <div class="form-group">
                
                    <div class="col-md-4">
                        <sf:input type="hidden" class="form-control" id="add-location-name"
                                  path="locationId" />
                       
                    </div>
                </div>
                <div class="form-group">
                    <label for="add-location-description" class="col-md-4 control-label">Location Description:</label>
                    <div class="col-md-4">
                        <sf:input type="text" class="form-control" id="add-location-description"
                                  path="LocationDescription" placeholder="Location Description"/>
                        <sf:errors path="LocationDescription" cssclass="error"></sf:errors>
                    </div>
                </div>
                <div class="form-group">
                    <label for="add-Address" class="col-md-4 control-label">Location Address:</label>                          
                    <div class="col-md-4">
                        <sf:input type="text" class="form-control" id="add-Address"
                                  path="locationAddress" placeholder="Location Address"/>
                        <sf:errors path="locationAddress" cssclass="error"></sf:errors>
                    </div>
                </div>
                <div class="form-group">
                    <label for="add-longitude" class="col-md-4 control-label">Longitude</label>
                    <div class="col-md-4">
                        <sf:input type="text" class="form-control" id="add-longitude"
                                  path="longitude" placeholder="Longitude"/>
                        <sf:errors path="longitude" cssclass="error"></sf:errors>
                    </div>
                </div>
                    <div class="form-group">
                    <label for="add-latitude" class="col-md-4 control-label">Latitude</label>
                    <div class="col-md-4">
                        <sf:input type="text" class="form-control" id="add-latitude"
                                  path="latitude" placeholder="Latitude"/>
                        <sf:errors path="latitude" cssclass="error"></sf:errors>
                    </div>
                </div>
              
              
                <div class="form-group">
                    <div class="col-md-offset-4 col-md-8">
                        <input type="submit" class="btn btn-default" value="Update Location"/>
                    </div>
                </div>
            </sf:form>                
        </div>
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

    </body>
</html>