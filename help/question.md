# 常见问题
### 1、登录问题
- 点击登录没有跳转首页，又跳到登录页面
    - 此问题是没有开启redis，auth组件依赖redis，必须启动后才能正常登录
    
- 登录页面白屏，只有标题显示，不显示登录页面
    - 静态资源路径没有配置对，请确保在 config/autoload/server.php 的document_root和enable_static_handler如下所示
        ```php
        // 静态资源
        'document_root' => BASE_PATH . '/public',
        'enable_static_handler' => true      
        ```
### 2 其他问题，请在群里反馈

Hyperf-admin交流群1:`512465490`<a href="https://qm.qq.com/cgi-bin/qm/qr?k=pCkT8bLR-scfzGhiLYAu2AuEu5pzOfdD&authKey=0L9w5QrmZJQpDdaH9R5WpPK5mUPyh1RiM3nqcRggpMpM8heAgBBXWdzuk9zkyRko&noverify=0">点击加入</a>  
