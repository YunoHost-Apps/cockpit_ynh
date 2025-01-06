<!--
Nota bene : ce README est automatiquement généré par <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
Il NE doit PAS être modifié à la main.
-->

# Cockpit pour YunoHost

[![Niveau d’intégration](https://apps.yunohost.org/badge/integration/cockpit)](https://ci-apps.yunohost.org/ci/apps/cockpit/)
![Statut du fonctionnement](https://apps.yunohost.org/badge/state/cockpit)
![Statut de maintenance](https://apps.yunohost.org/badge/maintained/cockpit)

[![Installer Cockpit avec YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=cockpit)

*[Lire le README dans d'autres langues.](./ALL_README.md)*

> *Ce package vous permet d’installer Cockpit rapidement et simplement sur un serveur YunoHost.*  
> *Si vous n’avez pas YunoHost, consultez [ce guide](https://yunohost.org/install) pour savoir comment l’installer et en profiter.*

## Vue d’ensemble

Cockpit est une interface d'administration de serveur interactive. Il est facile à utiliser et très léger. Cockpit interagit directement avec le système d'exploitation à partir d'une vraie session Linux dans un navigateur.

**Version incluse :** 239~ynh2

## Captures d’écran

![Capture d’écran de Cockpit](./doc/screenshots/screenshot-storage.png)

## Documentations et ressources

- Site officiel de l’app : <https://cockpit-project.org/>
- Documentation officielle de l’admin : <https://cockpit-project.org/documentation.html>
- Dépôt de code officiel de l’app : <https://github.com/cockpit-project/cockpit>
- YunoHost Store : <https://apps.yunohost.org/app/cockpit>
- Signaler un bug : <https://github.com/YunoHost-Apps/cockpit_ynh/issues>

## Informations pour les développeurs

Merci de faire vos pull request sur la [branche `testing`](https://github.com/YunoHost-Apps/cockpit_ynh/tree/testing).

Pour essayer la branche `testing`, procédez comme suit :

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/cockpit_ynh/tree/testing --debug
ou
sudo yunohost app upgrade cockpit -u https://github.com/YunoHost-Apps/cockpit_ynh/tree/testing --debug
```

**Plus d’infos sur le packaging d’applications :** <https://yunohost.org/packaging_apps>
