### 使用
使用默认的csv导出，有下面一些可供使用的方法。
```php 
$grid->export(function (Grid\Exporters\CsvExporter $export) {
    $export->filename('Filename.csv');
    #哪些列不需要被导出
    $export->except(['column1', 'column2' ...]);
    #指定只能导出哪些列
    $export->only(['column3', 'column4' ...]);
    #某些列导出存在数据库中的原始内容
    $export->originalValue(['column1', 'column2' ...]);
    #自定义某些列的导出内容
    $export->column('column_5', function ($value, $original) {
        return $value;
    });
});
```
### 导出文件名设置
```php 
$export->filename($filename);
```

用来指定导出文件的名称，不设置的话默认为表名.csv

### 忽略导出字段
```php 
$export->except([]);
```

用来指定哪些列不需要被导出，指定了之后，相关的列将不会被导出,

### 指定导出字段
```php 
$export->only([]);
```
方法用来指定只能导出哪些列。

### 指定字段原始内容
```php 
$export->originalValue(['name']);
```

很多情况下某些列会被修改之后显示在页面上，比如对列使用了`$table->column('name')->customValue()`方法之后，那么导出的列内容会是一段HTML，如果需要某些列导出存在数据库中的原始内容，使用originalValue方法

### 自定义列内容
如果你想自定义某些列的导出内容，使用column方法
```php 
$export->column('column_5', function ($value, $original) {
// return $value;
)};
```
其中传入闭包函数中的$value和$original为该列的原始值和应用过某些方法之后被修改之后的值，你可以在闭包函数中实现自己的逻辑。