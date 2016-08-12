//
//  MainMapViewController.m
//  MapKitDemo
//
//  Created by 戴雨恒 on 16/8/10.
//  Copyright © 2016年 Darren. All rights reserved.
//

#import "MainMapViewController.h"
#import <CoreLocation/CoreLocation.h>
#import "Annotation.h"
#import "MainMapView.h"
#import "CalloutAnnotationView.h"

@interface MainMapViewController () <CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) MainMapView *mapView;

@end

@implementation MainMapViewController


#pragma mark - Life Circle

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self setupViewController];
    [self addAnnotaions];
}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}


- (void)dealloc {
    
    [self.locationManager stopUpdatingLocation];
}


#pragma mark - Initialize

- (void)setupViewController {
    
    self.title = @"假装是个搜索栏";
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self requestLocation];
    [self.view addSubview:self.mapView];
    [self addCenterImage];
    
//    CalloutAnnotationView *calloutAnnotationView = [CalloutAnnotationView calloutAnnotationView];
//    calloutAnnotationView.frame = CGRectMake(0, 100, 300, 120);
//    [self.view addSubview:calloutAnnotationView];
    
}


#pragma mark - CLLocationManager Delegate

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    
    [self requestLocation];
}


#pragma mark - Private Methods

///添加大头针
- (void)addAnnotaions {
    
    CLLocationCoordinate2D location1 = CLLocationCoordinate2DMake(29.616786, 106.493804);
    [self.mapView addAnnotationWithCoordinate:location1
                                        title:@"老司机培训基地1"
                                     subtitle:@"老司机培训基地1"
                                       detail:@"专业制作淘宝京东详情页制作各种等等专业制作淘宝京东详情页制作"
                                        price:@"￥2999"
                                   sellNumber:@"售出136笔"
                                         name:@"XX网络宣传制作公司"
                                        image:[UIImage imageNamed:@"shop_map_annotation"]];
    //[self.mapView addAnnotationWithCoordinate:location1 title:@"老司机培训基地1" subtitle:@"老司机培训基地1"];
    
    CLLocationCoordinate2D location2 = CLLocationCoordinate2DMake(29.619922, 106.480840);
    [self.mapView addAnnotationWithCoordinate:location2
                                        title:@"老司机培训基地2"
                                     subtitle:@"老司机培训基地2"
                                       detail:@"专业制作淘宝京东详情页制作各种等等专业制作淘宝京东详情页制作"
                                        price:@"￥1999"
                                   sellNumber:@"售出236笔"
                                         name:@"XX网络宣传制作公司"
                                        image:[UIImage imageNamed:@"shop_map_annotation"]];
    //[self.mapView addAnnotationWithCoordinate:location2 title:@"老司机培训基地2" subtitle:@"老司机培训基地2"];
}


- (void)requestLocation {
    
    self.locationManager = [[CLLocationManager alloc] init];
    if (![CLLocationManager locationServicesEnabled] || [CLLocationManager authorizationStatus] != kCLAuthorizationStatusAuthorizedWhenInUse) {
        [self.locationManager requestWhenInUseAuthorization];
        
        if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedWhenInUse) {
            NSLog(@"请求成功");
        }
        else {
            NSLog(@"请求失败");
        }
    }
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    [self.locationManager startUpdatingLocation];
}


///假装加个中心点的大头针
- (void)addCenterImage {
    
    UIImage *image = [UIImage imageNamed:@"zhunxing"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    CGRect centerRect = CGRectMake(self.view.center.x, self.view.center.y, 30, 30);
    imageView.contentMode = UIViewContentModeScaleToFill;
    imageView.frame = centerRect;
    [self.view addSubview:imageView];
}


#pragma mark - Override Get Method

- (MainMapView *)mapView {
    
    if (!_mapView) {
        _mapView = [[MainMapView alloc] init];
        _mapView.frame = [UIScreen mainScreen].bounds;
        _mapView.userTrackingMode = MKUserTrackingModeFollow;
        _mapView.mapType = MKMapTypeStandard;
    }
    return _mapView;
}





@end
