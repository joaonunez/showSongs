<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Song</title>
</head>
<body>
    <h1>Edit Song</h1>
    <form:form action="/songs/process/edit/${song.id}" modelAttribute="song" method="post">
        <input type="hidden" name="_method" value="put" />
        <p>Title: <form:input path="title"/><form:errors path="title"/></p>
        <p>Artist: <form:input path="artist"/><form:errors path="artist"/></p>
        <p>Album: <form:input path="album"/><form:errors path="album"/></p>
        <p>Genre: <form:input path="gender"/><form:errors path="gender"/></p>
        <p>Language: <form:input path="language"/><form:errors path="language"/></p>
        <input type="submit" value="Update Song"/>
    </form:form>
    <a href="/songs">Back to song list</a>
</body>
</html>
