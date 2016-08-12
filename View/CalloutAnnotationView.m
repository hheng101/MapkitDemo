//
//  CalloutAnnotationView.m
//  MapKitDemo
//
//  Created by 戴雨恒 on 16/8/12.
//  Copyright © 2016年 Darren. All rights reserved.
//

#import "CalloutAnnotationView.h"

@interface CalloutAnnotationView ()

@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *sellNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation CalloutAnnotationView


//- (instancetype)initWithCoder:(NSCoder *)aDecoder {
//    
//    self = [super initWithCoder:aDecoder];
//    if (self) {
//        <#statements#>
//    }
//    return self;
//}

+ (instancetype) calloutAnnotationView {
    
    CalloutAnnotationView *calloutAnnotationView = [[[NSBundle mainBundle] loadNibNamed:@"CalloutAnnotationView" owner:self options:nil] firstObject];
    return calloutAnnotationView;
}


+ (instancetype)calloutAnnotationViewWithMapView:(MKMapView *)mapView {
    
    static NSString *calloutKey=@"calloutKey1";
    //CalloutAnnotationView *calloutAnnotationView = [[[NSBundle mainBundle] loadNibNamed:@"CalloutAnnotationView" owner:self options:nil] firstObject];
    CalloutAnnotationView *calloutAnnotationView = (CalloutAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:calloutKey];
    if (!calloutAnnotationView) {
        calloutAnnotationView = [[[NSBundle mainBundle] loadNibNamed:@"CalloutAnnotationView" owner:self options:nil] firstObject];
        //calloutAnnotationView.transform = CGAffineTransformMakeScale(0.5, 0.5);
    }
    return calloutAnnotationView;
}


- (void)setAnnotation:(CalloutAnnotation *)annotation {
    
    [super setAnnotation:annotation];
    
    _detailLabel.text = annotation.detail;
    _priceLabel.text = annotation.price;
    _sellNumberLabel.text = annotation.sellNumber;
    _nameLabel.text = annotation.name;
    
}


@end
