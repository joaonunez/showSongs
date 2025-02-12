<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Song List</title>
</head>
<body>
<a href="/artists">
    <button>View Artists</button>
</a>
    <h1>Song List</h1>
    <table border="1">
        <tr>
            <th>Title</th>
            <th>Artist</th>
            <th>Detail</th>
        </tr>
        <c:forEach var="song" items="${songs}">
            <tr>
                <td>${song.title}</td>
                <td>${song.artist.firstName} ${song.artist.lastName}</td>
                <td><a href="/songs/detail/${song.id}">Detail</a></td>
            </tr>
        </c:forEach>
    </table>
    <a href="/songs/form/add">
    <button>Agregar Canci�n</button>
</a>
    
</body>
</html>
