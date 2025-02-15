<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Artist Detail</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <h1 class="text-primary mb-4">Artist Details</h1>

        <div class="card p-4 mb-4 shadow">
            <p><strong>Name:</strong> ${artist.firstName} ${artist.lastName}</p>
            <p><strong>Biography:</strong> ${artist.biography}</p>
        </div>

        <h2 class="mb-3">Songs</h2>
        <c:choose>
            <c:when test="${not empty artist.songs}">
                <ul class="list-group mb-4">
                    <c:forEach var="song" items="${artist.songs}">
                        <li class="list-group-item">
                            <strong>Title:</strong> ${song.title} |
                            <strong>Album:</strong> ${song.album} |
                            <strong>Genre:</strong> ${song.gender}
                        </li>
                    </c:forEach>
                </ul>
            </c:when>
            <c:otherwise>
                <p class="text-muted">No songs available for this artist.</p>
            </c:otherwise>
        </c:choose>

        <div class="d-flex justify-content-between">
            <a href="/artists/form/edit/${artist.id}" class="btn btn-warning">Edit Artist</a>

            <form action="/artists/delete/${artist.id}" method="post" onsubmit="return confirm('Are you sure you want to delete this artist?');" class="d-inline">
                <input type="hidden" name="_method" value="delete" />
                <input type="submit" class="btn btn-danger" value="Delete Artist"/>
            </form>

            <a href="/artists" class="btn btn-secondary">Back to Artist List</a>
        </div>
    </div>
</body>
</html>
