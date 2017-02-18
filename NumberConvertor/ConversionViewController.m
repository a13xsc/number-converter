//
//  ConversionViewController.m
//  NumberConvertor
//
//  Created by Alex Craciun on 11/10/15.
//  Copyright © 2015 Alex Craciun. All rights reserved.
//

#import "ConversionViewController.h"
#import "Convertor.h"

@interface ConversionViewController ()
@property (weak, nonatomic) IBOutlet UILabel *toConvertLabel;
@property (weak, nonatomic) IBOutlet UITextField *toConvertField;
@property (weak, nonatomic) IBOutlet UILabel *convertedLabel;
@property (weak, nonatomic) IBOutlet UILabel *convertedField;

@end

@implementation ConversionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([self.navigationItem.title isEqualToString:@"Arab to Roman"]) {
        self.toConvertLabel.text = @"Arab number to convert";
        self.convertedLabel.text = @"Converted roman number";
        self.toConvertField.keyboardType = UIKeyboardTypeNumberPad;
    }
    else {
        self.toConvertLabel.text = @"Roman number to convert";
        self.convertedLabel.text = @"Converted arab number";
        self.toConvertField.keyboardType = UIKeyboardTypeDefault;
    }
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)convert:(UIButton *)sender {
    [self.view endEditing:YES];
    Convertor *convertor = [[Convertor alloc] init];
    if ([self.navigationItem.title isEqualToString:@"Arab to Roman"]) {
        NSInteger number = [self.toConvertField.text integerValue];
        NSNumber *num = [NSNumber numberWithInteger:number];
        int ok = [convertor checkInput:num];
        if (ok == 0) {
            self.convertedField.text = [convertor arabToRoman:number];
        }
        else {
            self.convertedField.text = @"Number not ok. Check format!";
        }
    }
    else {
        NSString *number = [self.toConvertField text];
        int ok = [convertor checkInput:number];
        if (ok == 0) {
            NSInteger result = [convertor romanToArab:number];
            if (result!=-1) {
                self.convertedField.text = [NSString stringWithFormat:@"%zd",[convertor romanToArab:number]];
            }
            else {
                self.convertedField.text = @"Number not ok. Check format!";
            }
            
        }
        else {
            self.convertedField.text = @"Number not ok. Check format!";
        }
        [self.toConvertField setText:[[self.toConvertField text] uppercaseString]];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
