//
//  XBMKPolyline.m
//  MapLib4iOS
//
//  Created by yinqiante on 2019/10/29.
//  Copyright © 2019 xyz. All rights reserved.
//

#import <BaiduMapAPI_Map/BMKMapComponent.h>
#import "XBMKPolyline.h"
#import "XYZBMKPolyline.h"

@interface XBMKPolyline ()
@property(nonatomic, strong) XYZBMKPolyline *mPolyline;
@end

@implementation XBMKPolyline

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

- (XYZBMKPolyline *)mPolyline {
  if (_mPolyline == nil) {
    _mPolyline = [[XYZBMKPolyline alloc] init];
  }
  return _mPolyline;
}

@end
