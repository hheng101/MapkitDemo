//
//  FacilitatorModel.m
//  MapKitDemo
//
//  Created by 戴雨恒 on 16/8/11.
//  Copyright © 2016年 Darren. All rights reserved.
//

#import "FacilitatorModel.h"

@implementation FacilitatorModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{}

+ (instancetype)modelWithDict:(NSDictionary *)dict {
    
    FacilitatorModel *model = [[self alloc] init];
    
    [model setValuesForKeysWithDictionary:dict];
    
    return model;
}

@end
