//
//  XBMKPolyline.m
//  MapLib4iOS
//
//  Created by yinqiante on 2019/10/29.
//  Copyright © 2019 xyz. All rights reserved.
//

#import <BaiduMapAPI_Map/BMKMapComponent.h>
#import "XBMKPolyline.h"

@interface XBMKPolyline ()
@property(nonatomic, strong) BMKPolyline *mPolyline;
@end

@implementation XBMKPolyline

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

- (BMKPolyline *)mPolyline {
  if (_mPolyline == nil) {
    _mPolyline = [[BMKPolyline alloc] init];
  }
  return _mPolyline;
}

@end
