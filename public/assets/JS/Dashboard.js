/*--------------------------------------Barre de Recherche-------------------------------------------*/


  // Récupérer la barre de recherche
    const searchInput = document.querySelector('.form-control');

    // Récupérer l'ID des utilisateurs
    const id = document.querySelectorAll('.id');

    // Récupérer tous les noms d'utilisateur
    const firstname = document.querySelectorAll('.firstname');
    const lastname = document.querySelectorAll('.lastname');

    // Récupérer tout les email d'utilisateur
    const emailNames = document.querySelectorAll('.email-name');

    // Fonction pour filtrer les utilisateurs en fonction de la recherche
    function filterUsersEmail() {
  const searchValue = searchInput.value.toLowerCase();
  
      // Filtrer les utilisateurs et l'email
      emailNames.forEach((emailName) => {
        const email = emailName.textContent.toLowerCase();
        const listItem = emailName.closest('li');

        const id = listItem.querySelector('.id').textContent.toLowerCase();
        const firstname = listItem.querySelector('.firstname').textContent.toLowerCase();
        const lastname = listItem.querySelector('.lastname').textContent.toLowerCase();

        if (email.includes(searchValue) || id.includes(searchValue) || firstname.includes(searchValue) || lastname.includes(searchValue) ) {
          listItem.style.display = 'block';
        } else {
          listItem.style.display = 'none';
        }
      });

    }

    // Ajouter un gestionnaire d'événement pour la recherche en temps réel
    searchInput.addEventListener('input', filterUsersEmail);




/*----------------------------------Nb d'employé affichage dynamique-------------------------------*/


// Récupérer tous les éléments <li> avec la classe "employee"
const employeeElements = document.querySelectorAll('.list-unstyled li.employee');

// Récupérer l'élément <p> avec l'id "employeeCount"
const employeeCountElement = document.getElementById('employeeCount');

// Mettre à jour le contenu de l'élément avec le nombre d'employés
employeeCountElement.textContent = `${employeeElements.length} utilisateur(s)`;


/*----------------------------------Adress de l'admin dynamique-----------------------------------*/

// Récupérer l'élément <li> avec l'id "adminEmail"
const adminEmailElement = document.getElementById('adminEmail');

// Récupérer le contenu de l'adresse e-mail de l'admin
const adminEmail = adminEmailElement.textContent;

// Récupérer l'élément <p> avec l'id "adminAdressMail"
const adminAdressMailElement = document.getElementById('adminAdressMail');

// Mettre à jour le contenu de l'élément avec l'adresse e-mail de l'admin
adminAdressMailElement.textContent = adminEmail;


/*----------------------------------Formulaire de modification------------------------------------*/


// Récupère les données de l'utilisateur lors du clic sur le bouton "Modifier"
// Lorsque le modal de modification est ouvert
const editUserModal = document.getElementById('editUserModal');
editUserModal.addEventListener('show.bs.modal', function (event) {
  // Button that triggered the modal
  const button = event.relatedTarget;

  // Extract user ID, username, and email from data-* attributes
  let userId = button.getAttribute('data-user-id');
  let username = button.getAttribute('data-username');
  let email = button.getAttribute('data-email');

  // Update the input fields in the modal with the values
  let editUserIdInput = editUserModal.querySelector('#editUserId');
  let editUsernameInput = editUserModal.querySelector('#editUsername');
  let editEmailInput = editUserModal.querySelector('#editEmail');

  editUserIdInput.value = userId;
  editUsernameInput.value = username;
  editEmailInput.value = email;
});


/*----------------------------------Formulaire de suppression------------------------------------*/


// Sélectionner tous les boutons de suppression
let deleteButtons = document.querySelectorAll('.btn-danger[data-bs-toggle="modal"]');

// Parcourir chaque bouton de suppression
deleteButtons.forEach(function (button) {
  // Écouter l'événement de clic sur le bouton de suppression
  button.addEventListener('click', function (event) {
    // Récupérer l'identifiant de l'utilisateur à partir de l'attribut data-user-id
    let userId = button.getAttribute('data-user-id');

    // Sélectionner le champ de formulaire caché
    let deleteUserId = document.getElementById('deleteUserId');

    // Définir la valeur de l'identifiant de l'utilisateur dans le champ de formulaire caché
    deleteUserId.value = userId;

    // Afficher la valeur dans la console pour vérification
    console.log(deleteUserId.value);
  });
});



