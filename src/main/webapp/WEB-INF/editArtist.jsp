<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Edit Artist</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-xxl-4 col-md-10 col-lg-7 col-xl-5 col-sm-10">
                <!-- Title -->
                <h1 class="text-primary mb-4">Edit Artist</h1>

                <!-- Form -->
                <form:form action="/artists/process/edit/${artist.id}" 
                           modelAttribute="artist" method="post" 
                           class="border p-4 rounded bg-white shadow">
                    <input type="hidden" name="_method" value="put" />

                    <!-- First Name -->
                    <div class="mb-3">
                        <label class="form-label">First Name:</label>
                        <form:input path="firstName" class="form-control"/>
                        <form:errors path="firstName" class="text-danger"/>
                    </div>

                    <!-- Last Name -->
                    <div class="mb-3">
                        <label class="form-label">Last Name:</label>
                        <form:input path="lastName" class="form-control"/>
                        <form:errors path="lastName" class="text-danger"/>
                    </div>

                    <!-- Biography -->
                    <div class="mb-3">
                        <label class="form-label">Biography:</label>
                        <form:textarea path="biography" class="form-control"/>
                        <form:errors path="biography" class="text-danger"/>
                    </div>

                    <!-- Buttons -->
                    <div class="d-flex flex-wrap gap-3">
                        <input type="submit" class="btn btn-success" value="Update Artist"/>
                        <a href="/artists" class="btn btn-secondary">Back to Artist List</a>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</body>
</html>
