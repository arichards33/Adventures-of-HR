//
//  SettingsViewController.h
//  Harper Rose Goes To The Beach
//
//  Created by Alex Richards on 4/12/18.
//  Copyright © 2018 Alex Richards. All rights reserved.
//

#import <UIKit/UIKit.h>
@import UIKit;

@interface SettingsViewController : UIViewController


@property (strong, nonatomic) IBOutlet UIImageView *titleImage;
@property (strong, nonatomic) IBOutlet UISwitch *switchButton;
@property (weak, nonatomic) IBOutlet UILabel *tapReadLabel;
@property (weak, nonatomic) IBOutlet UISwitch *tapSwitch;
@property (nonatomic) BOOL tapOnOff;
@property (nonatomic) BOOL onOff;

- (IBAction)readSwitch:(UISwitch *)sender;
- (IBAction)tapAction:(UISwitch *)sender;

@end
