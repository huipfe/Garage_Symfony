/*-----------------------------------Général JS------------------------------------------------- */

// Disparition du message d'erreur/success, après 2 secondes

document.addEventListener("DOMContentLoaded", function () {
    // Sélectionnez la div flash-messages
    const flashMessages = document.querySelector('.flash-messages');

    // Cachez la div flash-messages après 2 secondes
    setTimeout(() => {
        flashMessages.style.display = 'none';
    }, 2000);
});
