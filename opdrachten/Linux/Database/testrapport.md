# Testrapport

- Uitvoerder(s) test: Kenji De Coster
- Uitgevoerd op: 8/3/2024
- Github commit: <!-- Git commit hash. -->

## Test: Installatie

Testprocedure:

1. Navigeer naar de map `/opdrachten/Linux/Vagrant/`
2. Voer volgend commando uit: `vagrant up database`
3. ssh naar server: `vagrant ssh database`
4. Check of de service draait: `sudo systemctl status mariadb`
5. `sudo ss -tlnp`

Verkregen resultaat:

- Mariadb is aan het draaien en is enabled

<!-- Voeg hier eventueel een screenshot van het verkregen resultaat in. -->

![alt text](image.png)

Test geslaagd:

- [x] Ja
- [ ] Nee

Opmerkingen:

- ...

## Test: <!-- Omschrijving test. -->

Test procedure:

1. ...
2. ...

Verkregen resultaat:

- ...
- ...

<!-- Voeg hier eventueel een screenshot van het verkregen resultaat in. -->

Test geslaagd:

- [ ] Ja
- [ ] Nee

Opmerkingen:

- ...

## Test: <!-- Omschrijving test. -->

...
