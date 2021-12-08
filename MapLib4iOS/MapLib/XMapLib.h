//
//  XMapLib.h
//  MapLib4iOS
//
//  Created by yinqiante on 2019/10/28.
//  Copyright © 2019 xyz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMap.h"
#import "XMapProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface XMapLib : NSObject

+ (instancetype)shareInstance;
- (void)initMapLibWithKey:(NSString *)key Type:(XMapType)type;
- (id<XMapProtocol>)mapProtocol;
- (NSString *)mapKey;//一般只配置一次key，但有些功能(比如街景)如果还需要配置

@end

NS_ASSUME_NONNULL_END
