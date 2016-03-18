//
//  RDTouchView.h
//  RDTouchView
//
//  Created by 片桐奏羽 on 2016/03/18.
//  Copyright © 2016年 SoKatagiri.
//  This software is released under the MIT License.
//   http://opensource.org/licenses/mit-license.php
//

#import <UIKit/UIKit.h>

@class RDTouchView;

@protocol RDTouchProtocol <NSObject>
- (void)tap:(RDTouchView *)touchview;
- (void)thumbnailTap:(RDTouchView *)touchView;
@end

@interface RDTouchView : UIView
@property (nonatomic, strong) id uniqueID;
@property (nonatomic, weak) IBOutlet UIImageView *thumbnail;
@property (nonatomic, weak) IBOutlet id <RDTouchProtocol> delegate;
//@property (nonatomic, strong) IBOutlet UITapGestureRecognizer *thumbnailTapGesture;
//@property (nonatomic, strong) IBOutlet UITapGestureRecognizer *tapGesture;
@end


@interface RDTouchViewsPresenter : NSObject
@property (nonatomic, weak) NSArray *touchViews;
- (void)tap:(RDTouchView *)touchview;
@end