//
//  MainMapViewModel.h
//  MapKitDemo
//
//  Created by 戴雨恒 on 16/8/11.
//  Copyright © 2016年 Darren. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FacilitatorModel.h"

@interface MainMapViewModel : NSObject

@property (nonatomic, strong) NSMutableArray *nearbyFacilitators;

+ (instancetype)model;
- (void)loadNearbyFacilitators;

@end
