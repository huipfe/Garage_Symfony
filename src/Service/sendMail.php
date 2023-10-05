<?php

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['formId']) && $_POST['formId'] === 'contactForm') {
    // Récupérer les valeurs du formulaire
    $name = $_POST['name'];
    $email = $_POST['email'];
    $message = $_POST['message'];
    $subject = $_POST['subject'];

    // Adresse e-mail de destination
    $to = 'Garage-Parrot@gmail.com'; //Mail du destinataire, proprio du Garage

    // Sujet de l'e-mail
    //$subject = 'Message depuis le contact du site de Garage V.Parrot';
    $body = "Sujet: " . $subject;

    // Corps de l'e-mail
    $body = "Nom: " . $name . "\n";
    $body .= "Email: " . $email . "\n";
    $body .= "Message: " . $message;

    // En-têtes de l'e-mail
    $headers = "From: " . $email . "\r\n";
    $headers .= "Reply-To: " . $email . "\r\n";

    // Envoyer l'e-mail
    if (mail($to, $subject, $body, $headers)) {
        // L'e-mail a été envoyé avec succès
        $response = array('status' => 'success', 'message' => 'Le formulaire a été envoyé avec succès!');
    } else {
        // Une erreur s'est produite lors de l'envoi de l'e-mail
        $response = array('status' => 'error', 'message' => 'Une erreur s\'est produite lors de l\'envoi du formulaire.');
    }

    // Renvoyer la réponse au format JSON
    header('Content-Type: application/json');
    echo json_encode($response);

}


?>
