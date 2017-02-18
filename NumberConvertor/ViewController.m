//
//  ViewController.m
//  NumberConvertor
//
//  Created by Alex Craciun on 10/10/15.
//  Copyright © 2015 Alex Craciun. All rights reserved.
//

#import "ViewController.h"
#import "ConversionViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ConversionViewController *cvc = [segue destinationViewController];
    if ([segue.identifier isEqual: @"arabtoroman"]) {
        cvc.navigationItem.title = @"Arab to Roman";
    }
    else {
        cvc.navigationItem.title = @"Roman to Arab";
    }
}

@end
