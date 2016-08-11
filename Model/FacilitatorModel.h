//
//  FacilitatorModel.h
//  MapKitDemo
//
//  Created by 戴雨恒 on 16/8/11.
//  Copyright © 2016年 Darren. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FacilitatorModel : NSObject

///描述
@property (nonatomic, copy) NSString *desc;
///价格
@property (nonatomic, copy) NSString *price;
///交易量
@property (nonatomic, copy) NSString *sellNumber;
///服务商名字
@property (nonatomic, copy) NSString *name;

+ (instancetype)modelWithDict:(NSDictionary *)dict;

@end
