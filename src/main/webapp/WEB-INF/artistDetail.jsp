<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Artist Detail</title>
</head>
<body>
    <h1>Artist Details</h1>
    <p><strong>Name:</strong> ${artist.firstName} ${artist.lastName}</p>
    <p><strong>Biography:</strong> ${artist.biography}</p>

    <h2>Songs</h2>
    <c:choose>
        <c:when test="${not empty artist.songs}">
            <ul>
                <c:forEach var="song" items="${artist.songs}">
                    <li><strong>Title:</strong> ${song.title} | <strong>Album:</strong> ${song.album} | <strong>Genre:</strong> ${song.gender}</li>
                </c:forEach>
            </ul>
        </c:when>
        <c:otherwise>
            <p>No songs available for this artist.</p>
        </c:otherwise>
    </c:choose>

    <a href="/artists/form/edit/${artist.id}">
        <button>Edit artist</button>
    </a>

    <form action="/artists/delete/${artist.id}" method="post" onsubmit="return confirm('Are you sure you want to delete this artist?');">
        <input type="hidden" name="_method" value="delete" />
        <input type="submit" value="Delete artist" />
    </form>

    <a href="/artists">Back to artist list</a>
</body>
</html>
