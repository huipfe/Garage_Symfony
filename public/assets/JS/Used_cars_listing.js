/*--------------------------------------Barre de Recherche-------------------------------------------*/

// Fonction de recherche
const searchCars = () => {
    // Récupérer la valeur de recherche
    const searchValue = document.getElementById("searchInput").value.toLowerCase();
    // Récupérer toutes les cartes de voiture
    const carCards = document.getElementsByClassName("card");
    // Variable pour vérifier si au moins une carte a été affichée
    let foundCar = false;
    // Parcourir les cartes de voiture et afficher/masquer en fonction de la recherche
    for (const carCard of carCards) {
        const carTitleElement = carCard.querySelector(".card-title");
        const carSlugElement = carCard.querySelector(".card-category");
        const carCategoryElement = carCard.querySelector(".card-slug");
        const carDescriptionElement = carCard.querySelector(".card-text#title-description");
        const carModeleElement = carCard.querySelector(".card-text#title-modele");
        const carPriceElement = carCard.querySelector(".card-text#title-price");
        const carYearElement = carCard.querySelector(".card-text#title-year");
        const carKilometrageElement = carCard.querySelector(".card-text#title-kilometrage");

        // Vérifier si la valeur de recherche est un nombre
        const searchNumber = parseFloat(searchValue);
        const isNumber = !isNaN(searchNumber) && isFinite(searchNumber);

        if (
            (carTitleElement && carTitleElement.innerText.toLowerCase().includes(searchValue)) ||
            (carCategoryElement && carCategoryElement.innerText.toLowerCase().includes(searchValue)) ||
            (carSlugElement && carSlugElement.innerText.toLowerCase().includes(searchValue)) ||
            (carDescriptionElement && carDescriptionElement.innerText.toLowerCase().includes(searchValue)) ||
            (carModeleElement && carModeleElement.innerText.toLowerCase().includes(searchValue)) ||
            (carPriceElement && carPriceElement.innerText.toLowerCase().includes(searchValue)) ||
            (carYearElement && carYearElement.innerText.toLowerCase().includes(searchValue)) ||
            (carKilometrageElement && carKilometrageElement.innerText.toLowerCase().includes(searchValue))
        ) {
            carCard.style.display = "block";
            foundCar = true;  // Au moins une carte a été trouvée
        } else {
            carCard.style.display = "none";
        }
    }
    // Afficher ou masquer le message "Aucun produit trouvé"
    const noResultsMessage = document.getElementById("noResultsMessage");
    if (foundCar) {
        noResultsMessage.style.display = "none"; // Masquer le message s'il y a des résultats
    } else {
        noResultsMessage.style.display = "block"; // Afficher le message s'il n'y a pas de résultats
    }
};

// Écouter l'événement de saisie dans la barre de recherche
const searchInput = document.getElementById("searchInput");
searchInput.addEventListener("input", searchCars);

// Écouter l'événement de clic sur le bouton de recherche
// const searchButton = document.getElementById("searchButton");
// searchButton.addEventListener("click", searchCars);

// /*--------------------------------------Barre de Filtrage-------------------------------------------*/

// Fonction de filtrage des voitures
const filtrerVoitures = () => {
    // Récupérer la liste des voitures
    const voitures = Array.from(document.getElementsByClassName("card"));

    // Parcourir la liste des voitures et appliquer les filtres
    voitures.forEach((voiture) => {
        // Récupérer les valeurs des cases à cocher à chaque itération
        const checkbox1 = document.getElementById("checkbox1").checked; // Supérieur ou égale à année >=
        const checkbox2 = document.getElementById("checkbox2").checked; // Inférieur ou égale à année <=
        const checkbox3 = document.getElementById("checkbox3").checked; // Supérieur ou égale à kilomètre >=
        const checkbox4 = document.getElementById("checkbox4").checked; // Inférieur ou égale à kilomètre <=
        const checkbox5 = document.getElementById("checkbox5").checked; // Inférieur ou égale à prix <=

        const annee = parseInt(voiture.querySelector(".filter-year span").textContent);
        const kilometrage = parseInt(voiture.querySelector(".filter-kilometrage span").textContent.replace(" ", ""));
        const prix = parseInt(voiture.querySelector("#title-price span").textContent.replace(" ", "").replace("€", ""));

        // Afficher toutes les voitures si aucune case n'est cochée
        if (!checkbox1 && !checkbox2 && !checkbox3 && !checkbox4 && !checkbox5) {
            voiture.style.display = "block";
            return;
        }

        // Variable filtre
        const years = 2020;
        const kilometers = 2000;
        const prices = 100000;

        // Filtrer par année
        const filtreAnnee1 = checkbox1 && annee >= years;
        const filtreAnnee2 = checkbox2 && annee <= years;

        // Filtrer par kilométrage
        const filtreKilometrage1 = checkbox3 && kilometrage >= kilometers;
        const filtreKilometrage2 = checkbox4 && kilometrage <= kilometers;

        // Filtrer par prix
        const filtrePrix = checkbox5 && prix <= prices;

        // Cacher les voitures qui ne passent pas les filtres
        if (filtreAnnee1 || filtreAnnee2 || filtreKilometrage1 || filtreKilometrage2 || filtrePrix) {
            voiture.style.display = "block";
        } else {
            voiture.style.display = "none";
        }
    });
};

// Lier la fonction de filtrage à l'événement "change" des cases à cocher
document.getElementById("checkbox1").addEventListener("change", filtrerVoitures);
document.getElementById("checkbox2").addEventListener("change", filtrerVoitures);
document.getElementById("checkbox3").addEventListener("change", filtrerVoitures);
document.getElementById("checkbox4").addEventListener("change", filtrerVoitures);
document.getElementById("checkbox5").addEventListener("change", filtrerVoitures);

/*-----------------------------Comportement checkbox - Barre de Filtrage---------------------------*/

// Sélectionnez toutes les checkboxes avec la classe "form-check-input"
const checkboxes = document.querySelectorAll('.form-check-input');

// Ajoutez un gestionnaire d'événement "change" à chaque checkbox
checkboxes.forEach(checkbox => {
    checkbox.addEventListener('change', function () {
        if (this.checked) {
            // Si une checkbox est cochée, désactivez les autres checkboxes du même groupe
            const groupName = this.getAttribute('name');
            const groupCheckboxes = document.querySelectorAll(`input[name="${groupName}"]`);

            groupCheckboxes.forEach(groupCheckbox => {
                if (groupCheckbox !== this) {
                    groupCheckbox.checked = false;
                }
            });
        }
        filtrerVoitures(); // Appeler la fonction de filtrage après chaque modification de checkbox
    });
});


/*--------------------------------------Modale de supression---------------------------------------*/
const deleteModal = document.getElementById('deleteModal');
deleteModal.addEventListener('show.bs.modal', function (event) {
    const button = event.relatedTarget;
    const action = button.getAttribute('data-action');
    const deleteForm = document.getElementById('deleteForm');
    deleteForm.action = action;
});


document.querySelectorAll('.deleteBtn').forEach(button => {
    button.addEventListener('click', function () {
        const action = this.getAttribute('data-action');
        const deleteForm = document.querySelector('#deleteForm' + action.split('/').pop());

        deleteForm.action = action;
    });
});