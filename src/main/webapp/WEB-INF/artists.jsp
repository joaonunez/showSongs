<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Artist List</title>
</head>
<body>
<a href="/songs">
    <button>View songs</button>
</a>
    <h1>Artist List</h1>
    <table border="1">
        <tr>
            <th>Title</th>
            <th>Detail</th>
        </tr>
        <c:forEach var="artist" items="${artistsPage.content}">
            <tr>
                <td>${artist.firstName} ${artist.lastName}</td>
                <td><a href="/artists/detail/${artist.id}">Detail</a></td>
            </tr>
        </c:forEach>
    </table>

    <div>
        <c:if test="${currentPage > 0}">
            <a href="/artists?page=${currentPage - 1}&size=5">Previous</a>
        </c:if>

        Page ${currentPage + 1} of ${totalPages}

        <c:if test="${currentPage + 1 < totalPages}">
            <a href="/artists?page=${currentPage + 1}&size=5">Next</a>
        </c:if>
    </div>

    <a href="/artists/form/add">
        <button>Add Artist</button>
    </a>
</body>
</html>
