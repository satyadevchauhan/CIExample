//
//  FirstViewController.m
//  CIExample
//
//  Created by Satyadev Chauhan on 09/06/16.
//  Copyright © 2016 Satyadev Chauhan. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnCrash_Pressed:(id)sender {
    int *x = NULL;
    *x = 42;
}

@end
