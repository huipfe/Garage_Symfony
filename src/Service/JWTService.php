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
        if($validity > 0){
            // Avoir La date actuelle
            $now = new \DateTimeImmutable();
            // La date actuelle + 3 minutes (la validité en haut)
            $exp = $now->getTimestamp() + $validity;

            $payload["iat"] = $now->getTimestamp();
            $payload["exp"] = $exp;
        }



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

    // On vérifie que le token est valide. (correctement formé) (pas valide en terme de contenu, mais en terme de forme)
    public function isValid(string $token) : bool
    {
        return preg_match(
            '/^[a-zA-Z0-9\-\_\=]+\.[a-zA-Z0-9\-\_\=]+\.[a-zA-Z0-9\-\_\=]+$/',
                $token
        ) === 1;
    }

    // On récupère le payload
    public function getPayload(string $token) : array
    {
        // On démonte le token
        $array = explode('.', $token);

        // On décode le payload
        $payload = json_decode(base64_decode($array[1]), true);

        return $payload;

    }

    // On récupère le Header
    public function getHeader(string $token) : array
    {
        // On démonte le token
        $array = explode('.', $token);

        // On décode le Header
        $header = json_decode(base64_decode($array[0]), true);

        return $header;

    }

    // On vérifie si le token a expiré
    public function isExpired(string $token) : bool
    {
        $payload = $this->getPayload($token);

        $now = new \DateTimeImmutable();

        // Si l'expiration est plus petite que maintenant, il est expiré. Sinon non.
        return $payload['exp'] < $now->getTimestamp();
    }

    // On vérifie la signature du Token
    public function CheckSignature(string $token, string $secret)
    {
        // On récup le header, et le payload
        $header = $this->getHeader($token);
        $payload = $this->getPayload($token);

        // On régénère un token
        $verifToken = $this->generate($header, $payload, $secret, 0);

        return $token === $verifToken;
    }
}