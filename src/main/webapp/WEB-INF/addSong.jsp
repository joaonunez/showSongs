<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Agregar Canción</title>
</head>
<body>
    <h1>ADD SONG</h1>
    <form:form action="/songs/process/add" modelAttribute="song" method="post">
        <p>Título: <form:input path="title"/><form:errors path="title"/></p>
        <p>Artista: <form:input path="artist"/><form:errors path="artist"/></p>
        <p>Álbum: <form:input path="album"/><form:errors path="album"/></p>
        <p>Género: <form:input path="gender"/><form:errors path="gender"/></p>
        <p>Idioma: <form:input path="language"/><form:errors path="language"/></p>
        <input type="submit" value="Add Song"/>
    </form:form>
    <a href="/songs">Volver a lista de canciones</a>
</body>
</html>
