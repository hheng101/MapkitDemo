//
//  CalloutAnnotation.h
//  MapKitDemo
//
//  Created by 戴雨恒 on 16/8/12.
//  Copyright © 2016年 Darren. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface CalloutAnnotation : NSObject <MKAnnotation>

@property (nonatomic) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;

//详情
@property (nonatomic, copy) NSString *detail;
//价格
@property (nonatomic, copy) NSString *price;
//出售数量
@property (nonatomic, copy) NSString *sellNumber;
//名字
@property (nonatomic, copy) NSString *name;

@end
