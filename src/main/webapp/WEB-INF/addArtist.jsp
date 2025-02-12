<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Agregar Canción</title>
</head>
<body>
    <h1>ADD SONG</h1>
    <form:form action="/artists/process/add" modelAttribute="artist" method="post">
        <p>Name: <form:input path="firstName"/><form:errors path="firstName"/></p>
		<p>Last Name: <form:input path="lastName"/><form:errors path="lastName"/></p>
        <p>Biography: <form:input path="biography"/><form:errors path="biography"/></p>
        <input type="submit" value="Add Artist"/>
    </form:form>
    <a href="/artists">Volver a lista de artistas</a>
</body>
</html>
