//
//  ViewController.m
//  runloop测试
//
//  Created by Admin on 2017/5/15.
//  Copyright © 2017年 Summer. All rights reserved.
//
#import "XTOptimizeTableView.h"
#import "TableViewCell.h"
#import "ViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableview;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableview = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    [self.tableview registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"qqq"];
    [self.view addSubview:self.tableview];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:@"qqq" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    XTOptimizeTableView *opt = [[XTOptimizeTableView alloc]initWithMaxQueueLength:12];
    [opt addTask:^{
        cell.i1.image = [UIImage imageNamed:@"2.jpg"];
    }];
    [opt addTask:^{
        cell.i3.image = [UIImage imageNamed:@"3.jpg"];
    }];
    [opt addTask:^{
        cell.i4.image = [UIImage imageNamed:@"4.jpg"];

    }];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 100;
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
