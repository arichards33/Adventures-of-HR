//
//  SettingsViewController.m
//  Harper Rose Goes To The Beach
//
//  Created by Alex Richards on 4/12/18.
//  Copyright © 2018 Alex Richards. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

- (IBAction)readSwitch:(UISwitch *)sender;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _switchButton.transform = CGAffineTransformMakeScale(1.5, 1.5);
    _tapSwitch.transform = CGAffineTransformMakeScale(1.5, 1.5);
    
    _onOff = [[NSUserDefaults standardUserDefaults] boolForKey:@"rPreference"];
    if(_onOff) {
        [_switchButton setOn:YES];
    }
    else {
        [_switchButton setOn:NO];
    }
    
    _tapOnOff = [[NSUserDefaults standardUserDefaults] boolForKey:@"rTapOn"];
    if(_tapOnOff) {
        [_tapSwitch setOn:YES];
    }
    else {
        [_tapSwitch setOn:NO];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//MARK: - Switch Setting Actions
- (IBAction)readSwitch:(UISwitch *)sender {
    
    NSLog(@"Switch Value:%d", sender.isOn);
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSLog(@"Defaults: %@",defaults.dictionaryRepresentation);
    
    [defaults setBool:sender.isOn forKey:@"rPreference"];
    NSLog(@"Defalts: %@", defaults.dictionaryRepresentation);
}


- (IBAction)tapAction:(UISwitch *)sender {
    NSLog(@"Switch Value:%d", sender.isOn);
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSLog(@"Defaults: %@",defaults.dictionaryRepresentation);
    
    [defaults setBool:sender.isOn forKey:@"rTapOn"];
    NSLog(@"Defalts: %@", defaults.dictionaryRepresentation);
    
}


@end
