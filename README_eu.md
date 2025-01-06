<!--
Ohart ongi: README hau automatikoki sortu da <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>ri esker
EZ editatu eskuz.
-->

# Cockpit YunoHost-erako

[![Integrazio maila](https://apps.yunohost.org/badge/integration/cockpit)](https://ci-apps.yunohost.org/ci/apps/cockpit/)
![Funtzionamendu egoera](https://apps.yunohost.org/badge/state/cockpit)
![Mantentze egoera](https://apps.yunohost.org/badge/maintained/cockpit)

[![Instalatu Cockpit YunoHost-ekin](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=cockpit)

*[Irakurri README hau beste hizkuntzatan.](./ALL_README.md)*

> *Pakete honek Cockpit YunoHost zerbitzari batean azkar eta zailtasunik gabe instalatzea ahalbidetzen dizu.*  
> *YunoHost ez baduzu, kontsultatu [gida](https://yunohost.org/install) nola instalatu ikasteko.*

## Aurreikuspena

Cockpit is an interactive server admin interface. It is easy to use and very lightweight. Cockpit interacts directly with the operating system from a real Linux session in a browser.

**Paketatutako bertsioa:** 239~ynh2

## Pantaila-argazkiak

![Cockpit(r)en pantaila-argazkia](./doc/screenshots/screenshot-storage.png)

## Dokumentazioa eta baliabideak

- Aplikazioaren webgune ofiziala: <https://cockpit-project.org/>
- Administratzaileen dokumentazio ofiziala: <https://cockpit-project.org/documentation.html>
- Jatorrizko aplikazioaren kode-gordailua: <https://github.com/cockpit-project/cockpit>
- YunoHost Denda: <https://apps.yunohost.org/app/cockpit>
- Eman errore baten berri: <https://github.com/YunoHost-Apps/cockpit_ynh/issues>

## Garatzaileentzako informazioa

Bidali `pull request`a [`testing` abarrera](https://github.com/YunoHost-Apps/cockpit_ynh/tree/testing).

`testing` abarra probatzeko, ondorengoa egin:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/cockpit_ynh/tree/testing --debug
edo
sudo yunohost app upgrade cockpit -u https://github.com/YunoHost-Apps/cockpit_ynh/tree/testing --debug
```

**Informazio gehiago aplikazioaren paketatzeari buruz:** <https://yunohost.org/packaging_apps>
