//
//  XMapLib.m
//  MapLib4iOS
//
//  Created by yinqiante on 2019/10/28.
//  Copyright © 2019 xyz. All rights reserved.
//

#import "XMapLib.h"

@implementation XMapLib {
  NSString *kMapKey;
  id<XMapProtocol> kMapProtocol;
}

static XMapLib *instance = nil;

+ (instancetype)shareInstance {
  static dispatch_once_t once;
  dispatch_once(&once, ^{
    instance = [[XMapLib alloc] init];
  });
  return instance;
}

+ (id)allocWithZone:(struct _NSZone *)zone {
  if (instance == nil) {
    static dispatch_once_t once;
    dispatch_once(&once, ^{
      instance = [super allocWithZone:zone];
    });
  }
  return instance;
}

- (void)initMapLibWithKey:(NSString *)key Type:(XMapType)type {
  NSString *classStr;
  switch (type) {
    case XMapTypeBMK:
      classStr = @"XBMKMap";
      break;
    case XMapTypeGMS:
      classStr = @"XGMSMap";
      break;
    case XMapTypeAMP:
      classStr = @"XAMPMap";
      break;
  }
  kMapKey = key;
  kMapProtocol = [[NSClassFromString(classStr) alloc] initMapWithKey:key];
}

- (id<XMapProtocol>)mapProtocol {
  return kMapProtocol;
}

- (NSString *)mapKey {
	return kMapKey;
}

@end
