//
//  ClusterAnnotation.h
//  MapLib4iOS
//
//  Created by yinqiante on 2020/3/5.
//  Copyright © 2020 xyz. All rights reserved.
//

#import <BaiduMapAPI_Map/BMKMapComponent.h>

NS_ASSUME_NONNULL_BEGIN

@interface ClusterAnnotation : BMKPointAnnotation
@property(nonatomic, assign) NSInteger size;
@end

NS_ASSUME_NONNULL_END
