<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Song List</title>
</head>
<body>
    <h1>Song List</h1>
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
    <button>Agregar Artista</button>
</a>
    
</body>
</html>
