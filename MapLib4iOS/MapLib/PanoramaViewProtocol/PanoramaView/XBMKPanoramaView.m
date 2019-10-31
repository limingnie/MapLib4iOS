//
//  XBMKPanoramaView.m
//  MapLib4iOS
//
//  Created by yinqiante on 2019/10/31.
//  Copyright © 2019 xyz. All rights reserved.
//

#import <BaiduPanoSDK/BaiduPanoramaView.h>
#import "XBMKPanoramaView.h"

@interface XBMKPanoramaView () <BaiduPanoramaViewDelegate>
@property(nonatomic, strong) BaiduPanoramaView *mPanoramaView;
@end

@implementation XBMKPanoramaView {
  BaiduPanoramaView *kPanoramaView;
}

- (nonnull instancetype)initPanoramaViewWithFrame:(CGRect)frame Key:(nonnull NSString *)key {
  if (self) {
    kPanoramaView = [[BaiduPanoramaView alloc] initWithFrame:frame key:key];
    [kPanoramaView setPanoramaZoomLevel:ImageDefinitionLow];
    [kPanoramaView setDelegate:self];
  }
  return self;
}

- (nonnull id)panoramaView {
  return kPanoramaView;
}

- (void)moveNearCoordinate:(CLLocationCoordinate2D)coord {
  [kPanoramaView setPanoramaWithLon:coord.longitude lat:coord.latitude];
}

#pragma mark - panorama view delegate

- (void)panoramaWillLoad:(BaiduPanoramaView *)panoramaView {
  NSLog(@"1.=====");
}

- (void)panoramaDidLoad:(BaiduPanoramaView *)panoramaView descreption:(NSString *)jsonStr {
  NSLog(@"2.=====");
}

- (void)panoramaLoadFailed:(BaiduPanoramaView *)panoramaView error:(NSError *)error {
  NSLog(@"3.=====");
}

- (void)panoramaView:(BaiduPanoramaView *)panoramaView overlayClicked:(NSString *)overlayId {
  NSLog(@"4.=====");
}

@end
