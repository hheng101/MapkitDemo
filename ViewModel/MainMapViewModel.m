//
//  MainMapViewModel.m
//  MapKitDemo
//
//  Created by 戴雨恒 on 16/8/11.
//  Copyright © 2016年 Darren. All rights reserved.
//

#import "MainMapViewModel.h"

@implementation MainMapViewModel


+ (instancetype)model {
    
    MainMapViewModel *model = [[self alloc] init];
    
    return model;
}


- (void)loadNearbyFacilitators {
    
    [self.nearbyFacilitators removeAllObjects];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"nearbyFacilitators" ofType:@"plist"];
    NSArray *dataArray = [NSArray arrayWithContentsOfFile:path];
    
    for (NSDictionary *dataDict in dataArray) {
        FacilitatorModel *model = [FacilitatorModel modelWithDict:dataDict];
        [self.nearbyFacilitators addObject:model];
    }
    NSLog(@"reload success");
}


- (NSMutableArray *)nearbyFacilitators {
    
    if (!_nearbyFacilitators) {
        _nearbyFacilitators = [NSMutableArray array];
    }
    return _nearbyFacilitators;
}


@end
