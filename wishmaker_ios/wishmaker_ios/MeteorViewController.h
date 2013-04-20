//
//  MeteorViewController.h
//  wishmaker_ios
//
//  Created by Javier Giovannini on 20-04-13.
//  Copyright (c) 2013 Javier Giovannini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Meteor.h"
@interface MeteorViewController : UIViewController

@property (nonatomic, strong) Meteor *meteor;
@property (weak, nonatomic) IBOutlet UIImageView *photo;
@property (weak, nonatomic) IBOutlet UITextView *description;
@property (weak, nonatomic) IBOutlet UILabel *subtitle;

@end
