//
//  XYZAMPPolyline.h
//  MapLib4iOS
//
//  Created by yinqiante on 2019/10/30.
//  Copyright © 2019 xyz. All rights reserved.
//

#import <MAMapKit/MAMapKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XYZAMPPolyline : MAPolyline
@property (nonatomic,strong) UIColor *strokeColor;
@property (nonatomic) CGFloat strokeWidth;
@end

NS_ASSUME_NONNULL_END
