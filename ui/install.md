
### 安装
### 服务器要求
    Hyperf 对系统环境有一些要求，仅可运行于 Linux 和 Mac 环境下，但由于 Docker 虚拟化技术的发展，在 Windows 下也可以通过 Docker for Windows 来作为运行环境，通常来说 Mac 环境下，我们更推荐本地环境部署，以避免 Docker 共享磁盘缓慢导致 Hyperf 启动速度慢的问题。
    
    hyperf\hyperf-docker 项目内已经为您准备好了各种版本的 Dockerfile ，或直接基于已经构建好的 hyperf\hyperf 镜像来运行。
    
    当您不想采用 Docker 来作为运行的环境基础时，您需要确保您的运行环境达到了以下的要求：
    
    PHP >= 7.2
    Swoole PHP 扩展 >= 4.5，并关闭了 Short Name
    OpenSSL PHP 扩展
    JSON PHP 扩展
    PDO PHP 扩展 （如需要使用到 MySQL 客户端）
    Redis PHP 扩展 （如需要使用到 Redis 客户端）
    Protobuf PHP 扩展 （如需要使用到 gRPC 服务端或客户端）

 -  更多请参考hyperf官方 [安装要求和Docker安装方式](https://hyperf.wiki/2.1/#/zh-cn/quick-start/install)

### 全新安装
- 创建hyperf应用
```php
composer create-project hyperf/hyperf-skeleton
```
- 创建完毕后配置数据库
- 按照下方`已有项目安装`方式进行安装

### 已有项目安装
- 1、安装Admin插件
```bash
     Hyperf2.0版本
    composer require hyperf-plus/admin:~2.1

    Hyperf2.1版本
    composer require hyperf-plus/admin:~2.2
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
