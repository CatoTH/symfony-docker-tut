<?php

namespace App\Tests\application;

use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;

class RequestTest extends WebTestCase
{
    public function testSomething(): void
    {
        $client = static::createClient();
        $crawler = $client->request('GET', '/');

        $this->assertResponseIsSuccessful();
        $this->assertSelectorTextContains('title', 'Quotes');
    }
}
