<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Artist</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <h1 class="text-primary mb-4">Add Artist</h1>

        <form:form action="/artists/process/add" modelAttribute="artist" method="post" class="border p-4 rounded bg-white shadow">
            <div class="mb-3">
                <label class="form-label">First Name:</label>
                <form:input path="firstName" class="form-control"/>
                <form:errors path="firstName" class="text-danger"/>
            </div>

            <div class="mb-3">
                <label class="form-label">Last Name:</label>
                <form:input path="lastName" class="form-control"/>
                <form:errors path="lastName" class="text-danger"/>
            </div>

            <div class="mb-3">
                <label class="form-label">Biography:</label>
                <form:input path="biography" class="form-control"/>
                <form:errors path="biography" class="text-danger"/>
            </div>

            <div class="d-flex justify-content-between">
                <input type="submit" class="btn btn-success" value="Add Artist"/>
                <a href="/artists" class="btn btn-secondary">Back to Artist List</a>
            </div>
        </form:form>
    </div>
</body>
</html>
