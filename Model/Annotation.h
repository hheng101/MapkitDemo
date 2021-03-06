//
//  Annotation.h
//  MapKitDemo
//
//  Created by 戴雨恒 on 16/8/10.
//  Copyright © 2016年 Darren. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Annotation : NSObject <MKAnnotation>

@property (nonatomic) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;

@property (nonatomic, strong) UIImage *image;

//详情
@property (nonatomic, copy) NSString *detail;
//价格
@property (nonatomic, copy) NSString *price;
//出售数量
@property (nonatomic, copy) NSString *sellNumber;
//名字
@property (nonatomic, copy) NSString *name;

@end
