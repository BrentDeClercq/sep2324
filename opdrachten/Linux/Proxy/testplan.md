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
4. surf naar http://g06-tenurit.internal vanop de windows client of gebruikmakend van de eigen dns regels op host
5. surf naar https://g06-tenurit.internal vanop de windows client of gebruikmakend van de eigen dns regels op host
6. kijk in de log files of je http/2 ziet staan

Verwacht resultaat:

- beide zouden een wordpress pagina moeten geven
- je zou af en toe http/2 moeten zien staan

<!-- Voeg hier eventueel een screenshot van het verwachte resultaat in. -->

## Test: nmap obfuscation

Testprocedure:

1. voer volgend commandos uit ergens, behalve op de proxy:
   1. `nmap 192.168.106.250`
   2. `nmap -p80,443 192.168.106.250`
   3. `nmap -sV -p80,443 192.168.106.250`

Verwacht resultaat:

- Je zou geen versie nummer mogen zien staan naast nginx
