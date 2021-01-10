# 安装方式

# 
# 1、Admin插件安装
## HPlus Admin，全新admin插件 快速开发框架，
### Admin插件使用体验和laravel-admin用法差不多


### auth组件采用[hyperf-auth](https://github.com/qbhy/hyperf-auth)，目前支持 jwt、session 驱动。用户可以自行扩展。使用体验大体和 laravel 的 auth 差不多


### 灵活可替换的权限验证组件，HPlus提供权限验证，也可以替换自己的权限验证插件


#### 欢迎加入HPlus交流群，群聊号码：512465490


点击链接加入群聊【hyperf-admin交流群】：[群聊号码：512465490](https://qm.qq.com/cgi-bin/qm/qr?k=pCkT8bLR-scfzGhiLYAu2AuEu5pzOfdD&authKey=0L9w5QrmZJQpDdaH9R5WpPK5mUPyh1RiM3nqcRggpMpM8heAgBBXWdzuk9zkyRko&noverify=0)
### 安装


- 1、安装Admin插件



```bash
    composer require hyperf-plus/admin
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



#### 在文件 config/autoload/exceptions.php 中添加 \HPlus\Admin\Exception\Handler\AppExceptionHandler::class 异常处理器


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


- 6、添加权限控制插件（如果不启用默认权限控制，可以忽略此步骤）



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
        'middleware' => [自己的权限验证中间件],
    ],
    #...省略
    ]
```


```
需要验证权限的地方用AdminController注解路由来定义，或者添加中间件PermissionMiddleware即可
此插件支持注解路由插件 hyperf-plus-route插件的注解参数
如：控制器注解：ApiController
方法注解：GetApi PostApi PutApi DeleteApi （方法上配置级别优先于控制器配置）
1、userOpen 对用户开放url中的验证，
2、security 为true必须验证权限 false公共开放资源
路由注解只在启动第一次时扫描并缓存，后续请求不会再做解析，提高性能
```


- 7、启动服务



```bash
	php bin/hyperf.php start
```


### 访问 [http://127.0.0.1:9501/auth](http://127.0.0.1:9501/auth)


- 账户 admin
- 密码 admin



#### 以插件形式开箱即用


#### 可以做到无需VUE前端可实现快速开发各种表单


#### 喜欢的帮忙点个star




# 2、UI组件单独安装
# 以下方式：适合不使用admin插件的用户安装


HPlus，基于hyperf、Element UI 插件式快速开发框架
[UI演示地址] [https://shop.sh.cn](https://shop.sh.cn)
## 安装
首先确保安装好了hyperf。
```bash
composer require hyperf-plus/ui
```
然后运行下面的命令来发布资源：
```bash
composer require hyperf-plus/ui:~1.0
    php bin/hyperf.php ui:init  初始化静态文件。
    有特殊定制用户可以修改 根目录下的resources/ui 项目文件，如有只需要基本页面可以忽略vue文件
```
在该命令会将resources/ui/vue文件拷贝到您的项目根目录（方便特殊定制），static资源拷贝到web 目录：
## 开始使用
下面是一个简单使用的代码示例
### 1、创建资源控制器入口（一个项目只需创建一次即可）
可以用命令gen:ui-demo
```php
php bin/hyperf.php gen:ui-demo  创建UI控制器演示文件。
```
### 2、启动服务
创建成功后启动hyperf框架  php bin/hyperf.php start
访问：http://127.0.0.1:9501/ui/index


### 查看当前版本
```bash
composer show hyperf-plus/ui --latest
```
### 更新到最新版
```bash
composer require hyperf-plus/ui
```
### 更新到开发版
```bash
composer require hyperf-plus/ui:dev-master
```
### 更新资源文件
```php
php bin/hyperf.php ui:update
```
