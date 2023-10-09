<?php


if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['formId']) && $_POST['formId'] === 'contactForm') {
    // Vérifiez si les champs requis ne sont pas vides
    if (empty($_POST['name']) || empty($_POST['email']) || empty($_POST['message']) || empty($_POST['subject'])) {
        $response = array('status' => 'error', 'message' => 'Tous les champs sont obligatoires.');
        // Renvoyez la réponse au format JSON
        header('Content-Type: application/json');
        echo json_encode($response);
        exit;
    }

    // Récupérer les valeurs du formulaire

    $maxNameLength = 100; // Limite de longueur pour le nom
    $maxMessageLength = 1000; // Limite de longueur pour le message

    $email = $_POST['email'];
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $response = array('status' => 'error', 'message' => 'L\'adresse e-mail n\'est pas valide.');
        // Renvoyez la réponse au format JSON
        header('Content-Type: application/json');
        echo json_encode($response);
        exit;
    }
    $name = $_POST['name'];
    $message = $_POST['message'];
    if (strlen($name) > $maxNameLength || strlen($message) > $maxMessageLength) {
        $response = array('status' => 'error', 'message' => 'La longueur des données dépasse la limite autorisée.');
        // Renvoyez la réponse au format JSON
        header('Content-Type: application/json');
        echo json_encode($response);
        exit;
    }
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
