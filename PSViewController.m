//
//  PSViewController.m
//  TAH Play
//
//  Created by Dhiraj on 14/10/14.
//  Copyright (c) 2014 dhirajjadhao. All rights reserved.


#import <AudioToolbox/AudioToolbox.h>
#import "PSViewController.h"
#import "JSAnalogueStick.h"

@interface PSViewController ()
{
    
    
    int Buttonpadtag;
    NSString *joyX;
    NSString *joyY;
    int mode; // 0 = Play Station and 1 = Computer Joystick
    
    NSString *dpadValue;
    NSString *command;
    NSString *seperator;
    NSString *end;
    
    
}
@end

@implementation PSViewController

@synthesize sensor;
@synthesize peripheral;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self updateall];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  
    
    sensor.delegate = self;
   
    // Set Connection Status Image
    [self UpdateConnectionStatusLabel];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)prefersStatusBarHidden
{
    return NO;
}

-(void)viewWillAppear:(BOOL)animated
{
    // Set Connection Status Image
    [self UpdateConnectionStatusLabel];
}

///////////// Update Device Connection Status Image //////////
-(void)UpdateConnectionStatusLabel
{
    
    
    if (sensor.activePeripheral.state)
    {
        
        ConnectionStatusLabel.backgroundColor = [UIColor colorWithRed:128.0/255.0 green:255.0/255.0 blue:0.0/255.0 alpha:1.0];
    }
    else
    {
        
        ConnectionStatusLabel.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:128.0/255.0 blue:0.0/255.0 alpha:1.0];
    }
}


- (void)analogueStickDidChangeValue:(JSAnalogueStick *)analogueStick
{
    [self updateall];
}



- (void)updateall
{
    

    mode = 0;
    
    
    // Left Dpad Value
    dpadValue = @"5";
    
    
    // Left Joystick X axis Value
    joyX = [NSString stringWithFormat:@"%.0f", self.analogueStick.xValue*128.0];
    
    // Left Joystick Y axis Value
    joyY = [NSString stringWithFormat:@"%.0f", self.analogueStick.yValue*128.0];
    
    ////////////////////////////////////////////
    
    
    seperator = @",";
    end = @"P";
    
    
    command = [NSString stringWithFormat:@"%d%@%@%@%@%@%@%@%d%@",mode,seperator,joyX,seperator,joyY,seperator,dpadValue,seperator,Buttonpadtag,end];
    
    
    //////// data string to be sent ///////////
    
    NSLog(@"%@",command);
    
    
    NSData *data = [command dataUsingEncoding:[NSString defaultCStringEncoding]];
    
    
    [sensor write:sensor.activePeripheral data:data];
    
    /////////////////////////////////////////////////////////////
    
    
    
}


- (IBAction)selectPressed:(id)sender
{
    Buttonpadtag = 7;
    [self updateall];
}

- (IBAction)selectReleased:(id)sender
{
    Buttonpadtag = 0;
    [self updateall];
}

- (IBAction)startPressed:(id)sender
{
    Buttonpadtag = 8;
    [self updateall];
}
- (IBAction)startReleased:(id)sender
{
    Buttonpadtag = 0;
    [self updateall];
}

- (IBAction)TrianglePressed:(id)sender
{
    Buttonpadtag = 4;
    [self updateall];
}
- (IBAction)TriangleReleased:(id)sender
{
    Buttonpadtag = 0;
    [self updateall];
}

- (IBAction)CirclePressed:(id)sender
{
    Buttonpadtag = 2;
    [self updateall];
}
- (IBAction)CircleReleased:(id)sender
{
    Buttonpadtag = 0;
    [self updateall];
}
- (IBAction)CrossPressed:(id)sender
{
    Buttonpadtag = 1;
    [self updateall];
}
- (IBAction)CrossReleased:(id)sender
{
    Buttonpadtag = 0;
    [self updateall];
}

- (IBAction)SquarePressed:(id)sender
{
    Buttonpadtag = 3;
    [self updateall];
}
- (IBAction)SquareReleased:(id)sender
{
    Buttonpadtag = 0;
    [self updateall];
}

@end
