## 2021-02-24 近期更新日志
- 增加动态dialog弹窗
- 修复编辑、创建隐藏按钮，修复select 值为0时默认和无效bug
- 修复上传文件未读取配置文件
#### 升级方法
#### 更新包
    composer update 
#### 进行UI资源文件升级
    php bin/hyperf.php ui:update 

## 2021-01-19 本周更新日志
- 支持数据导出，用法与laravel-admin一致
- 修复2.1版本的安装sql命令错误bug
- 增加日志记录中间件（默认不开启）
- 增加admin插件db更新工具  php bin/hyperf.php admin:db -l可以查看admin基础数据库升级日志和升级命令


## 2021-01-11 近期更新日志
- 1、更新emelent为最新，更新wangeditor编辑器，升级hyperf2.1
- 2、增加饼图、漏斗图
- 3、form表单组件增加cachePut方法，可设置编辑后是否清理使用模型缓存的数据
- 4、修复批量上传文件时无上传文件无法删除和上传文件数限制错误bug
#### 升级方法
#### 更新包
    composer update 
#### 进行UI资源文件升级
    php bin/hyperf.php ui:update 