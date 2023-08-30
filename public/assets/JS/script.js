/*-----------------------------------Général JS------------------------------------------------- */

// Disparition du message d'erreur/success, après 5 secondes
$(document).ready(function () {
    // Fonction pour masquer le message après un délai spécifié
    function hideMessage() {
        $('#alert').fadeOut(500, function () {
            // Supprimer le message de la page
            $(this).remove();
        });
    }

    // Vérifier si le message d'erreur ou de succès est affiché
    let alertElement = $('#alert');
    if (alertElement.length > 0) {
        // Masquer le message après 5 secondes (5000 millisecondes)
        setTimeout(hideMessage, 1500);
    }
});

