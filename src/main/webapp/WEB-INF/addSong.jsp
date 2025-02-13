<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Song</title>
</head>
<body>
    <h1>ADD SONG</h1>
    <form:form action="/songs/process/add" modelAttribute="song" method="post">
        <p>Title: <form:input path="title"/><form:errors path="title"/></p>
       	<!-- Select para elegir el artista -->
        <p>Select Artist: 
            <form:select path="artist.id">
                <c:forEach var="artist" items="${artists}">
    		<option value="${artist.id}">${artist.firstName} ${artist.lastName}</option>
				</c:forEach>

            </form:select>
        </p>

        <p>Album: <form:input path="album"/><form:errors path="album"/></p>
        <p>Genre: <form:input path="gender"/><form:errors path="gender"/></p>
        <p>Language: <form:input path="language"/><form:errors path="language"/></p>
        <input type="submit" value="Add Song"/>
    </form:form>
    <a href="/songs">Back to songs list</a>
</body>
</html>
