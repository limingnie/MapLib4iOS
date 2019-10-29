//
//  XAMPPolyline.m
//  MapLib4iOS
//
//  Created by yinqiante on 2019/10/29.
//  Copyright © 2019 xyz. All rights reserved.
//

#import <MAMapKit/MAMapKit.h>
#import "XAMPPolyline.h"

@interface XAMPPolyline ()
@property(nonatomic, strong) MAPolyline *mPolyline;
@end

@implementation XAMPPolyline

- (nonnull instancetype)initPolylineWithCoordinates:(nonnull CLLocationCoordinate2D *)coords
                                              Count:(NSUInteger)count {
  self = [super init];
  if (self) {
    [self.mPolyline setPolylineWithCoordinates:coords count:count];
  }
  return self;
}

- (nonnull id)polyline {
  return self.mPolyline;
}

- (MAPolyline *)mPolyline {
  if (_mPolyline == nil) {
    _mPolyline = [[MAPolyline alloc] init];
  }
  return _mPolyline;
}

@end
