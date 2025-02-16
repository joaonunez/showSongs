<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Artist List</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">
    <div class="container mt-5">

        <div class="row justify-content-between align-items-center mb-4">
            <div class="col-auto">
                <h1 class="text-primary">Artist List</h1>
            </div>
            <div class="col-auto">
                <a href="/songs" class="btn btn-secondary">View Songs</a>
            </div>
        </div>

        <c:if test="${not empty error}">
            <div class="alert alert-danger">${error}</div>
        </c:if>
        <c:if test="${not empty success}">
            <div class="alert alert-success">${success}</div>
        </c:if>

        <!-- Artist Table -->
        <div class="table-responsive">
            <table class="table table-bordered table-hover">
                <thead class="table-dark">
                    <tr>
                        <th>Name</th>
                        <th>Detail</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="artist" items="${artistsPage.content}">
                        <tr>
                            <td>${artist.firstName} ${artist.lastName}</td>
                            <td>
                                <a href="/artists/detail/${artist.id}" class="btn btn-primary btn-sm">View</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <!-- Pagination -->
        <nav aria-label="Page navigation" class="my-4">
            <ul class="pagination justify-content-center">
                <c:if test="${currentPage > 0}">
                    <li class="page-item">
                        <a class="page-link" href="/artists?page=${currentPage - 1}&size=5">Previous</a>
                    </li>
                </c:if>
                <li class="page-item disabled">
                    <span class="page-link">Page ${currentPage + 1} of ${totalPages}</span>
                </li>
                <c:if test="${currentPage + 1 < totalPages}">
                    <li class="page-item">
                        <a class="page-link" href="/artists?page=${currentPage + 1}&size=5">Next</a>
                    </li>
                </c:if>
            </ul>
        </nav>

        <!-- Add Artist Button -->
        <div class="text-center mb-4">
            <a href="/artists/form/add" class="btn btn-success">Add Artist</a>
        </div>
    </div>
</body>
</html>
