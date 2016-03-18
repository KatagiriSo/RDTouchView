//
//  ViewController.m
//  RDTouchView
//
//  Created by 片桐奏羽 on 2016/03/18.
//  Copyright © 2016年 SoKatagiri. All rights reserved.
//

#import "ViewController.h"
#import "RDSomeView.h"

@interface ViewController () <RDTouchProtocol>
@property (nonatomic, strong) RDTouchViewsPresenter *touchViewsPresenter;
@property (nonatomic, strong) NSArray *views;
@end

@implementation ViewController

- (void)tap:(RDTouchView *)touchview
{
    NSLog(@"tap");
    [self.touchViewsPresenter tap:touchview];
}

- (void)thumbnailTap:(RDTouchView *)touchView
{
    NSLog(@"thumbnailTap");
}

- (RDSomeView *)makeSomeView
{
    static int i = 0;
    UINib *nib = [UINib nibWithNibName:@"RDSomeView" bundle:nil];
    RDSomeView *touchView = [nib instantiateWithOwner:nil options:nil][0];
    [RDSomeViewPresenter updateView:touchView some:[Record recordTest]];
    touchView.delegate = self;
    [self.view addSubview:touchView];
    
    touchView.uniqueID = [NSString stringWithFormat:@"%d",i];
    i++;
    return touchView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    RDSomeView *view0 = [self makeSomeView];
    RDSomeView *view1 = [self makeSomeView];
    RDSomeView *view2 = [self makeSomeView];
    RDSomeView *view3 = [self makeSomeView];
    
    view0.center = CGPointMake(150, 100);
    view1.center = CGPointMake(150, 300);
    view2.center = CGPointMake(450, 100);
    view3.center = CGPointMake(450, 300);
    
    [self.view addSubview:view0];
    [self.view addSubview:view1];
    [self.view addSubview:view2];
    [self.view addSubview:view3];
    
    NSArray *vs = @[view0,view1,view2,view3];
    self.views = vs;
    
    self.touchViewsPresenter = [[RDTouchViewsPresenter alloc] init];
    self.touchViewsPresenter.touchViews = vs;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
