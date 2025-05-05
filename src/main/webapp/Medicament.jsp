<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Gestion des Médicaments - Pharmacie</title>

    <!-- Font Awesome -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"
          crossorigin="anonymous"
          referrerpolicy="no-referrer"/>

    <style>
        /* Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }
        .submenu {
            display: none;
            list-style: none;
            padding-left: 20px;
        }

        .submenu.active {
            display: block;
        }

        body {
            background-color: #fff; /* Fond principal en couleur douce */
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0; /* Supprimer les marges par défaut */
        }

        .container {
            display: flex;
            width: 100%;
            max-width: 100%; /* Pas de limite de largeur maximale */
            background-color: #ffffff; /* Fond blanc pour le contenu principal */
            box-shadow: none; /* Supprimer l'ombre */
            border-radius: 0; /* Supprimer les coins arrondis */
            height: 100vh; /* Hauteur complète de l'écran */
        }

        /* Sidebar */
        .sidebar {
            width: 20%;
            background-color: #328E6E;
            color: #fff;
            padding: 20px;
            height: 100vh;
            overflow-y: auto;
        }

        /* Logo */
        .logo {
            text-align: center;
            margin-bottom: 1px;
        }

        .logo img {
            width: 130px;
            height: auto;
            border-radius: 50%;
            object-fit: cover;
            overflow: hidden;
        }

        .menu {
            list-style: none;
        }

        .menu li {
            margin-bottom: 10px;
        }

        .menu a {
            display: block;
            padding: 10px;
            color: #fff;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        .menu a:hover {
            background-color: #2b7a5f; /* Vert plus foncé au survol */
        }

        .menu a i {
            margin-right: 10px;
        }

        .arrow {
            float: right;
            margin-top: 2px;
        }

        .submenu {
            display: none;
            list-style: none;
            padding-left: 20px;
        }

        .submenu li {
            margin-bottom: 5px;
        }

        .submenu a {
            color: #fff;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .submenu a:hover {
            color: #ccc;
        }

        /* Main Content */
        .main-content {
            width: 80%;
            padding: 20px;
            background-color: #fff; /* Fond principal pour le contenu */
        }

        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            border-bottom: 1px solid #ddd;
            padding-bottom: 20px;
        }

        .user-info {
            display: flex;
            align-items: center;
        }

        .user-info img {
            width: 30px;
            height: 30px;
            border-radius: 50%;
            margin-right: 10px;
        }

        h1 {
            font-size: 24px;
            margin: 0;
        }

        .page-content {
            display: none;
        }

        .page-content.active {
            display: block;
        }

        /* Form Grid */
        .form-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-label {
            font-weight: bold;
            margin-bottom: 5px;
            color: #328E6E; /* Texte vert pour les labels */
        }

        .form-control,
        .form-select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
            transition: border-color 0.3s ease;
        }

        .form-control:focus,
        .form-select:focus {
            border-color: #328E6E; /* Bordure verte au focus */
            outline: none;
            box-shadow: 0 0 5px rgba(50, 142, 110, 0.5); /* Ombre verte */
        }

        .form-actions {
            display: flex;
            justify-content: flex-end;
            gap: 10px;
        }

        .btn {
            padding: 10px 20px;
            background-color: #328E6E; /* Boutons verts spécifiques */
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #2b7a5f; /* Vert plus foncé au survol */
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .form-grid {
                grid-template-columns: 1fr;
            }

            .search-bar input {
                width: 100%;
            }
        }

        /* Table Styles */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table th,
        table td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }

        table th {
            background-color: #328E6E; /* En-têtes de tableau verts spécifiques */
            color: #fff;
        }

        .edit-btn,
        .delete-btn {
            padding: 5px;
            background-color: transparent;
            border: none;
            cursor: pointer;
        }

        .edit-btn i,
        .delete-btn i {
            color: #328E6E; /* Icônes vertes spécifiques */
        }

        .delete-btn i {
            color: red;
        }

        /* Footer */
        footer {
            margin-top: auto; /* Placer le footer en bas */
            padding: 20px;
            background-color: #E1EEBC; /* Fond légèrement doux */
            text-align: center;
        }

        .buttons {
            display: flex;
            justify-content: center;
            gap: 20px;
        }

        /* Style pour les cartes de statistiques */
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
        }

        .stat-card {
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            padding: 20px;
            text-align: center;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .stat-card i {
            font-size: 3rem;
            color: #28a745; /* Couleur verte pour les icônes */
        }

        /* Style pour les notifications */
        .notifications {
            margin-top: 20px;
        }

        .notification {
            background-color: #fff;
            border: 1px solid #ddd;
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 5px;
        }

        .notification i {
            color: #dc3545; /* Couleur rouge pour les alertes */
            margin-right: 10px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th {
            background-color: #f2f2f2;
            padding: 12px;
            text-align: left;
        }

        td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }

        .btn-edit {
            background-color: #4CAF50;
            color: white;
            padding: 6px 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-right: 5px;
        }

        .btn-delete {
            background-color: #f44336;
            color: white;
            padding: 6px 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        #statusMessage {
            margin: 10px 0;
            padding: 10px;
            border-radius: 4px;
        }

        .image-preview {
            max-width: 150px;
            max-height: 150px;
            margin: 10px 0;
            display: none;
        }

        .upload-area {
            border: 2px dashed #328E6E;
            padding: 20px;
            text-align: center;
            margin: 10px 0;
            border-radius: 5px;
            cursor: pointer;
        }

        .upload-area:hover {
            background-color: #f0f8f5;
        }
    </style>

    <!-- Axios -->
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
            <li><a href="dashbord.jsp"><i class="fas fa-home"></i> Home</a></li>
            <li><a href="Utilisateur.jsp"><i class="fas fa-users"></i> Utilisateurs</a></li>
            <li><a href="Fournisseur.jsp"><i class="fas fa-users"></i> Fournisseur</a></li>
            <li><a href="Medicament.jsp" class="active"><i class="fas fa-pills"></i> Medicament</a></li>
            <li><a href="#" onclick="logout()"><i class="fas fa-sign-out-alt"></i> Déconnexion</a></li>

        </ul>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <!-- Medicament List Section -->
        <div id="medicamentList" class="page-content active">
            <h2>Liste des Médicaments</h2>

            <div style="margin-bottom: 15px;">
                <button class="btn btn-primary" onclick="showSection('addmedicament')">+ Ajouter</button>
            </div>

            <div id="statusMessage"></div>

            <div class="search-bar">
                <input type="text" id="searchMedicament" placeholder="Rechercher des médicaments..." class="form-control" style="width: 300px; display: inline-block;">
                <button class="btn btn-primary" onclick="searchMedicaments()">Rechercher</button>
            </div>

            <table>
                <thead>
                <tr>
                    <th>Code</th>
                    <th>Libellé</th>
                    <th>Famille</th>
                    <th>Prix</th>
                    <th>Stock</th>
                    <th>Expiration</th>
                    <th>Image</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody id="medicamentTableBody">
                <!-- Data will be loaded here -->
                </tbody>
            </table>
        </div>

        <!-- Add Medicament Section -->
        <div id="addmedicament" class="page-content">
            <h2>Ajouter un Médicament</h2>
            <form id="addmedicament-form" class="form-grid" enctype="multipart/form-data">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="codeMed">Code Médicament:</label>
                            <input type="text" id="codeMed" name="codeMed" class="form-control" required>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="libelle">Libellé:</label>
                            <input type="text" id="libelle" name="libelle" class="form-control" required>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="familleMed">Famille:</label>
                            <input type="text" id="familleMed" name="familleMed" class="form-control" required>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="prixUnitaire">Prix Unitaire:</label>
                            <input type="number" step="0.01" id="prixUnitaire" name="prixUnitaire" class="form-control" required>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="qteStock">Quantité en Stock:</label>
                            <input type="number" id="qteStock" name="qteStock" class="form-control" required>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="stockMin">Stock Minimum:</label>
                            <input type="number" id="stockMin" name="stockMin" class="form-control" required>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="dateExpiration">Date d'Expiration:</label>
                            <input type="date" id="dateExpiration" name="dateExpiration" class="form-control" required>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="image">Image:</label>
                            <div class="upload-area" onclick="document.getElementById('image').click()">
                                <i class="fas fa-cloud-upload-alt fa-2x"></i>
                                <p>Cliquez pour télécharger une image</p>
                                <input type="file" id="image" name="image" accept="image/*" style="display: none;" onchange="previewImage(this)">
                                <img id="imagePreview" class="image-preview" alt="Aperçu de l'image">
                            </div>
                        </div>
                    </div>
                </div>
                <button type="submit" class="btn btn-success">Enregistrer</button>
                <div id="error-message" class="error-message"></div>
            </form>
        </div>
    </div>
</div>

<script>
    // Global variables
    let currentMedicaments = [];

    // Load medicaments when page loads
    document.addEventListener('DOMContentLoaded', function() {
        loadMedicaments();
        setupEventListeners();
    });

    function setupEventListeners() {
        // Add medicament form submission
        const addForm = document.getElementById('addmedicament-form');
        if (addForm) {
            addForm.addEventListener('submit', function(e) {
                e.preventDefault();
                addMedicament();
            });
        }
    }

    function previewImage(input) {
        const preview = document.getElementById('imagePreview');
        const file = input.files[0];
        const reader = new FileReader();

        reader.onload = function(e) {
            preview.src = e.target.result;
            preview.style.display = 'block';
        }

        if (file) {
            reader.readAsDataURL(file);
        }
    }

    function loadMedicaments() {
        const token = localStorage.getItem('authToken');
        const statusDiv = document.getElementById('statusMessage');
        const tbody = document.getElementById('medicamentTableBody');

        if (!token) {
            showError("Token manquant. Veuillez vous reconnecter.");
            window.location.href = 'index.jsp';
            return;
        }

        showLoading(statusDiv, tbody);

        axios.get('http://localhost:8080/api/medicaments', {
            headers: {
                'Authorization': 'Bearer ' + token
            }
        })
            .then(response => {
                if (!Array.isArray(response.data)) {
                    throw new Error("Format de données invalide");
                }

                currentMedicaments = response.data.map(medicament => ({
                    id: medicament.id,
                    codeMed: medicament.codeMed || "N/A",
                    libelle: medicament.libelle || "N/A",
                    familleMed: medicament.familleMed || "N/A",
                    prixUnitaire: medicament.prixUnitaire || 0,
                    qteStock: medicament.qteStock || 0,
                    stockMin: medicament.stockMin || 0,
                    dateExpiration: medicament.dateExpiration ? new Date(medicament.dateExpiration).toLocaleDateString() : "N/A",
                    image: medicament.image || ""
                }));

                if (currentMedicaments.length === 0) {
                    showNoData(tbody, statusDiv);
                } else {
                    displayMedicaments(currentMedicaments, tbody, statusDiv);
                }
            })
            .catch(error => {
                handleError(error, tbody, statusDiv);
            });
    }

    function showLoading(statusDiv, tbody) {
        statusDiv.textContent = "Chargement en cours...";
        statusDiv.style.color = "inherit";
        tbody.innerHTML = '<tr><td colspan="8">Chargement des données...</td></tr>';
    }

    function showNoData(tbody, statusDiv) {
        tbody.innerHTML = '<tr><td colspan="8">Aucun médicament trouvé</td></tr>';
        statusDiv.textContent = "Aucun médicament trouvé";
        statusDiv.style.color = "#666";
    }

    function displayMedicaments(medicaments, tbody, statusDiv) {
        tbody.innerHTML = medicaments.map(medicament => `
            <tr>
                <td>${escapeHtml(medicament.codeMed)}</td>
                <td>${escapeHtml(medicament.libelle)}</td>
                <td>${escapeHtml(medicament.familleMed)}</td>
                <td>${medicament.prixUnitaire.toFixed(2)} DH</td>
                <td class="${medicament.qteStock < medicament.stockMin ? 'text-danger' : ''}">
                    ${medicament.qteStock}
                </td>
                <td>${medicament.dateExpiration}</td>
                <td>
                    ${medicament.image ? `<img src="http://localhost:8080${medicament.image}" alt="Image" style="max-width: 50px; max-height: 50px;">` : 'Aucune image'}
                </td>
                <td>
                    <button class="btn-edit" onclick="editMedicament(${medicament.id})">Modifier</button>
                    <button class="btn-delete" onclick="deleteMedicament(${medicament.id})">Supprimer</button>
                </td>
            </tr>
        `).join('');

        statusDiv.textContent = `${medicaments.length} médicament(s) chargé(s)`;
        statusDiv.style.color = "green";
    }

    function handleError(error, tbody, statusDiv) {
        console.error("Erreur:", error);

        let errorMessage = "Erreur lors du chargement";
        if (error.response) {
            if (error.response.status === 401) {
                errorMessage = "Session expirée. Veuillez vous reconnecter.";
                window.location.href = 'index.jsp';
            } else if (error.response.data) {
                errorMessage = error.response.data.message || JSON.stringify(error.response.data);
            }
        }

        tbody.innerHTML = `<tr><td colspan="8" style="color: red;">${errorMessage}</td></tr>`;
        statusDiv.innerHTML = `<span style="color: red;">${errorMessage}</span>`;
    }

    function escapeHtml(unsafe) {
        if (unsafe === null || unsafe === undefined) return '';
        return unsafe.toString()
            .replace(/&/g, "&amp;")
            .replace(/</g, "&lt;")
            .replace(/>/g, "&gt;")
            .replace(/"/g, "&quot;")
            .replace(/'/g, "&#039;");
    }

    function addMedicament() {
        const token = localStorage.getItem('authToken');
        if (!token) {
            showError("Session expirée. Veuillez vous reconnecter.");
            window.location.href = 'index.jsp';
            return;
        }

        const form = document.getElementById('addmedicament-form');
        const isEditing = form.dataset.editingId !== undefined;
        const imageFile = document.getElementById('image').files[0];
        const existingImage = form.dataset.existingImage || "";

        // Création du FormData
        const formData = new FormData();
        formData.append('codeMed', document.getElementById('codeMed').value.trim());
        formData.append('libelle', document.getElementById('libelle').value.trim());
        formData.append('dateExpiration', document.getElementById('dateExpiration').value);
        formData.append('prixUnitaire', document.getElementById('prixUnitaire').value);
        formData.append('stockMin', document.getElementById('stockMin').value);
        formData.append('familleMed', document.getElementById('familleMed').value.trim());
        formData.append('qteStock', document.getElementById('qteStock').value);

        // Gestion de l'image
        if (imageFile) {
            formData.append('image', imageFile);
        } else if (isEditing) {
            formData.append('existingImage', existingImage);
        }

        const config = {
            headers: {
                'Authorization': 'Bearer ' + token,
                'Content-Type': 'multipart/form-data'
            }
        };

        const endpoint = isEditing
            ? `http://localhost:8080/api/medicaments/${form.dataset.editingId}`
            : 'http://localhost:8080/api/medicaments/upload';

        const method = isEditing ? 'put' : 'post';

        axios[method](endpoint, formData, config)
            .then(() => {
                alert(isEditing
                    ? "Médicament modifié avec succès !"
                    : "Médicament ajouté avec succès !");

                // Réinitialisation
                form.reset();
                document.getElementById('imagePreview').style.display = 'none';
                delete form.dataset.editingId;
                delete form.dataset.existingImage;

                const submitBtn = form.querySelector('button[type="submit"]');
                submitBtn.textContent = "Enregistrer";
                submitBtn.classList.remove('btn-primary');
                submitBtn.classList.add('btn-success');

                showSection('medicamentList');
                loadMedicaments();
            })
            .catch(error => {
                console.error("Erreur:", error);
                let errorMsg = "Erreur lors de " + (isEditing ? "la modification" : "l'ajout");

                if (error.response) {
                    if (error.response.status === 401) {
                        errorMsg = "Session expirée. Veuillez vous reconnecter.";
                        window.location.href = 'index.jsp';
                    } else if (error.response.data && error.response.data.message) {
                        errorMsg = error.response.data.message;
                    }
                }

                document.getElementById('error-message').textContent = errorMsg;
            });
    }


    function editMedicament(id) {
        const medicament = currentMedicaments.find(m => m.id === id);
        if (medicament) {
            // Pré-remplir le formulaire
            document.getElementById('codeMed').value = medicament.codeMed;
            document.getElementById('libelle').value = medicament.libelle;
            document.getElementById('familleMed').value = medicament.familleMed;
            document.getElementById('prixUnitaire').value = medicament.prixUnitaire;
            document.getElementById('qteStock').value = medicament.qteStock;
            document.getElementById('stockMin').value = medicament.stockMin;

            // Convertir la date
            if (medicament.dateExpiration && medicament.dateExpiration !== "N/A") {
                const dateParts = medicament.dateExpiration.split('/');
                if (dateParts.length === 3) {
                    const formattedDate = `${dateParts[2]}-${dateParts[1].padStart(2, '0')}-${dateParts[0].padStart(2, '0')}`;
                    document.getElementById('dateExpiration').value = formattedDate;
                }
            }

            // Gestion de l'image existante
            const form = document.getElementById('addmedicament-form');
            form.dataset.existingImage = medicament.image || "";

            // Afficher l'image existante
            const preview = document.getElementById('imagePreview');
            if (medicament.image) {
                preview.src = `http://localhost:8080${medicament.image}`;
                preview.style.display = 'block';
            } else {
                preview.style.display = 'none';
            }

            // Stocker l'ID en cours d'édition
            form.dataset.editingId = id;

            // Changer le texte du bouton
            const submitBtn = form.querySelector('button[type="submit"]');
            submitBtn.textContent = "Modifier";
            submitBtn.classList.remove('btn-success');
            submitBtn.classList.add('btn-primary');

            showSection('addmedicament');
        }
    }

    function deleteMedicament(id) {
        if (confirm("Êtes-vous sûr de vouloir supprimer ce médicament ?")) {
            const token = localStorage.getItem('authToken');

            axios.delete(`http://localhost:8080/api/medicaments/${id}`, {
                headers: {
                    'Authorization': 'Bearer ' + token
                }
            })
                .then(() => {
                    alert("Médicament supprimé avec succès");
                    loadMedicaments();
                })
                .catch(error => {
                    console.error("Erreur:", error);
                    alert("Erreur lors de la suppression");
                });
        }
    }

    function showSection(sectionId) {
        document.querySelectorAll('.page-content').forEach(section => {
            section.classList.remove('active');
        });
        document.getElementById(sectionId).classList.add('active');
    }

    function searchMedicaments() {
        const searchTerm = document.getElementById('searchMedicament').value.toLowerCase();
        const filteredMedicaments = currentMedicaments.filter(medicament =>
            medicament.codeMed.toLowerCase().includes(searchTerm) ||
            medicament.libelle.toLowerCase().includes(searchTerm) ||
            medicament.familleMed.toLowerCase().includes(searchTerm) ||
            medicament.prixUnitaire.toString().includes(searchTerm) ||
            medicament.qteStock.toString().includes(searchTerm) ||
            medicament.dateExpiration.toLowerCase().includes(searchTerm)
        );

        displayMedicaments(filteredMedicaments, document.getElementById('medicamentTableBody'), document.getElementById('statusMessage'));
    }

    function showError(message) {
        const statusDiv = document.getElementById('statusMessage');
        statusDiv.innerHTML = `<span style="color: red;">${message}</span>`;
    }

    function logout() {
        const token = localStorage.getItem('authToken');

        // Appel API pour invalider le token côté serveur
        axios.post('http://localhost:8080/api/auth/logout', {}, {
            headers: {
                'Authorization': 'Bearer ' + token
            }
        })
            .then(() => {
                // Nettoyage côté client
                localStorage.removeItem('authToken');
                sessionStorage.removeItem('userData');

                // Redirection vers la page de login
                window.location.href = '${pageContext.request.contextPath}/index.jsp';
            })
            .catch(error => {
                console.error("Erreur lors de la déconnexion:", error);
                // Nettoyage quand même en cas d'erreur
                localStorage.removeItem('authToken');
                window.location.href = '${pageContext.request.contextPath}/index.jsp';
            });
    }
</script>

</body>
</html>