# CellAnimatePng
** tableview侧滑时，把文字替换成图片。（仅限单个）
* 本程序功能简介如下：
* 修改系统的delete的删除中文变成图片显示，并且可改变底色
 系统的效果如

该想法只是为了赶工期，并且只能对一个按钮有效果。切记切记。


# 有些时候要在侧滑的时候显示图片代替文字显示

从简处理流程

- **1:在使用的cell里申明一个view一定强引用类型**
- **2:在cell初始化的函数里加载view**
- **3:重写commitEditingStyle进行func**
- ***4:在titleForDeleteConfirmationButtonForRowAtIndexPath设置宽度**

-------------------

## 效果图

<img src="http://img.blog.csdn.net/20160520151456170" width="30%" height="30%">

 
 ## 系统的效果如下
 
 <img src="http://img.blog.csdn.net/20160520151540118" width="30%" height="30%">
可见系统的只能有两个字“删除”

## 代码如下

### 1在使用的cell里申明一个view一定强引用类型


```objc
@property (nonatomic, strong) UIView * consoleView;
```

### 2在cell初始化的函数里加载view
```objc
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self == [super initWithStyle: style reuseIdentifier:reuseIdentifier]) {
        self.consoleView = [[UIView alloc] initWithFrame:CGRectMake(SCREENWIDTH, 0, SCREENWIDTH, 44)];
    }
    // ****这里的高度要和你在vc里写的table的行高要保持一致
    self.consoleView.backgroundColor = [UIColor greenColor];
    [self.contentView addSubview:self.consoleView];
    UIButton * delBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    delBtn.frame = CGRectMake(0, 0, 65, 44);
    [delBtn setImage:[UIImage imageNamed:@"cell_dele"] forState:UIControlStateNormal];
    
    [self.consoleView addSubview:delBtn];
    return self;
}
```


### 3 重写commitEditingStyle进行fund
```0bjc
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"-----");
    //在这里进行对数据源的操作，刷新表格
}
```


### 4设置宽度
```objc
// 设置返回的文字越长，vc里的cell侧滑的部分就越长咯
-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"删除删除删除删除删除";
}
```



关注洲洲哥的微信公众号，提高技术就靠他了
![这里写图片描述](http://img.blog.csdn.net/20160520152250054)
 
 
 
