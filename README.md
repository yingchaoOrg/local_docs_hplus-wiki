## HPlus Admin，全新admin插件 快速开发框架，
### Admin插件使用体验和laravel-admin用法差不多
### auth组件采用<a href="https://github.com/qbhy/hyperf-auth">hyperf-auth</a>，目前支持 jwt、session 驱动。用户可以自行扩展。使用体验大体和 laravel 的 auth 差不多
### 灵活可替换的权限验证组件，HPlus提供权限验证，也可以替换自己的权限验证插件

## 演示地址：
##### <a href="http://shop.sh.cn/auth">http://shop.sh.cn/auth</a>
##### 账户 admin
##### 密码 admin

#### 欢迎加入HPlus交流群，群聊号码：512465490
点击链接加入群聊【hyperf-admin交流群】：<a href="https://qm.qq.com/cgi-bin/qm/qr?k=pCkT8bLR-scfzGhiLYAu2AuEu5pzOfdD&authKey=0L9w5QrmZJQpDdaH9R5WpPK5mUPyh1RiM3nqcRggpMpM8heAgBBXWdzuk9zkyRko&noverify=0">群聊号码：512465490</a>
<p align="center">
    <a href="https://github.com/hyperf-plus/admin/releases"><img src="https://poser.pugx.org/hyperf-plus/admin/v/stable" alt="Stable Version"></a>
    <a href="https://packagist.org/packages/hyperf-plus/admin"><img src="https://poser.pugx.org/hyperf-plus/admin/downloads" alt="Total Downloads"></a>
    <a href="https://packagist.org/packages/hyperf-plus/admin"><img src="https://poser.pugx.org/hyperf-plus/admin/d/monthly" alt="Monthly Downloads"></a>
    <a href="https://www.php.net"><img src="https://img.shields.io/badge/php-%3E=7.3-brightgreen.svg?maxAge=2592000" alt="Php Version"></a>
    <a href="https://github.com/swoole/swoole-src"><img src="https://img.shields.io/badge/swoole-%3E=4.5-brightgreen.svg?maxAge=2592000" alt="Swoole Version"></a>
    <a href="https://github.com/hyperf-plus/admin/blob/master/LICENSE"><img src="https://img.shields.io/github/license/hyperf-plus/admin.svg?maxAge=2592000" alt="HyperfAdmin License"></a>
</p>
#### laravel版本地址  <a href="https://github.com/SmallRuralDog/laravel-vue-admin">laravel-vue-admin</a>

### 安装

- 1、安装Admin插件
```bash
     Hyperf2.0版本
    composer require hyperf-plus/admin:2.1

    Hyperf2.1版本
    composer require hyperf-plus/admin:2.2
```
- 2、生成admin auth file配置文件
```bash
    php bin/hyperf.php vendor:publish hyperf-plus/admin
```
- 3、UI资源初始化（建议有修改vue需求的用户，可以查看UI文档，以插件形式开发，尽量不要修改默认的样式，这样后期UI插件有新功能更新也能实现无痛更新）
```bash
    php bin/hyperf.php ui:init
```
- 4、配置好数据库（必须），然后执行下面安装命令
```bash
    php bin/hyperf.php admin:install
```
- 5、配置异常处理器,可以自行拦截处理，也可以按照以下方式添加异常处理器
####  在文件 config/autoload/exceptions.php 中添加 \HPlus\Admin\Exception\Handler\AppExceptionHandler::class 异常处理器
```php
    <?php
        return [
            'handler' => [
                'http' => [
                    \HPlus\Admin\Exception\Handler\AppExceptionHandler::class, #放到第一位
                 # 其他的放到下面
                ],
            ],
        ];
```
- 6、（可选）添加权限控制插件（如果不启用默认权限控制，可以忽略此步骤）
```bash
  composer require hyperf-plus/permission
```
#### 默认没有安装权限插件，需要手动安装，此为了更好的扩展，可以自行配置项目已有的权限模块
可在将admin.php 配置文件中权限验证中间件，这样通过注解AdminController注册的路由都会默认加上配置的此中间件
示例代码如下
```php
<?php
return [
    #...省略
    'route' => [
        #...省略
        'middleware' => [AuthMiddleware::class,自己的权限验证中间件],
    ],
    #...省略
    ]
```
    需要验证权限的地方用AdminController注解路由来定义，或者添加中间件PermissionMiddleware即可
    此插件支持注解路由插件 hyperf-plus-route插件的注解参数
    如：控制器注解：ApiController
    方法注解：GetApi PostApi PutApi DeleteApi （方法上配置级别优先于控制器配置）
    1、userOpen 对用户开放url中的验证，
    2、security 为true必须验证权限 false公共开放资源
    路由注解只在启动第一次时扫描并缓存，后续请求不会再做解析，提高性能

- 7、（可选）日志记录，添加日志管理中间件，日志记录功能数据量较大，默认不开启（如需开启在admin配置文件的route节点下middleware添加LogsMiddleware中间件即可 ）
      或者在需要加日志的接口，注解上LogsMiddleware中间件即可记录
```php
<?php
return [
    #...省略
    'route' => [
        #...省略
        'middleware' => [AuthMiddleware::class, LogsMiddleware::class, 其他中间件],
    ],
    #...省略
    ]
```
- 8、启动服务
```bash
	php bin/hyperf.php start
```
### 访问 http://127.0.0.1:9501/auth
- 账户 admin
- 密码 admin

#### 以插件形式开箱即用
#### 可以做到无需VUE前端可实现快速开发各种表单

### 赞助
#### 1、开源不易，如果此项目能够帮到您，希望点个star
#### 2、欢迎您的捐赠
<img src="https://gitee.com/hyperf-plus/image/raw/master/%E6%9C%AA%E6%A0%87%E9%A2%98-1.jpg" width="500" alt="HyperfAdmin License">
<img src="//ia.51.la/go1?id=21039519&pvFlag=1" style="border:none" />