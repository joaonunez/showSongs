<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Artist</title>
</head>
<body>
    <h1>Edit Artist</h1>
    <form:form action="/artists/process/edit/${artist.id}" modelAttribute="artist" method="post">
        <input type="hidden" name="_method" value="put" />
        <p>First Name: <form:input path="firstName"/><form:errors path="firstName"/></p>
        <p>Last Name: <form:input path="lastName"/><form:errors path="lastName"/></p>
        <p>Biography: <form:input path="biography"/><form:errors path="biography"/></p>
        <input type="submit" value="Update Song"/>
    </form:form>
    <a href="/artists">Back to song list</a>

</body>
</html>
