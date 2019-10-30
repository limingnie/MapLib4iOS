//
//  XAMPPolyline.m
//  MapLib4iOS
//
//  Created by yinqiante on 2019/10/29.
//  Copyright © 2019 xyz. All rights reserved.
//

#import <MAMapKit/MAMapKit.h>
#import "XAMPPolyline.h"
#import "XYZAMPPolyline.h"

@interface XAMPPolyline ()
@property(nonatomic, strong) XYZAMPPolyline *mPolyline;
@end

@implementation XAMPPolyline

- (nonnull instancetype)initPolylineWithCoordinates:(nonnull CLLocationCoordinate2D *)coords
                                              Count:(NSUInteger)count
                                        StrokeColor:(nonnull UIColor *)strokeColor
                                        StrokeWidth:(CGFloat)strokeWidth {
  self = [super init];
  if (self) {
    [self.mPolyline setPolylineWithCoordinates:coords count:count];
    self.mPolyline.strokeColor = strokeColor;
    self.mPolyline.strokeWidth = strokeWidth;
  }
  return self;
}

- (nonnull id)polyline {
  return self.mPolyline;
}

- (XYZAMPPolyline *)mPolyline {
  if (_mPolyline == nil) {
    _mPolyline = [[XYZAMPPolyline alloc] init];
  }
  return _mPolyline;
}

@end
