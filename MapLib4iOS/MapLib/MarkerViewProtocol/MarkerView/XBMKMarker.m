//
//  XBMKMarkerView.m
//  MapLib4iOS
//
//  Created by yinqiante on 2019/10/28.
//  Copyright © 2019 xyz. All rights reserved.
//

#import "XBMKMarker.h"
#import "XYZBMKMarker.h"

@interface XBMKMarker ()
@property(nonatomic, strong) XYZBMKMarker *mMarker;
@end

@implementation XBMKMarker

- (nonnull instancetype)initMarkerViewWithView:(id)view
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

- (XYZBMKMarker *)mMarker {
  if (_mMarker == nil) {
    _mMarker = [[XYZBMKMarker alloc] init];
  }
  return _mMarker;
}

@end
