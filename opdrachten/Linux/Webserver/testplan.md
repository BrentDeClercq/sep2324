# Testplan

- Auteur(s) testplan: Brent

## Test: Installatie httpd

Testprocedure:

1. Navigeer naar de map `/opdrachten/Linux/Vagrant/`
2. Voer volgend commando uit: `vagrant up web`
3. ssh naar server: `vagrant ssh web`
4. Check of de service draait: `sudo systemctl status httpd`
5. `sudo ss -tlnp`
6. surf naar het NAT-ip address met poort 80

Verwacht resultaat:

- http is enabled en draait op poort 80
- De voorbeeld site is zichtbaar in de browser

<!-- Voeg hier eventueel een screenshot van het verwachte resultaat in. -->

![httpd.service](./img/httpd.service.png)
![site](./img/site.png)

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
