



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