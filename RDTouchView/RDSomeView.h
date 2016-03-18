//
//  RDSomeView.h
//  RDTouchView
//
//  Created by 片桐奏羽 on 2016/03/18.
//  Copyright © 2016年 SoKatagiri.
//  This software is released under the MIT License.
//   http://opensource.org/licenses/mit-license.php
//

#import "RDTouchView.h"

@interface Record : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) BOOL flag;
@property (nonatomic, copy) NSString *url;
+ (Record *)recordTest;
@end

@interface RDSomeView : RDTouchView
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UIImageView *icon;

@end


@interface RDSomeViewPresenter : NSObject
+ (void)updateView:(RDSomeView *)view some:(Record *)record;
@end

