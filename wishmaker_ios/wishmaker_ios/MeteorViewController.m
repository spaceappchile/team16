//
//  MeteorViewController.m
//  wishmaker_ios
//
//  Created by Javier Giovannini on 20-04-13.
//  Copyright (c) 2013 Javier Giovannini. All rights reserved.
//

#import "MeteorViewController.h"

@interface MeteorViewController ()

@end

@implementation MeteorViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = self.meteor.title;
    self.subtitle.text = [self stringFromDate:self.meteor.created_at];
    self.description.text = self.meteor.description;
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSString*) stringFromDate : (NSDate *) date{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd-MM-yyyy HH:mm"];
    
    //Optionally for time zone converstions
    [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"..."]];
    
    NSString *string = [formatter stringFromDate:date];
    
    return string;
}

@end
