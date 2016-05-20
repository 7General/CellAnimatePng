//
//  AnimateCell.m
//  TableViewCommate
//
//  Created by 王会洲 on 16/5/20.
//  Copyright © 2016年 王会洲. All rights reserved.
//
#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGTH [UIScreen mainScreen].bounds.size.height

#import "AnimateCell.h"

@interface AnimateCell()
@property (nonatomic, weak) UILabel * contents;


@property (nonatomic, strong) UIView * delegateView;
@end

@implementation AnimateCell


+(instancetype)cellWithTableView:(UITableView *)tableview{
    static NSString * ID = @"taxLawsCell";
    AnimateCell * cell = [tableview dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[AnimateCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self == [super initWithStyle: style reuseIdentifier:reuseIdentifier]) {
        [self initView];
        self.delegateView = [[UIView alloc] initWithFrame:CGRectMake(SCREENWIDTH, 0, SCREENWIDTH, 44)];
    }
    self.delegateView.backgroundColor = [UIColor greenColor];
    [self.contentView addSubview:self.delegateView];
    UIButton * delBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    delBtn.frame = CGRectMake(0, 0, 65, 44);
    [delBtn setImage:[UIImage imageNamed:@"cell_dele"] forState:UIControlStateNormal];
    
    [self.delegateView addSubview:delBtn];
    return self;
}






-(void)initView {

    UILabel * contents = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 200, 20)];
    contents.text = @"国家税务总局关于发布增值税发票系统升级版与电子发票系统数据接口规范的公告";
    [self.contentView addSubview:contents];
    self.contents = contents;
}
@end
