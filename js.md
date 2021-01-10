# 动态JS逻辑注入





这个东西有点难理解，由于vue端的代码是编译过的，所以内置的组件可能会无法满足实际的业务需求，所以提供了代码注入功能
其实就是后端写一段js代码，然后以字符串的形式传到前端，用 `new ``**Function()**`来解析并执行。
这里需要理解两个对象


- 目标组件
   - 指的是你要动态注入执行代码的组件，使用  `组件->ref("xxx")`来注册
- 触发组件
   - 指的是你要在某个组件动态注入目标组件代码，使用 `组件->refData("xxx","jsCodeString")`来注入



代码并不是vue渲染的时候执行，而是渲染以后


# 基本使用


这里我们使用两个Button来作为演示


创建两个Button


```php
<?php

$content->row(Card::make()->header("动态注入")->content(function (Content $content) {
	$content->row(Button::make("我是目标组件"));
  
	$content->row(Button::make("我是调用组件"));
}));
```


给目标组件注册ref


```php
<?php

Button::make("我是目标组件")->ref("demoButton")
```


调用组件注入代码


```php
<?php

$content->row(Button::make("我是调用组件")->refData("demoButton",function (){
return <<<JS
   console.log(ref);
   console.log(self);
JS;
}));
```


refData的第一个参数书目标组件的ref注册名称，第二个参数是注入的代码




**注意注意注意：注入的代码是需要触发事件才会注入执行的，具体可看每个组件注入代码的触发事件**
**
Button组件的触发事件是click，所以当点击我是目标组件按钮时就会打印 ，ref和self两个对象


- ref
   - 这个是目标组件里的this
- self
- 这个是调用组件里的this



拿到这两个对象后，可以使用它了




例如：改变目标组件的类型,改变调用组件的disable状态


```javascript
console.log(ref);
console.log(self);

ref.attrs.type = "success"

self.attrs.disabled = true
```


由于ref等于this，那么......




比如


```javascript
ref.$message("哈哈哈哈")
ref.$http.get()
ref.$http.post()
ref.$route
ref.$router
ref.$store
//等等。。。。。。

//注意在<<<JS里的写法是,需要把$转义一下
ref.\$xxx
```


注意：太复杂的逻辑代码建议使用自定义组件
