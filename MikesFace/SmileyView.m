//
//  SmileyView.m
//  MikesFace
//
//  Created by Rose CW on 8/21/12.
//  Copyright (c) 2012 Rose CW. All rights reserved.
//

#import "SmileyView.h"

@interface SmileyView ()
@property float lowestControlPointY;
@property float highestControlPointY;
@end


@implementation SmileyView
@synthesize bezierControlPointY;
@synthesize center;
@synthesize maxRadius;
@synthesize faceColor;

@synthesize lowestControlPointY;
@synthesize highestControlPointY;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // Initialization code
        
        CGRect bounds = self.bounds;
        self.center = CGPointMake(bounds.origin.x + bounds.size.width/2.0, bounds.origin.y + bounds.size.height/2.0);
        self.maxRadius = hypot(bounds.size.width, bounds.size.height)/4.0;
        
        self.bezierControlPointY = center.y + self.maxRadius / 4.0;
        self.faceColor = [UIColor yellowColor];
        
        self.lowestControlPointY = self.center.y + self.maxRadius;
        self.highestControlPointY = self.center.y - self.maxRadius / 4.0;
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef ctx = UIGraphicsGetCurrentContext();

    
    
    CGContextAddArc(ctx, self.center.x, self.center.y, self.maxRadius, 0.0, M_PI*2.0, YES);
    
    
    [self.faceColor set];
    CGContextSetLineWidth(ctx, 9.0);
    CGContextFillPath(ctx);
    CGContextSetLineCap(ctx, kCGLineCapRound);
    
    
    //two eyes
    [[UIColor blackColor]set];
    CGContextAddArc(ctx, (self.center.x - self.maxRadius/2.0), (self.center.y - self.maxRadius / 4.0), self.maxRadius/5.0, 0.0, M_PI*2.0, YES);
    CGContextAddArc(ctx, (self.center.x + self.maxRadius/2.0), (self.center.y - self.maxRadius / 4.0), self.maxRadius/5.0, 0.0, M_PI*2.0, YES);
    CGContextFillPath(ctx);
    

    
    //start point for curve
    CGContextMoveToPoint(ctx, (self.center.x - self.maxRadius/2.0), (self.center.y + self.maxRadius / 4.0));

    //draw a curve for the mouth: cp1, cp2, endpt
    CGContextAddCurveToPoint(ctx,
                             ((self.center.x - self.maxRadius/2.0)), self.bezierControlPointY,
                             (self.center.x + self.maxRadius/2.0) , self.bezierControlPointY,
                             (self.center.x + self.maxRadius/2.0), self.center.y + self.maxRadius /4.0);
    CGContextStrokePath(ctx);
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{

    UITouch* currentTouch = [touches anyObject];    
    float differenceOnY = [currentTouch locationInView:self].y - [currentTouch previousLocationInView:self].y;
    
    if ( !(self.bezierControlPointY+differenceOnY < self.highestControlPointY) && !(self.bezierControlPointY+differenceOnY > self.lowestControlPointY)){
        self.bezierControlPointY+= differenceOnY;
        [self calculateColor];
        [self setNeedsDisplay];
        
    }
    
}

-(void)calculateColor{
    double hue = (1.0/3.0)-(self.bezierControlPointY-self.lowestControlPointY)/(self.highestControlPointY - self.lowestControlPointY)/3.0;
    self.faceColor = [UIColor colorWithHue:hue saturation:1.0 brightness:1.0 alpha:1.0];
}

@end
