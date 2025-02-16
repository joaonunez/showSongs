<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Song Detail</title>
    <!-- Bootstrap 5.3.3 CDN -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">

<div class="container mt-5 container mt-4 col-xxl-4 col-md-6 col-lg-7 col-xl-5 col-sm-6">
    <div class="card shadow-lg rounded-4">
        <div class="card-header bg-primary text-white">
            <h2 class="mb-0">Song Details</h2>
        </div>
        <div class="card-body">
            <ul class="list-group list-group-flush mb-4">
                <li class="list-group-item"><strong>Title:</strong> ${song.title}</li>
                <li class="list-group-item"><strong>Artist:</strong> ${song.artist.firstName} ${song.artist.lastName}</li>
                <li class="list-group-item"><strong>Album:</strong> ${song.album}</li>
                <li class="list-group-item"><strong>Genre:</strong> ${song.gender}</li>
                <li class="list-group-item"><strong>Language:</strong> ${song.language}</li>
                <li class="list-group-item"><strong>Created At:</strong> ${song.createdAt}</li>
                <li class="list-group-item"><strong>Updated At:</strong> ${song.updatedAt}</li>
            </ul>

            <div class="d-flex justify-content-center flex-wrap gap-2">
                <a href="/songs/form/edit/${song.id}" class="btn btn-warning">Edit Song</a>

                <form action="/songs/delete/${song.id}" method="post" onsubmit="return confirm('¿Estás seguro de que deseas eliminar esta canción?');">
                    <input type="hidden" name="_method" value="delete" />
                    <input type="submit" class="btn btn-danger" value="Delete Song" />
                </form>

                <a href="/songs" class="btn btn-secondary">Back to Song List</a>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
