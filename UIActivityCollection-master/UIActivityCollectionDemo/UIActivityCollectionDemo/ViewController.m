//
//  ViewController.m
//  UIActivityCollectionDemo
//
//  Created by shuichi on 12/11/27.
//  Copyright (c) 2012年 Shuichi Tsutsumi. All rights reserved.
//

#import "ViewController.h"
#import "GSDropboxActivity.h"
#import "DMActivityInstagram.h"
#import "ARChromeActivity.h"
#import "ZYInstapaperActivity.h"
#import "NHCalendarActivity.h"
#import "TUSafariActivity.h"
#import "LINEActivity.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor viewFlipsideBackgroundColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



#pragma mark -------------------------------------------------------------------
#pragma mark Private

- (NHCalendarEvent *)calendarEventForDemo {

    NHCalendarEvent *event = [[NHCalendarEvent alloc] init];
    event.title = @"Sample Event";
    event.notes = @"This is a sample event generated by UIActivityCollectionDeme.\n\
    https://github.com/shu223/UIActivityCollection";
    event.startDate = [NSDate date];
    event.endDate = [NSDate date];
    event.allDay = YES;
    
    return event;
}


#pragma mark -------------------------------------------------------------------
#pragma mark IBAction

- (IBAction)pressBtn:(UIButton *)sender {

    // activityItems
    NSString *text  = @"iOS6 UIActivity Providers Collection: UIActivityCollection";
    NSURL    *url   = [NSURL URLWithString:@"https://github.com/shu223/UIActivityCollection"];
    UIImage  *image = [UIImage imageNamed:@"sample.png"];
    NHCalendarEvent *event = [self calendarEventForDemo];
    
    NSArray *activityItems;
    switch (sender.tag) {
        case 0:
        default:
            activityItems = @[text];
            break;
        case 1:
            activityItems = @[url];
            break;
        case 2:
            activityItems = @[image];
            break;
        case 3:
            activityItems = @[event];
            break;
        case 4:
            activityItems = @[text, url, image, event];
            break;
    }
    

    // activities
    GSDropboxActivity    *dropbox    = [[GSDropboxActivity alloc] init];
    DMActivityInstagram  *instagram  = [[DMActivityInstagram alloc] init];
    ARChromeActivity     *chrome     = [[ARChromeActivity alloc] init];
    ZYInstapaperActivity *instapaper = [[ZYInstapaperActivity alloc] init];
    NHCalendarActivity   *calendar   = [[NHCalendarActivity alloc] init];
    TUSafariActivity     *safari     = [[TUSafariActivity alloc] init];
    LINEActivity         *line       = [[LINEActivity alloc] init];
    
    NSArray *activities = @[
    dropbox,
    instagram,
    chrome,
    instapaper,
    calendar,
    safari,
    line,
    ];
    
    // UIActivityViewController
    UIActivityViewController *activityView = [[UIActivityViewController alloc] initWithActivityItems:activityItems
                                                                               applicationActivities:activities];
    
    // Exclude default activity types for demo.
//    activityView.excludedActivityTypes = @[
//    UIActivityTypeAssignToContact,
//    UIActivityTypeCopyToPasteboard,
//    UIActivityTypePostToFacebook,
//    UIActivityTypePostToTwitter,
//    UIActivityTypePostToWeibo,
//    UIActivityTypePrint,
//    UIActivityTypeMail,
//    UIActivityTypeMessage,
//    UIActivityTypeSaveToCameraRoll,
//    ];

    // show
    [self presentViewController:activityView animated:YES completion:nil];
}

@end
