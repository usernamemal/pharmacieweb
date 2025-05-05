<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Gestion des Utilisateurs - Pharmacie</title>

    <!-- Font Awesome -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"
          crossorigin="anonymous"
          referrerpolicy="no-referrer"/>

    <!-- Lien vers CSS externe -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/styles.css">
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
</head>

<body>

<div class="container">

    <!-- Sidebar -->
    <div class="sidebar">
        <div class="logo">
            <img src="assets/img/logo.jpg" alt="Logo">
        </div>
        <ul class="menu">
            <ul class="menu">
                <li><a href="${pageContext.request.contextPath}/dashbord.jsp"><i class="fas fa-home"></i> Home</a></li>
                <li><a href="${pageContext.request.contextPath}/Utilisateur.jsp"><i class="fas fa-users"></i> Utilisateurs</a></li>
                <li><a href="${pageContext.request.contextPath}/Fournisseur.jsp"><i class="fas fa-users"></i> Fournisseur</a></li>
                <li><a href="${pageContext.request.contextPath}/Medicament.jsp"><i class="fas fa-pills"></i> Medicament</a></li>
                <li><a href="${pageContext.request.contextPath}/bon_de_commande.jsp"><i class="fas fa-shopping-cart"></i> Bon de Commande</a></li>
            </ul>
        </ul>
    </div>
</div>
</body>
</html>