# Testplan

- Auteur(s) testplan: Julie De Witte

## Test: Installatie beide Windows virtuele machines

Testprocedure:

1. Pas alvorens de scripts uit te voeren, de instellingen op je pc aan zodanig dat je VBoxManage scripts kunt uitvoeren
2. Benodigde ISO files: `Windows 10` (clientVM) en `Windows Server` (DomeinController)
3. Voer `server-vm.ps1` uit om de server VM te installeren, en `client-vm.ps` om de client VM te installeren, doe dit aan de hand van shared folders via VirtualBox

Verwacht resultaat:

- Beide draaien correct en kunnen opgestart worden aan de hand van de geautomatiseerde scripts

<!-- Voeg hier eventueel een screenshot van het verwachte resultaat in. -->
![VMs-aangemaakt](./img/vms-worden-aangemaakt.png)


## Test: Promoveren van server VM naar domeincontroller

Testprocedure:

1. Voer het script `promoting-dc.ps1` uit op de server VM om deze te promoveren naar DomeinController
2. Zorg wel dat de guest-additions geïnstalleerd zijn, anders zal het script niet werken!
3. Je kan nagaan of het geslaagd is door volgend commando in te geven op de DC: `Get-ADDomainController`

Verwacht resultaat:

- De DomeinController werd succesvol aangemaakt

<!-- Voeg hier eventueel een screenshot van het verwachte resultaat in. -->
![domeincontroller](./img/get-addomaincontroller.png)


## Test: Installeren RSAT tools

Testprocedure:

1. Voer het script `config-client.ps1` uit op de client VM
2. Zorg hier wederom dat de guest-additions geïnstalleerd zijn, aangezien het script anders niet zal werken!
3. Ga na of de RSAT-tools geïnstalleerd zijn via Control Panel

Verwacht resultaat:

- Je beschikt over de benodigde RSAT-tools op je client VM

<!-- Voeg hier eventueel een screenshot van het verwachte resultaat in. -->
![rsat](./img/RSAT.png)

## Test: Opzetten AD-domein en toevoegen windows client aan dit domein

Testprocedure:

1. Voer het script `install-forest.ps1` uit op de DC om het AD domein op te zetten
2. Voeg nadien de client toe aan het domein door het script `add-client-to-domain.ps1` uit te voeren op de client
3. Voer het script `configure-staticIP.ps1` uit op beide VM's (niet dezelfde scripts, enkel degene die in de juiste map staan) om de IP's te configureren en na te gaan dat de VMs elkaar kunnen pingen

Verwacht resultaat:

- Via de RSAT tools op de client kun je nagaan of de client daadwerkelijk in het domein zit

<!-- Voeg hier eventueel een screenshot van het verwachte resultaat in. -->
![client-bij-domein](./img/client-bij-domein.png)
![adapter-settings](./img/adapter-settings.png)

## Test: Opstellen logische domeinstructuur

Testprocedure:

1. Voeg op de DC het script `ou-installation.ps1` uit om de logische domeinstructuur op te stellen
2. Voeg alle gebruikers en toestellen toe op het domein door script `add-users.ps1` en `add-computers.ps1` uit te voeren

Verwacht resultaat:

- De logische domeinstructuur werd opgesteld, dit kun je nagaan via de RSAT-tools
- Er zijn zowel normale users als admins aangemaakt tijdens het proces

<!-- Voeg hier eventueel een screenshot van het verwachte resultaat in. -->
![domeinstructuur](./img/logische-domeinstructuur.png)
![users](./img/add-users-script-voltooid.png)
![admins](./img/add-users-admins.png)


## Test: Instellen group policies & Shared Folders

Testprocedure:

1. Voer script `group-policies.ps1` uit
2. Voer script `shared-folders.ps1` uit

Verwacht resultaat:

- Niet-admin gebruikers zullen niet kunnen inloggen op de DC, admins wel zoals je kan zien op de screenshots
- Gebruikers kunnen elkaars shared folders niet modifiëren, enkel hun eigen shared folders

<!-- Voeg hier eventueel een screenshot van het verwachte resultaat in. -->
![adminlogin](./img/admin-kan-inloggen-grouppolicy.png)
![adminlogin](./img/admin-kan-inloggen-grouppolicy2.png)

![userlogin](./img/user-kan-niet-inloggen-grouppolicy.png)
![userlogin](./img/user-kan-niet-inloggen-grouppolicy2.png)

![sharedfolders](./img/shared-folders.png)
![sharedfolders](./img/shared-folders2.png)


## Test: Instellen DNS-server

Testprocedure:

1. Voer de scripts `rename-dc.ps1` & `rename-client.ps1`uit
2. Voer volgende scripts uit: `dns-configuratie.ps1` -> `dns-reverselookup` -> `dns-PTR`

Verwacht resultaat:

- De zones werden succesvol aangemaakt en de dns service is running

<!-- Voeg hier eventueel een screenshot van het verwachte resultaat in. -->
![dns](./img/reverse-lookup-zone-toegevoegd.png)


