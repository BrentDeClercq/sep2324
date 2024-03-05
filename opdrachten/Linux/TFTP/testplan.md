# Testplan

- Auteur(s) testplan: Brent De Clercq

## Test: Vagrant Up, TFTP server moet lokaal draaien

Testprocedure:

1. Navigeer naar de map `/opdrachten/Linux/Vagrant/`
2. Voer volgend commando uit: `vagrant up tftp`
3. ssh naar server: ``vagrant ssh tftp`
4. Er worden een aantal testbestanden automatisch toegevoegd aan de TFTP server: `file1.txt`, `file2.txt` en `file3.txt`
5. Haal deze bestanden op van de tftp server via volgende commando's:
6. `tftp localhost`
7. `get file1.txt`
8. `quit`

Verwacht resultaat:

- Dit zou direct moeten werken zonder `Request Timed Out`
- Er staat nu een bestand file1.txt in de map waar je het commando `tftp localhost` hebt uitgevoerd, dit bestand bevat de tekst `Hello File 1`

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
