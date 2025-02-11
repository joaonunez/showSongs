<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Song Detail</title>
</head>
<body>
    <h1>Song Details</h1>
    <p><strong>Title:</strong> ${song.title}</p>
    <p><strong>Artist:</strong> ${song.artist}</p>
    <p><strong>Album:</strong> ${song.album}</p>
    <p><strong>Genre:</strong> ${song.gender}</p>
    <p><strong>Language:</strong> ${song.language}</p>
    <p><strong>Created At:</strong> ${song.createdAt}</p>
    <p><strong>Updated At:</strong> ${song.updatedAt}</p>
	<a href="/songs/form/edit/${song.id}">
    <button>Edit Song</button>
</a>
	
    <a href="/songs">Back to song list</a>
</body>
</html>
