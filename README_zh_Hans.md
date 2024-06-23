<!--
注意：此 README 由 <https://github.com/YunoHost/apps/tree/master/tools/readme_generator> 自动生成
请勿手动编辑。
-->

# YunoHost 上的 Cockpit

[![集成程度](https://dash.yunohost.org/integration/cockpit.svg)](https://dash.yunohost.org/appci/app/cockpit) ![工作状态](https://ci-apps.yunohost.org/ci/badges/cockpit.status.svg) ![维护状态](https://ci-apps.yunohost.org/ci/badges/cockpit.maintain.svg)

[![使用 YunoHost 安装 Cockpit](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=cockpit)

*[阅读此 README 的其它语言版本。](./ALL_README.md)*

> *通过此软件包，您可以在 YunoHost 服务器上快速、简单地安装 Cockpit。*  
> *如果您还没有 YunoHost，请参阅[指南](https://yunohost.org/install)了解如何安装它。*

## 概况

Cockpit is an interactive server admin interface. It is easy to use and very lightweight. Cockpit interacts directly with the operating system from a real Linux session in a browser.

**分发版本：** 239~ynh2

## 截图

![Cockpit 的截图](./doc/screenshots/screenshot-storage.png)

## 文档与资源

- 官方应用网站： <https://cockpit-project.org/>
- 官方管理文档： <https://cockpit-project.org/documentation.html>
- 上游应用代码库： <https://github.com/cockpit-project/cockpit>
- YunoHost 商店： <https://apps.yunohost.org/app/cockpit>
- 报告 bug： <https://github.com/YunoHost-Apps/cockpit_ynh/issues>

## 开发者信息

请向 [`testing` 分支](https://github.com/YunoHost-Apps/cockpit_ynh/tree/testing) 发送拉取请求。

如要尝试 `testing` 分支，请这样操作：

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/cockpit_ynh/tree/testing --debug
或
sudo yunohost app upgrade cockpit -u https://github.com/YunoHost-Apps/cockpit_ynh/tree/testing --debug
```

**有关应用打包的更多信息：** <https://yunohost.org/packaging_apps>
