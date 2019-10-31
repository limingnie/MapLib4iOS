//
//  XGMSPanoramaView.m
//  MapLib4iOS
//
//  Created by yinqiante on 2019/10/31.
//  Copyright © 2019 xyz. All rights reserved.
//

#import <GoogleMaps/GoogleMaps.h>
#import "XGMSPanoramaView.h"

@interface XGMSPanoramaView ()
@property(nonatomic, strong) GMSPanoramaView *mPanoramaView;
@end

@implementation XGMSPanoramaView

- (nonnull instancetype)initPanoramaViewWithFrame:(CGRect)frame Key:(nonnull NSString *)key {
  if (self) {
    self.mPanoramaView.frame = frame;
  }
  return self;
}

- (nonnull id)panoramaView {
  return self.mPanoramaView;
}

- (void)moveNearCoordinate:(CLLocationCoordinate2D)coord {
  [self.mPanoramaView moveNearCoordinate:coord];
}

- (GMSPanoramaView *)mPanoramaView {
  if (_mPanoramaView == nil) {
    _mPanoramaView = [[GMSPanoramaView alloc] init];
  }
  return _mPanoramaView;
}

@end
