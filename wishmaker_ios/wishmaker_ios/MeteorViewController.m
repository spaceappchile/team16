//
//  MeteorViewController.m
//  wishmaker_ios
//
//  Created by Javier Giovannini on 20-04-13.
//  Copyright (c) 2013 Javier Giovannini. All rights reserved.
//

#import "MeteorViewController.h"
#import "MBProgressHUD.h"
#import <Social/Social.h>

@interface MeteorViewController ()

@property (nonatomic, strong) MBProgressHUD *HUD;
@property (weak, nonatomic) IBOutlet BButton *wishButton;

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
    
    [self.wishButton setTitle:@"Make a Wish" forState:UIControlStateNormal];
    [self.wishButton setType:BButtonTypeSuccess];

    self.title = self.meteor.title;
    self.subtitle.text = [self stringFromDate:self.meteor.created_at];
    self.address.text = self.meteor.address;
    self.description.text = self.meteor.description;
    NSString *imagename = [NSString stringWithFormat:@"big%i.jpg", self.index%6+1];
    self.photo.image = [UIImage imageNamed:imagename];


    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)facebookButtonPressed:(id)sender {
    [self shareWith:@"facebook"];
    
}
- (IBAction)twitterButtonPressed:(id)sender {
    [self shareWith:@"twitter"];
}

-(void)shareWith:(NSString*)socialNetwork{
    
    self.HUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    [self.navigationController.view addSubview:self.HUD];
    
    NSString *SLServiceType;
    if ([socialNetwork isEqualToString:@"twitter"]) {
        SLServiceType = SLServiceTypeTwitter;
    }
    else if ([socialNetwork isEqualToString:@"facebook"]){
        SLServiceType = SLServiceTypeFacebook;
    }
    
    if([SLComposeViewController isAvailableForServiceType:SLServiceType]) {
        
        SLComposeViewController *slComposeViewController = [SLComposeViewController composeViewControllerForServiceType:SLServiceType];
        [slComposeViewController addURL:[NSURL URLWithString:@"http://www.spotterr.cl" ]];
        [slComposeViewController setInitialText:[NSString stringWithFormat:@"He pedido un deseo al meteorito %@, visto en %@", self.meteor.title, self.meteor.address]];
        [self presentViewController:slComposeViewController animated:YES completion:nil];
    }
    else{
        self.HUD.mode = MBProgressHUDModeCustomView;
        self.HUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"fail.png"]] ;
        self.HUD.labelText = [socialNetwork capitalizedString];
        self.HUD.detailsLabelText = NSLocalizedString(@"The service has not been set", @"Displayed when the service has not been setted in the device");
        [self.HUD show:YES];
        [self.HUD hide:YES afterDelay:2];
    }
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
