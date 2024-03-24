# Testplan

- Auteur(s) testplan: Kenji De Coster

## Test: Installatie

Testprocedure:

1. Navigeer naar de map `/opdrachten/Linux/Vagrant/`
2. Voer volgend commando uit: `vagrant up proxy`
3. ssh naar server: `vagrant ssh proxy`
4. Check of de service draait: `sudo systemctl status nginx`

Verwacht resultaat:

- nginx zou moeten runnen en enabled staan

<!-- Voeg hier eventueel een screenshot van het verwachte resultaat in. -->

## Test: Certificaat

Testprocedure:

1. Navigeer naar de map `/opdrachten/Linux/Vagrant/`
2. Voer volgend commando uit: `vagrant up proxy db web client`
3. ssh naar server: `vagrant ssh proxy`
4. surf naar http://g06-tenurit.internal vanop client
5. surf naar https://g06-tenurit.internal vanop client 

Verwacht resultaat:

- beide zouden een wordpress pagina moeten geven

<!-- Voeg hier eventueel een screenshot van het verwachte resultaat in. -->

## Test: <!-- Omschrijving test. -->

...
