//
//  RDTouchView.m
//  RDTouchView
//
//  Created by 片桐奏羽 on 2016/03/18.
//  Copyright © 2016年 SoKatagiri. All rights reserved.
//

#import "RDTouchView.h"
#import <QuartzCore/QuartzCore.h>


@interface RDTouchView()
@property (nonatomic, assign) BOOL isFrameON;
@end

@implementation RDTouchView

- (void)awakeFromNib
{
    [self setup];
}

- (void)setup
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    UITapGestureRecognizer *thumbnailTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(thumbnailTap:)];
    
    [self addGestureRecognizer:tap];
    [self.thumbnail addGestureRecognizer:thumbnailTap];
    self.thumbnail.userInteractionEnabled = YES;
}

- (void)showBorder
{
    self.isFrameON = YES;
    self.layer.borderColor = [UIColor blueColor].CGColor;
    self.layer.borderWidth = 10;
    self.layer.cornerRadius =20;
}

- (void)hideBorder
{
    self.isFrameON = NO;
//    self.layer.borderColor = [UIColor blueColor].CGColor;
    self.layer.borderWidth = 0;
    self.layer.cornerRadius =0;
}

- (void)switchBorder:(BOOL)on
{
    if (on) {
        [self showBorder];
    } else {
        [self hideBorder];
    }
}

- (void)toggleBorder
{
    self.isFrameON = !self.isFrameON;
    [self switchBorder:self.isFrameON];
}

- (void)tap:(UITapGestureRecognizer *)gesture
{
    [self.delegate tap:self];
    [self toggleBorder];
}

- (void)thumbnailTap:(UITapGestureRecognizer *)gesuture
{
    [self.delegate thumbnailTap:self];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end


@implementation RDTouchViewsPresenter
- (void)tap:(RDTouchView *)touchview
{
    for (RDTouchView *v in self.touchViews) {
        if (v.uniqueID != touchview) {
            [v hideBorder];
        }
    }
}

@end

