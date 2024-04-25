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
Router instellen (switch instellen tot stap 5 eerst!)

1.  activeer de router via `enable` en dan `config t`
2.  navigeer naar de interface via `interface g0/0/0`
3.  stel ip address in: `ip-address 192.168.106.233 255.255.255.248`
4.  keer terug naar config t via `exit` en shcrijf `ip tftp source-interface gig0/0/0`
5.  keer terug naar router# via `exit`en vraag de tftp server voor de config via `copy tftp running-config`
6.  nodige gegevens:
    address remote host: `192.168.106.234`
    source filename: `r1final.txt`
    destination filename: `running-config`
7.  Controleer via `show running-config`
8.  Controleer via `show ip interface brief`
9.  indien 8. aantoonde dat g0/0/0.1 zijn ip-address niet heeft -> `conf t` -> `interface g0/0/0.1` -> `ip address 192.168.106.233 255.255.255.248`.

Verwacht resultaat:

- router ontvangt de configuration en werkt met de ingestelde configuration.

<!-- Voeg hier eventueel een screenshot van het verwachte resultaat in. -->

## Test: tftp configurations binnenhalen vanop switch

Testprocedure:
Switch instellen

1.  activeer de switch via `enable`
2.  vlans leegmaken: `delete flash:vlan.dat`
3.  reload switch: `reload`
4.  ga naar de global configuration mode met `enable` en dan `config t`
5.  navigeer naar de interface via `interface vlan 1`
6.  stel ip address in: `ip-address 192.168.106.235 255.255.255.248`
7.  keer terug naar switch# via `exit`en vraag de tftp server voor de config via `copy tftp running-config`
8.  nodige gegevens:
    address remote host: `192.168.106.234`
    source filename: `s1final-confg`
    destination filename: `running-config`
9.  Controleer via `show running-config`
10. Controleer via `show vlan brief`

Verwacht resultaat:

- switch ontvangt de configuration en werkt met de ingestelde configuration.

<!-- Voeg hier eventueel een screenshot van het verwachte resultaat in. -->

## Test: <!-- Omschrijving test. -->

Testprocedure:

1. ...
2. ...

Verwacht resultaat:

- ...
- ...

<!-- Voeg hier eventueel een screenshot van het verwachte resultaat in. -->
