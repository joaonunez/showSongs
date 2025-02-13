<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Song List</title>
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
        <c:forEach var="artist" items="${artists}">
            <tr>
                <td>${artist.firstName} ${artist.lastName}</td>
                <td><a href="/artists/detail/${artist.id}">Detail</a></td>
            </tr>
        </c:forEach>
    </table>
    <a href="/artists/form/add">
    <button>Add Artist</button>
</a>
    
</body>
</html>
