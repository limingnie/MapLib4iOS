//
//  XPanoramaViewProtocol.h
//  MapLib4iOS
//
//  Created by yinqiante on 2019/10/31.
//  Copyright © 2019 xyz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol XPanoramaViewProtocol <NSObject>

- (instancetype)initPanoramaViewWithFrame:(CGRect)frame Key:(NSString *)key;
- (id)panoramaView;
- (void)moveNearCoordinate:(CLLocationCoordinate2D)coord;

@end

NS_ASSUME_NONNULL_END
