let links = document.querySelectorAll("[data-delete]");

//console.log(links);


// On boucle sur les liens
for(let link of links){
    // On met un écouteur d'événement
    link.addEventListener("click", function(e) {
        e.preventDefault();

        if (confirm("Etes-vous sûr de vouloir supprimer cette image ?")) {
            fetch(this.getAttribute("href"), {
                method: "DELETE",
                headers: {
                    "X-Requested-With": "XMLHttpRequest",
                    "Content-Type": "application/json"
                },
                body: JSON.stringify({"_token": this.dataset.token})
            })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        this.parentElement.remove();
                    } else {
                        alert(data.error);
                    }
                })
                .catch(error => {
                    console.error("Error:", error);
                    alert("Une erreur s'est produite lors de la suppression de l'image.");
                });
        }
    });
}