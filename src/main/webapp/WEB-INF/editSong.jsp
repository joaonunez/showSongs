<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Song</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <h1 class="text-primary mb-4">Edit Song</h1>
        <form:form action="/songs/process/edit/${song.id}" modelAttribute="song" method="post" class="border p-4 rounded bg-white shadow">
            <input type="hidden" name="_method" value="put" />

            <div class="mb-3">
                <label class="form-label">Title:</label>
                <form:input path="title" class="form-control"/>
                <form:errors path="title" class="text-danger"/>
            </div>

            <div class="mb-3">
                <label class="form-label">Select Artist:</label>
                <select name="artist" class="form-select">
                    <c:forEach var="artist" items="${artists}">
                        <option value="${artist.id}" 
                            <c:if test="${song.artist != null && song.artist.id == artist.id}">selected</c:if>>
                            ${artist.firstName} ${artist.lastName}
                        </option>
                    </c:forEach>
                </select>
                <form:errors path="artist" class="text-danger"/>
            </div>

            <div class="mb-3">
                <label class="form-label">Album:</label>
                <form:input path="album" class="form-control"/>
                <form:errors path="album" class="text-danger"/>
            </div>

            <div class="mb-3">
                <label class="form-label">Genre:</label>
                <form:input path="gender" class="form-control"/>
                <form:errors path="gender" class="text-danger"/>
            </div>

            <div class="mb-3">
                <label class="form-label">Language:</label>
                <form:input path="language" class="form-control"/>
                <form:errors path="language" class="text-danger"/>
            </div>

            <div class="d-flex justify-content-between">
                <input type="submit" class="btn btn-success" value="Update Song"/>
                <a href="/songs" class="btn btn-secondary">Back to Song List</a>
            </div>
        </form:form>
    </div>
</body>
</html>
