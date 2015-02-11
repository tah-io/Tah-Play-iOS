

#import <UIKit/UIKit.h>
#import "JSDPad.h"


@interface JSControlLayout : UIView

@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) UIDeviceOrientation orientation;

@property (nonatomic, assign) id <JSDPadDelegate> delegate;

- (id)initWithLayout:(NSString *)layoutFile delegate:(id <JSDPadDelegate>)delegate;

@end
