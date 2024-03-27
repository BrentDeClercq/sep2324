# Testplan voor demo in week 7

## Opzetten

Netwerkschema:
![Netwerkschema](./img/netwerkschema.png)

### Algemeen

- [ ] Kabels in serverruimte (15 min)
- [ ] Firewall uitzetten
- [ ] Wifi uitzetten

### Nobel

- [ ] TFTP opstarten
- [ ] Kijken of TFTP bridged op de juiste interface van laptop zit
- [ ] Router IP instellen
- [ ] Switch IP instellen
- [ ] Ping testen
- [ ] Router instellen via TFTP
- [ ] Switch instellen via TFTP

### Brent

- [ ] DB opstarten
- [ ] Web opstarten
- [ ] Web inloggen
- [ ] Web post aanmaken
- [ ] Overzicht van alle taken

### Kenji

- [ ] Proxy opstarten

### Julie

- [ ] Windows Client opstarten
- [ ] In windows client inloggen op server via ad
- [ ] Kijken of RSAT-tools geïnstalleerd zijn

### Rayane

- [ ] Windows server opstarten
- [ ] Check of AD werkt
- [ ] DNS
- [ ] Shared Folder
- [ ] Group Policies controleren

## Belangrijke commando's

- `sudo cat /var/log/httpd/wordpress_access.log`
- `sudo cat /var/log/nginx/access.log`

## Tests

### Algemeen (Linux en WinServ)

1. Test voor elke vm of de ip-adressen goed zijn ingesteld: `ip a`/`ipconfig /all`
2. Op elke vm pingen naar de default gateway van die VLAN
3. Vervolgens een andere vm proberen pingen om te zien of ROAS/Inter VLAN routing werkt
4. Ping de router interface aan de kant van de ISP: `ping 192.168.106.253`
5. Ping de ISP: `ping 192.168.106.254`
6. Ping het internet: `ping 8.8.8.8 of ping 1.1.1.1`

### Windows Client

1. Log in op AD
   1. Indien dit faalt, test of de client zeker toegang heeft tot de server
   2. eventueel inloggen op lokale gebruiker en pingen naar de server
2. Probeer te surfen naar de site: `g06-tenurit.internal`
3. Hierdoor wordt proxy en dns getest, probeer ook: `www.g06-tenurit.internal`
4. Bij problemen:
   1. Check of DNS aan staat: `nslookup google.com of hogent.be`
   2. Check of DNS naar onze site werkt: `nslookup g06-tenurit.internal`
   3. Check of proxy bereikbaar is: `ping 192.168.106.250`
