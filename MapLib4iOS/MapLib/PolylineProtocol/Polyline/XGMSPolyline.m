//
//  XGMSPolyline.m
//  MapLib4iOS
//
//  Created by yinqiante on 2019/10/29.
//  Copyright © 2019 xyz. All rights reserved.
//

#import <GoogleMaps/GoogleMaps.h>
#import "XGMSPolyline.h"

@interface XGMSPolyline ()
@property(nonatomic, strong) GMSPolyline *mPolyline;
@end

@implementation XGMSPolyline

- (nonnull instancetype)initPolylineWithCoordinates:(nonnull CLLocationCoordinate2D *)coords
                                              Count:(NSUInteger)count {
  self = [super init];
  if (self) {
    GMSMutablePath *path = [[GMSMutablePath alloc] init];
    for (int i = 0; i < count; i++) {
      [path addCoordinate:coords[i]];
    }

    self.mPolyline.path = path;
    self.mPolyline.strokeColor = [UIColor blueColor];
    self.mPolyline.strokeWidth = 3;
    self.mPolyline.geodesic = YES;
  }
  return self;
}

- (nonnull id)polyline {
  return self.mPolyline;
}

- (GMSPolyline *)mPolyline {
  if (_mPolyline == nil) {
    _mPolyline = [[GMSPolyline alloc] init];
  }
  return _mPolyline;
}

@end
