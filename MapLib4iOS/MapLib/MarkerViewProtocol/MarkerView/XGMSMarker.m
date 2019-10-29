//
//  XGMSMarkerView.m
//  MapLib4iOS
//
//  Created by yinqiante on 2019/10/28.
//  Copyright © 2019 xyz. All rights reserved.
//

#import <GoogleMaps/GoogleMaps.h>
#import "XGMSMarker.h"

@interface XGMSMarker ()
@property(nonatomic, strong) GMSMarker *mMarker;
@end

@implementation XGMSMarker

- (nonnull instancetype)initMarkerViewWithView:(id)view
                                     LocationX:(double)x
                                     LocationY:(double)y
                                      UserData:(nonnull NSDictionary *)userData {
  self = [super init];
  if (self) {
    self.mMarker.position = CLLocationCoordinate2DMake(x, y);
    self.mMarker.iconView = view;
    self.mMarker.userData = userData;
    self.mMarker.groundAnchor = CGPointMake(0.5, 0.5);
  }
  return self;
}

- (nonnull id)marker {
  return self.mMarker;
}

- (GMSMarker *)mMarker {
  if (_mMarker == nil) {
    _mMarker = [[GMSMarker alloc] init];
  }
  return _mMarker;
}

@end
