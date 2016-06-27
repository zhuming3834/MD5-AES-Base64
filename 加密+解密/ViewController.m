//
//  ViewController.m
//  加密+解密
//
//  Created by hgdq on 16/6/27.
//  Copyright © 2016年 hgdq. All rights reserved.
//

#import "ViewController.h"
#import "MD5.h"
#import "NSData+AES.h"
#import "NSData+Base64.h"

@interface ViewController ()<UITextFieldDelegate>
/**
 *  文本输入框
 */
@property (weak, nonatomic) IBOutlet UITextField *textFile;
/**
 *  加密后数据显示框
 */
@property (weak, nonatomic) IBOutlet UILabel *enLabel;
/**
 *  解密后的数据显示框
 */
@property (weak, nonatomic) IBOutlet UILabel *deLabel;

@end




@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField{
    
//    // MD 5
//    self.enLabel.text = [MD5 md5:textField.text];
//    
//    // AES
//    NSLog(@"%@",[NSData aes256EncryptWithString:textField.text]);
//    self.enLabel.text = [NSData aes256DecryptStringWithData:[NSData aes256EncryptWithString:textField.text]];
//    
    // base64
    NSLog(@"%@",[NSData base64EncodedWithString:textField.text]);
    
    self.enLabel.text = [NSData base64EncodedWithString:textField.text];
    
    self.deLabel.text = [NSData base64DecryptString:self.enLabel.text];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField.returnKeyType == UIReturnKeyDone) {
        [textField resignFirstResponder];
    }
    return YES;
}




















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end









































