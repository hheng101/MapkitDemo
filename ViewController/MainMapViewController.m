//
//  MainMapViewController.m
//  MapKitDemo
//
//  Created by 戴雨恒 on 16/8/10.
//  Copyright © 2016年 Darren. All rights reserved.
//

#import "MainMapViewController.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "Annotation.h"

@interface MainMapViewController () <MKMapViewDelegate>

@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) MKMapView *mapView;

@end

@implementation MainMapViewController


#pragma mark - 生命周期

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self initViewController];
    [self addAnnotaions];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}


#pragma mark - 初始化

- (void)initViewController {
    
    self.title = @"假装是个搜索栏";
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self requestLocation];
    
    self.mapView = [[MKMapView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.mapView.delegate = self;
    
    self.mapView.userTrackingMode = MKUserTrackingModeFollow;
    self.mapView.mapType = MKMapTypeStandard;
    
    [self.view addSubview:self.mapView];
    
    [self addCenterImage];
    
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


#pragma mark - 实例方法

///添加大头针
- (void)addAnnotaions {
    
    CLLocationCoordinate2D location1 = CLLocationCoordinate2DMake(29, 106);
    Annotation *annotation1 = [[Annotation alloc] init];
    annotation1.title = @"老司机培训基地";
    annotation1.subtitle = @"老司机培训基地";
    annotation1.coordinate = location1;
    [self.mapView addAnnotation:annotation1];
    
    CLLocationCoordinate2D location2 = CLLocationCoordinate2DMake(29.1, 106.1);
    Annotation *annotation2 = [[Annotation alloc] init];
    annotation2.title = @"老司机培训基地";
    annotation2.subtitle = @"老司机培训基地";
    annotation2.coordinate = location2;
    [self.mapView addAnnotation:annotation2];
    
    CLLocationCoordinate2D centerCoordinate = self.mapView.region.center;
    Annotation *centerAnnotation = [[Annotation alloc] init];
    centerAnnotation.coordinate = centerCoordinate;
    [self.mapView addAnnotation:centerAnnotation];
}


#pragma mark - 地图代理

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    
    NSLog(@"%@", userLocation);
    
}


- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated {
    
    CLLocationCoordinate2D centerCoordinate = mapView.region.center;
    //可以用这个方法实现中心点的大头针效果
    NSLog(@" regionDidChangeAnimated %f,%f",centerCoordinate.latitude, centerCoordinate.longitude);
}


@end
