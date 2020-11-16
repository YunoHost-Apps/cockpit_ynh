# Cockpit for YunoHost

[![Integration level](https://dash.yunohost.org/integration/cockpit.svg)](https://dash.yunohost.org/appci/app/cockpit) ![](https://ci-apps.yunohost.org/ci/badges/cockpit.status.svg) ![](https://ci-apps.yunohost.org/ci/badges/cockpit.maintain.svg)  
[![Install Cockpit with YunoHost](https://install-app.yunohost.org/install-with-yunohost.png)](https://install-app.yunohost.org/?app=cockpit)

*[Lire ce readme en français.](./README_fr.md)*

> *This package allows you to install Cockpit quickly and simply on a YunoHost server.  
If you don't have YunoHost, please consult [the guide](https://yunohost.org/#/install) to learn how to install it.*

## Overview
Cockpit makes GNU/Linux discoverable. See your server in a web browser and perform system tasks with a mouse. It’s easy to start containers, administer storage, configure networks, and inspect logs.

**Shipped version:** 232

## Screenshots

![](https://cockpit-project.org/images/site/screenshot-storage.png)

## Demo

* [Official demo](Link to a demo site for this app.)

## Configuration

How to configure this app: From an admin panel, a plain file with SSH, or any other way.

## Documentation

 * Official documentation: https://cockpit-project.org/guide/latest/
 * YunoHost documentation: If specific documentation is needed, feel free to contribute.

## YunoHost specific features

#### Multi-user support

 * Are LDAP and HTTP auth supported?
 * Can the app be used by multiple users?

#### Supported architectures

* x86-64 - [![Build Status](https://ci-apps.yunohost.org/ci/logs/cockpit%20%28Apps%29.svg)](https://ci-apps.yunohost.org/ci/apps/cockpit/)
* ARMv8-A - [![Build Status](https://ci-apps-arm.yunohost.org/ci/logs/cockpit%20%28Apps%29.svg)](https://ci-apps-arm.yunohost.org/ci/apps/cockpit/)

## Limitations

* Any known limitations.

## Additional information

* Other info you would like to add about this app.

## Links

 * Report a bug: https://github.com/YunoHost-Apps/cockpit_ynh/issues
 * App website: https://cockpit-project.org/
 * Upstream app repository: https://github.com/cockpit-project/cockpit
 * YunoHost website: https://yunohost.org/

---

## Developer info

Please send your pull request to the [testing branch](https://github.com/YunoHost-Apps/cockpit_ynh/tree/testing).

To try the testing branch, please proceed like that.
```
sudo yunohost app install https://github.com/YunoHost-Apps/cockpit_ynh/tree/testing --debug
or
sudo yunohost app upgrade cockpit -u https://github.com/YunoHost-Apps/cockpit_ynh/tree/testing --debug
```
