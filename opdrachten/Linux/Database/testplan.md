# Testplan

- Auteur(s) testplan: Brent De Clercq

## Test: Installatie

Testprocedure:

1. Navigeer naar de map `/opdrachten/Linux/Vagrant/`
2. Voer volgend commando uit: `vagrant up database`
3. ssh naar server: `vagrant ssh database`
4. Check of de service draait: `sudo systemctl status mariadb`
5. `sudo ss -tlnp`

Verwacht resultaat:

- Mariadb is aan het draaien en is enabled

<!-- Voeg hier eventueel een screenshot van het verwachte resultaat in. -->

## Test: <!-- Omschrijving test. -->

Testprocedure:

1. ...
2. ...

Verwacht resultaat:

- ...
- ...

<!-- Voeg hier eventueel een screenshot van het verwachte resultaat in. -->

## Test: <!-- Omschrijving test. -->

...
