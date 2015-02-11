

#import "JSControlLayout.h"

@interface JSControlLayout () {

	JSDPad *_dPad;
	NSMutableArray *_buttons;
	
}

@end

@implementation JSControlLayout

- (id)initWithLayout:(NSString *)layoutFile delegate:(id <JSDPadDelegate>)delegate
{
	if ((self = [super initWithFrame:CGRectZero]))
	{
		if (![layoutFile length] || !delegate)
		{
			@throw [NSException exceptionWithName:@"JSControlPadInternalInconsistencyException"
										   reason:@"A Layout file path AND a delegate must be provided"
										 userInfo:nil];
			return nil;
		}
		
		self.delegate = delegate;
		
		if ([layoutFile length])
		{
			NSDictionary *layout = [[NSDictionary alloc] initWithContentsOfFile:layoutFile];
			if (layout)
			{
				self.title = [layout objectForKey:@"title"];
				
				// set up the dpad
				NSDictionary *dPadDict = [layout objectForKey:@"dpad"];
				CGRect dPadFrame = CGRectFromString([dPadDict objectForKey:@"frame"]);
				_dPad = [[JSDPad alloc] initWithFrame:dPadFrame];
				[_dPad setDelegate:self.delegate];
				[self addSubview:_dPad];
				
				
				}
			}
		}
return self;
}
	


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch *touch = [touches anyObject];
	CGPoint point = [touch locationInView:self];
	CGRect frame = [_dPad frame];
	
	if (CGRectContainsPoint(frame, point))
	{
		[_dPad touchesBegan:touches withEvent:event];
	}
	else
	{
		
			
			if (CGRectContainsPoint(frame, point))
			{
				[_dPad touchesBegan:touches withEvent:event];
			}
		}
	}


- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch *touch = [touches anyObject];
	CGPoint point = [touch locationInView:self];
	CGRect frame = [_dPad frame];
	
	if (CGRectContainsPoint(frame, point))
	{
		[_dPad touchesMoved:touches withEvent:event];
	}
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
	
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	
}

@end
