# Cockpit pour YunoHost

[![Niveau d'intégration](https://dash.yunohost.org/integration/cockpit.svg)](https://dash.yunohost.org/appci/app/cockpit) ![](https://ci-apps.yunohost.org/ci/badges/cockpit.status.svg) ![](https://ci-apps.yunohost.org/ci/badges/cockpit.maintain.svg)  
[![Installer Cockpit avec YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=cockpit)

*[Read this readme in english.](./README.md)*
*[Lire ce readme en français.](./README_fr.md)*

> *Ce package vous permet d'installer Cockpit rapidement et simplement sur un serveur YunoHost.
Si vous n'avez pas YunoHost, regardez [ici](https://yunohost.org/#/install) pour savoir comment l'installer et en profiter.*

## Vue d'ensemble

Session de connexion sysadmin dans un navigateur Web.

**Version incluse :** 232~ynh1



## Captures d'écran

![](./doc/screenshots/screenshot-storage.png)

## Documentations et ressources

* Documentation YunoHost pour cette app : https://yunohost.org/app_cockpit
* Signaler un bug : https://github.com/YunoHost-Apps/cockpit_ynh/issues

## Informations pour les développeurs

Merci de faire vos pull request sur la [branche testing](https://github.com/YunoHost-Apps/cockpit_ynh/tree/testing).

Pour essayer la branche testing, procédez comme suit.
```
sudo yunohost app install https://github.com/YunoHost-Apps/cockpit_ynh/tree/testing --debug
ou
sudo yunohost app upgrade cockpit -u https://github.com/YunoHost-Apps/cockpit_ynh/tree/testing --debug
```

**Plus d'infos sur le packaging d'applications :** https://yunohost.org/packaging_apps