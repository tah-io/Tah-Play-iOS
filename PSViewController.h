//
//  PSViewController.h
//  TAH Play
//
//  Created by Dhiraj on 14/10/14.
//  Copyright (c) 2014 dhirajjadhao. All rights reserved.


#import <UIKit/UIKit.h>
#import "JSAnalogueStick.h"
#import "TAHble.h"

@interface PSViewController : UIViewController<BTSmartSensorDelegate>
{
  IBOutlet UILabel *ConnectionStatusLabel;
}

@property (strong, nonatomic) CBPeripheral *peripheral;
@property (strong, nonatomic) TAHble *sensor;

@property (weak, nonatomic) IBOutlet JSAnalogueStick *analogueStick;

@property (weak, nonatomic) IBOutlet UIButton *select;
@property (weak, nonatomic) IBOutlet UIButton *start;

@property (weak, nonatomic) IBOutlet UIButton *Triangle;
@property (weak, nonatomic) IBOutlet UIButton *Circle;
@property (weak, nonatomic) IBOutlet UIButton *Cross;
@property (weak, nonatomic) IBOutlet UIButton *Square;

- (IBAction)selectPressed:(id)sender;
- (IBAction)selectReleased:(id)sender;

- (IBAction)startPressed:(id)sender;
- (IBAction)startReleased:(id)sender;

- (IBAction)TrianglePressed:(id)sender;
- (IBAction)TriangleReleased:(id)sender;

- (IBAction)CirclePressed:(id)sender;
- (IBAction)CircleReleased:(id)sender;

- (IBAction)CrossPressed:(id)sender;
- (IBAction)CrossReleased:(id)sender;

- (IBAction)SquarePressed:(id)sender;
- (IBAction)SquareReleased:(id)sender;

@end
