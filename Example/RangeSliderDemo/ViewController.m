//
//  ViewController.m
//  RangeSliderDemo
//
//  Created by Tom Thorpe on 31/03/2015.
//  Copyright (c) 2015 tomthorpe. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet TTRangeSlider *rangeSlider;
@property (weak, nonatomic) IBOutlet TTRangeSlider *rangeSliderCurrency;
@property (weak, nonatomic) IBOutlet TTRangeSlider *rangeSliderCustom;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //standard rsnge slider
    self.rangeSlider.delegate = self;
    self.rangeSlider.minValue = 0;
    self.rangeSlider.maxValue = 200;
    self.rangeSlider.selectedMinimum = 50;
    self.rangeSlider.selectedMaximum = 150;
    
    //currency range slider
    self.rangeSliderCurrency.delegate = self;
    self.rangeSliderCurrency.minValue = 50;
    self.rangeSliderCurrency.maxValue = 150;
    self.rangeSliderCurrency.selectedMinimum = 50;
    self.rangeSliderCurrency.selectedMaximum = 150;
    self.rangeSliderCurrency.handleColor = [UIColor greenColor];
    self.rangeSliderCurrency.handleDiameter = 30;
    self.rangeSliderCurrency.selectedHandleDiameterMultiplier = 1.3;
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterCurrencyStyle;
    self.rangeSliderCurrency.numberFormatterOverride = formatter;
    
    //custom number formatter range slider
    self.rangeSliderCustom.delegate = self;
    self.rangeSliderCustom.minValue = 20;
    self.rangeSliderCustom.maxValue = 60;
    self.rangeSliderCustom.selectedMinimum = 40;
    self.rangeSliderCustom.selectedMaximum = 50;
    self.rangeSliderCustom.handleColor = [UIColor colorWithWhite:1 alpha:1];
    self.rangeSliderCustom.selectedHandleDiameterMultiplier = 1;
    self.rangeSliderCustom.handleDiameter = 30;
    self.rangeSliderCustom.tintColor = [UIColor colorWithWhite:204.f / 255.f alpha:1];
    self.rangeSliderCustom.tintColorBetweenHandles = [UIColor redColor];
    self.rangeSliderCustom.lineHeight = 2;
    
    for (CALayer * layer in @[self.rangeSliderCustom.leftHandle,
                              self.rangeSliderCustom.rightHandle]) {
        layer.borderWidth = 1;
        layer.borderColor = [UIColor colorWithWhite:0 alpha:0.1].CGColor;
        layer.shadowOffset = (CGSize){0, 3};
        layer.shadowRadius = 3;
        layer.shadowColor = [UIColor blackColor].CGColor;
        layer.shadowOpacity = 0.25;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark TTRangeSliderViewDelegate
-(void)rangeSlider:(TTRangeSlider *)sender didChangeSelectedMinimumValue:(float)selectedMinimum andMaximumValue:(float)selectedMaximum{
    if (sender == self.rangeSlider){
        NSLog(@"Standard slider updated. Min Value: %.0f Max Value: %.0f", selectedMinimum, selectedMaximum);
    }
    else if (sender == self.rangeSliderCurrency) {
        NSLog(@"Currency slider updated. Min Value: %.0f Max Value: %.0f", selectedMinimum, selectedMaximum);
    }
    else if (sender == self.rangeSliderCustom){
        NSLog(@"Custom slider updated. Min Value: %.0f Max Value: %.0f", selectedMinimum, selectedMaximum);
    }
}

@end
