<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Song List</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">

<div class="container mt-4 col-xxl-4 col-md-6 col-lg-7 col-xl-5 col-sm-6">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h1 class="text-primary">Song List</h1>
        <a href="/artists" class="btn btn-secondary">View Artists</a>
    </div>
    <!-- Alerts -->
    <c:if test="${not empty error}">
        <div class="alert alert-danger">${error}</div>
    </c:if>
    <c:if test="${not empty success}">
        <div class="alert alert-success">${success}</div>
    </c:if>

    <table class="table table-bordered table-hover">
        <thead class="table-dark">
            <tr>
                <th scope="col">Title</th>
                <th scope="col">Artist</th>
                <th scope="col">Detail</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="song" items="${songsPage.content}">
                <tr>
                    <td>${song.title}</td>
                    <td>${song.artist.firstName} ${song.artist.lastName}</td>
                    <td>
                        <a href="/songs/detail/${song.id}" class="btn btn-primary btn-sm">View</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <nav aria-label="Page navigation">
        <ul class="pagination justify-content-center">
            <c:if test="${currentPage > 0}">
                <li class="page-item">
                    <a class="page-link" href="/songs?page=${currentPage - 1}&size=5">Previous</a>
                </li>
            </c:if>

            <li class="page-item disabled">
                <span class="page-link">
                    Page ${currentPage + 1} of ${totalPages}
                </span>
            </li>

            <c:if test="${currentPage + 1 < totalPages}">
                <li class="page-item">
                    <a class="page-link" href="/songs?page=${currentPage + 1}&size=5">Next</a>
                </li>
            </c:if>
        </ul>
    </nav>

    <div class="d-flex justify-content-center">
        <a href="/songs/form/add" class="btn btn-success">Add Song</a>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
