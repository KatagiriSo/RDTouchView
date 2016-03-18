//
//  RDSomeView.m
//  RDTouchView
//
//  Created by 片桐奏羽 on 2016/03/18.
//  Copyright © 2016年 SoKatagiri. All rights reserved.
//

#import "RDSomeView.h"

@implementation RDSomeView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end


@implementation RDSomeViewPresenter
+ (void)updateView:(RDSomeView *)view some:(Record *)record
{
    view.title.text = record.title;
    view.icon.hidden = !record.flag;
}
@end


@implementation Record
+ (Record *)recordTest
{
    Record *r = [[Record alloc] init];
    r.title = @"hoge";
    r.flag = YES;
    return r;
}
@end