<?php

use PHPUnit\Framework\TestCase;
use App\Service\JWTService;

class JWTServiceTest extends TestCase
{
    public function testGenerateAndIsValid()
    {
        $jwtService = new JWTService();

        $header = ["alg" => "HS256", "typ" => "JWT"];
        $payload = ["user_id" => 1, "username" => "john_doe"];
        $secret = "your_secret_key";

        // Test de génération
        $token = $jwtService->generate($header, $payload, $secret);
        $this->assertTrue(is_string($token));

        // Test de validation de la structure
        $this->assertTrue($jwtService->isValid($token));

        // Vérifie que le champ 'iat' existe dans le payload
        $decodedPayload = $jwtService->getPayload($token);
        $this->assertArrayHasKey('iat', $decodedPayload);

        // Vérifie que le champ 'exp' existe dans le payload
        $this->assertArrayHasKey('exp', $decodedPayload);
    }

    public function testIsExpired()
    {
        $jwtService = new JWTService();

        $header = ["alg" => "HS256", "typ" => "JWT"];
        $payload = ["user_id" => 1, "username" => "john_doe", "exp" => 1697828833]; // Ajout du champ 'exp'
        $secret = "your_secret_key";

        // Vérifie que le token n'est pas expiré
        $validToken = $jwtService->generate($header, $payload, $secret, 3600);
        $this->assertFalse($jwtService->isExpired($validToken));

        // Crée un token expiré (avec une validité de -1)
        $payload['exp'] = 1697818033; // Un timestamp passé
        $expiredToken = $jwtService->generate($header, $payload, $secret, -1);

        // Vérifie que le token expiré est expiré
        $this->assertTrue($jwtService->isExpired($expiredToken));
    }
}
