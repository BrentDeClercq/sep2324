# Testplan

- Auteur(s) testplan: Brent De Clercq, Nobel Fiers

## Test: Vagrant Up, TFTP server moet lokaal draaien

Testprocedure:

1. Navigeer naar de map `/opdrachten/Linux/Vagrant/`
2. Voer volgend commando uit: `vagrant up tftp`
3. ssh naar server: `vagrant ssh tftp`
4. Er worden een aantal testbestanden automatisch toegevoegd aan de TFTP server: `file1.txt`, `file2.txt` en `file3.txt`
5. Haal deze bestanden op van de tftp server via volgende commando's:
6. `tftp localhost`
7. `get file1.txt`
8. `quit`

Verwacht resultaat:

- Dit zou direct moeten werken zonder `Request Timed Out`
- Er staat nu een bestand file1.txt in de map waar je het commando `tftp localhost` hebt uitgevoerd, dit bestand bevat de tekst `Hello File 1`

<!-- Voeg hier eventueel een screenshot van het verwachte resultaat in. -->

## Test: tftp configurations binnenhalen vanop router

Testprocedure:

1. activeer de router via `enable` en dan `config t`
2. navigeer naar de interface via `interface g0/0/0`
3. stel ip address in: `ip-address 192.168.106.233 255.255.255.248`
4. keer terug naar config t via `exit` en shcrijf `ip tftp source-interface gig0/0/0`
5. keer terug naar router# via `exit`en vraag de tftp server voor de config via `copy tftp running-config`
6. nodige gegevens:
   address remote host: `192.168.106.234`
   source filename: `R1_running-config.txt`
   destination filename: `running-config`

   Verwacht resultaat:

- router ontvangt de configuration en werkt met de ingestelde configuration. (kan je checken via `do show running-config`)

<!-- Voeg hier eventueel een screenshot van het verwachte resultaat in. -->

## Test: tftp configurations binnenhalen vanop switch

Testprocedure:

1. activeer de switch via `enable` en dan `config t`
2. navigeer naar de interface via `interface vlan 1`
3. stel ip address in: `ip-address 192.168.106.235 255.255.255.248`
4. keer terug naar switch# via `exit`en vraag de tftp server voor de config via `copy tftp running-config`
5. nodige gegevens:
   address remote host: `192.168.106.234`
   source filename: `S1_running-config.txt`
   destination filename: `running-config`

   Verwacht resultaat:

- switch ontvangt de configuration en werkt met de ingestelde configuration. (kan je checken via `do show running-config`)

<!-- Voeg hier eventueel een screenshot van het verwachte resultaat in. -->

## Test: <!-- Omschrijving test. -->

Testprocedure:

1. ...
2. ...

Verwacht resultaat:

- ...
- ...

<!-- Voeg hier eventueel een screenshot van het verwachte resultaat in. -->
