<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
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



            <sf:form class="form-horizontal" role="form" modelAttribute="sighting"
                     action="editSighting" method="POST">
                <div class="form-group">
                    <label for="add-superheroId" class="col-md-4 control-label">SuperheroId:</label>
                    <div class="col-md-4">
                        <sf:input type="text" class="form-control" id="add-superheroId"
                                  path="superheroId" placeholder="SuperheroId"/>
                        <sf:errors path="superheroId" cssclass="error"></sf:errors>
                        </div>
                    </div>
                        
                        <div class="form-group">
                
                    <div class="col-md-4">
                        <sf:input type="hidden" class="form-control" id="add-SightingId"
                                  path="sightingId" />
                       
                    </div>
                </div>

                    <div class="form-group">
                        <label for="add-locationId" class="col-md-4 control-label">LocationId:</label>
                        <div class="col-md-4">
                        <sf:input type="text" class="form-control" id="add-LocationId"
                                  path="locationId" placeholder="LocationId"/>
                        <sf:errors path="locationId" cssclass="error"></sf:errors>
                        </div>
                    </div>
                    <div class="form-group">

                        <label for="add-date" class="col-md-4 control-label">Date:</label>                          
                        <div class="col-md-4">
                        <sf:input type="text" class="form-control" id="add-date"
                                  path="sightingDate" placeholder="Date"/>
                        <sf:errors path="sightingDate" cssclass="error"></sf:errors>
                        </div>
                    </div>


                    <div class="form-group">
                        <div class="col-md-offset-4 col-md-8">
                            <input type="submit" class="btn btn-default" value="Update Sighting"/>
                        </div>
                    </div>
            </sf:form>                
        </div>



        <!-- Placed at the end of the document so the pages load faster -->
        <script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

    </body>
</html>

