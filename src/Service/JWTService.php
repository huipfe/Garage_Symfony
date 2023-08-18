<?php

namespace App\Service;


class JWTService
{
    // On génère le token

    /**
     * Génération du json web token (JWT)
     * @param array $header
     * @param array $payload
     * @param string $secret
     * @param int $validity
     * return string
     *
     */

    public function generate(array $header, array $payload, string $secret, int $validity = 10800):string
    {
        if($validity < 0){
            return "";
        }

        // Avoir La date actuelle
        $now = new \DateTimeImmutable();
        // La date actuelle + 3 minutes (la validité en haut)
        $exp = $now->getTimestamp() + $validity;

        $payload["iat"] = $now->getTimestamp();
        $payload["exp"] = $exp;

        //On encore le json en base64, pour que ce soit une chaine de caractère.

        $base64Header = base64_encode(json_encode($header));
        $base64Payload = base64_encode(json_encode($payload));

        //On nettoie les valeurs encodées (retrait des +, / et =)
        $base64Header = str_replace(['+', '/', '='], ['-', '_', ''], $base64Header);
        $base64Payload = str_replace(['+', '/', '='], ['-', '_', ''], $base64Payload);

        // On génère la signature, on encode en base64

        $secret = base64_encode($secret);

        $signature = hash_hmac("sha256", $base64Header . "." . $base64Payload, $secret, true);

        $base64Signature = base64_encode($signature);

        $base64Signature = str_replace(['+', '/', '='], ['-', '_', ''], $base64Signature);

        // On créer le token
        $jwt = $base64Header . "." . $base64Payload . "." . $base64Signature;

        return $jwt;
    }
}