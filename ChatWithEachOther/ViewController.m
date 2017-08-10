//
//  ViewController.m
//  ChatWithEachOther
//
//  Created by MJ on 2017/8/10.
//  Copyright © 2017年 韩明静. All rights reserved.
//

#import "ViewController.h"
#import "MeTableViewCell.h"
#import "OtherTableViewCell.h"
#import "Masonry.h"


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableview;

@property(nonatomic,strong)NSArray *dataArr;

@end

@implementation ViewController

-(UITableView *)tableview{
    
    if (_tableview==nil) {
        _tableview=[UITableView new];
        _tableview.delegate=self;
        _tableview.dataSource=self;
        _tableview.separatorStyle=UITableViewCellSeparatorStyleNone;
    }
    return _tableview;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    __weak typeof(self) weakSelf=self;
    
    self.title=@"亲爱的";
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    [self.view addSubview:self.tableview];
    [self.tableview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.view);
    }];
    
    [self.tableview registerClass:[MeTableViewCell class] forCellReuseIdentifier:NSStringFromClass([MeTableViewCell class])];
    [self.tableview registerClass:[OtherTableViewCell class] forCellReuseIdentifier:NSStringFromClass([OtherTableViewCell class])];
    
    NSString *path=[[NSBundle mainBundle]pathForResource:@"ChatDatas" ofType:@"plist"];
    NSArray *array=[NSArray arrayWithContentsOfFile:path];
    self.dataArr=[NSArray arrayWithArray:array];
    NSLog(@"%li",self.dataArr.count);
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSDictionary *dic=self.dataArr[indexPath.row];
    
    if ([[dic objectForKey:@"id"]isEqualToString:@"我"]) {
        
        MeTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MeTableViewCell class])];
        cell.nameLabel.text=[dic objectForKey:@"id"];
        cell.contentLabel.text=[dic objectForKey:@"content"];
        
        return cell;
        
    }else{
        
        OtherTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([OtherTableViewCell class])];
        cell.nameLabel.text=[dic objectForKey:@"id"];
        cell.contentLabel.text=[dic objectForKey:@"content"];
        
        return cell;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSDictionary *dic=self.dataArr[indexPath.row];
    NSString *str=[dic objectForKey:@"content"];
    
    CGFloat width=[UIScreen mainScreen].bounds.size.width-15-60-8-12-130;
    
    CGRect frame=[str boundingRectWithSize:CGSizeMake(width, 9999999999) options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil];
    
    CGFloat height=frame.size.height+100;
    
    if (height<80) {
        return 80;
    }else{
        return height;
    }

}

@end
