<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
            background-color: #f5f5f5;
        }
        .container {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            max-width: 600px;
            margin: auto;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h1 {
            color: #333;
        }
        .token-box {
            word-wrap: break-word;
            background-color: #f9f9f9;
            padding: 10px;
            border: 1px solid #ddd;
            margin-top: 20px;
        }
        button {
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #d9534f;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Bienvenue sur votre Dashboard</h1>
    <p>Vous êtes connecté(e) avec succès.</p>

    <h2>Votre Token JWT :</h2>
    <div id="token-display" class="token-box">Aucun token trouvé. Veuillez vous reconnecter.</div>

    <button onclick="logout()">Se déconnecter</button>
</div>

<script>
    // Récupérer le token depuis localStorage
    const token = localStorage.getItem('authToken');

    if (token) {
        document.getElementById('token-display').textContent = token;
    }

    function logout() {
        localStorage.removeItem('authToken'); // Supprimer le token
        alert("Vous avez été déconnecté(e).");
        window.location.href = 'index.jsp'; // Rediriger vers la page d'accueil
    }
</script>

</body>
</html>