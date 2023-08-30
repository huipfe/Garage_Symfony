let links = document.querySelectorAll("[data-delete]");

//console.log(links);


// On boucle sur les liens
for(let link of links){
    // On met un écouteur d'événement
    link.addEventListener("click", function(e){
       // On empêche la navigation
       e.preventDefault();

       // On demande confirmation
        if(confirm("Etes-vous sûr de vouloir supprimer cette image ?")){

            // On envoit la requête Ajax
            fetch(this.getAttribute("href"), {
                method: "DELETE",
                headers: {
                    "X-Requested-With": "XMLHttpRequest",
                    "Content-Type": "application/json"
                },
                body: JSON.stringify({"_token" : this.dataset.token})
            }).then(response=> response.json())
                .then(data => {
                    console.log(data);
                   if(data.success){ // Si ça fonctionne
                       this.parentElement.remove(); // J'enlève la div de l'image supprimé
                   }else{
                       alert(data.error); // Sinon, j'ai une alerte erreur
                   }
                })
                .catch(error => {
                    console.error("Error:", error);
                });
        }
    });
}