//
//  ViewController.m
//  MessageSenderDemo
//
//  Created by David Tseng on 1/29/14.
//  Copyright (c) 2014 David Tseng. All rights reserved.
//

#import "ViewController.h"
#import "DTMessageSender.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextField *txfTo;
@property (strong, nonatomic) IBOutlet UITextField *txfContent;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)btnGOClicked:(id)sender {
    
    [DTMessageSender sendMessageTo:@[self.txfTo.text] andContent:self.txfContent.text andCurrentViewController:self withSent:^(MFMessageComposeViewController *controller) {
       
        NSLog(@"Message Sent.");
    } withCancelled:^(MFMessageComposeViewController *controller) {
       
        NSLog(@"Cancelled.");
    } withFailed:^(MFMessageComposeViewController *controller) {
        
        NSLog(@"Failed.");
    } andCompletion:^{
       
        NSLog(@"Presented.");
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
