//
//  XAMPMarkerView.m
//  MapLib4iOS
//
//  Created by yinqiante on 2019/10/28.
//  Copyright © 2019 xyz. All rights reserved.
//

#import "XAMPMarker.h"
#import "XYZAMPMarker.h"

@interface XAMPMarker ()
@property(nonatomic, strong) XYZAMPMarker *mMarker;
@end

@implementation XAMPMarker
- (nonnull instancetype)initMarkerViewWithView:(nonnull UIView *)view
									Coordinate:(CLLocationCoordinate2D)coord
                                      UserData:(nonnull NSDictionary *)userData {
  self = [super init];
  if (self) {
    self.mMarker.coordinate = coord;
    self.mMarker.userData = userData;
    self.mMarker.markerView = view;
  }
  return self;
}

- (nonnull id)marker {
  return self.mMarker;
}

- (XYZAMPMarker *)mMarker {
  if (_mMarker == nil) {
    _mMarker = [[XYZAMPMarker alloc] init];
  }
  return _mMarker;
}

@end
