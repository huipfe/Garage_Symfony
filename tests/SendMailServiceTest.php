<?php

use PHPUnit\Framework\TestCase;
use App\Service\SendMailService;
use Symfony\Component\Mailer\Exception\TransportExceptionInterface;
use Symfony\Component\Mailer\MailerInterface;
use Symfony\Component\Mime\Email;

class SendMailServiceTest extends TestCase
{
    /**
     * @throws TransportExceptionInterface
     */
    public function testSendMailService()
    {
        // Créez un double (mock) pour MailerInterface
        $mailer = $this->createMock(MailerInterface::class);

        // Créez une instance de SendMailService en utilisant le mock du Mailer
        $sendMailService = new SendMailService($mailer);

        // Configurez le mock du Mailer pour s'attendre à l'appel à send()
        // Ici, nous utilisons expect() pour s'assurer que send() sera appelé exactement une fois.
        $mailer->expects($this->once())
            ->method('send')
            ->with($this->isInstanceOf(Email::class));

        // Appelez la méthode Send() du service pour envoyer un e-mail
        $from = 'sender@example.com';
        $to = 'recipient@example.com';
        $subject = 'Test Subject';
        $template = 'test_template';
        $context = ['key' => 'value'];
        $sendMailService->Send($from, $to, $subject, $template, $context);
    }
}
