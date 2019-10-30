//
//  XMarkerViewProtocol.h
//  MapLib4iOS
//
//  Created by yinqiante on 2019/10/28.
//  Copyright © 2019 xyz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol XMarkerProtocol <NSObject>

- (instancetype)initMarkerViewWithView:(UIView *)view
							Coordinate:(CLLocationCoordinate2D)coord
                              UserData:(NSDictionary *)userData;
- (id)marker;

@end

NS_ASSUME_NONNULL_END
