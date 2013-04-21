//
//  MeteorCell.h
//  wishmaker_ios
//
//  Created by Javier Giovannini on 20-04-13.
//  Copyright (c) 2013 Javier Giovannini. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MeteorCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *subtitle;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet BButton *disclosureButton;
@end
