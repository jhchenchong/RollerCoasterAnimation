//
//  ViewController.m
//  RollerCoasterAnimation
//
//  Created by 浪漫恋星空 on 2017/3/9.
//  Copyright © 2017年 浪漫恋星空. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) CALayer *groundLayer;

@property (nonatomic, strong) CAShapeLayer *yellowPath;

@property (nonatomic, strong) CAShapeLayer *greenPath;

@property (nonatomic, assign) NSInteger count;

@property (nonatomic, assign) NSInteger count1;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    _count = 0;
    _count1 = 0;
    
    CGSize size = self.view.frame.size;
    [self createGradientLayerWithSize:size];
    [self createMountainLayerWithSize:size];
    [self createGrasslandlayerWithSize:size];
    
    _groundLayer = [self createGroundLayerWithSize:size];
    _yellowPath = [self createYellowPathLayerWithSize:size];
    _greenPath = [self createGreenPathLayerWithSize:size];
    
    [self addTreeLayeWithSize:size];
    
    [NSTimer scheduledTimerWithTimeInterval:0.092 target:self selector:@selector(startAnimated:) userInfo:nil repeats:YES];
    [NSTimer scheduledTimerWithTimeInterval:0.095 target:self selector:@selector(startAnimated1:) userInfo:nil repeats:YES];
    
    [self addCloudAnimationWithSize:size];
}

- (void)startAnimated:(NSTimer *)timer
{
    if (_count == 5) {
        [timer invalidate];
        timer = nil;
    }
    [self addYellowCarPathAnimation];
    _count ++;
}

- (void)startAnimated1:(NSTimer *)timer
{
    if (_count1 == 5) {
        [timer invalidate];
        timer = nil;
    }
    [self addGreenCarPathAnimationWithSize:self.view.frame.size];
    _count1 ++;
}

- (CGFloat)getPoint:(CGPoint)pointOne pointTow:(CGPoint)pointTow referenceX:(CGFloat)referenceX
{
    CGFloat x1 = pointOne.x;
    CGFloat y1 = pointOne.y;
    CGFloat x2 = pointTow.x;
    CGFloat y2 = pointTow.y;
    
    CGFloat a,b;
    a = (y2 - y1) / (x2 - x1);
    b = y1 - a * x1;
    
    CGFloat y = a * referenceX + b;
    return y;
}

- (CAGradientLayer *)createGradientLayerWithSize:(CGSize)size
{
    CAGradientLayer *layer = [CAGradientLayer layer];
    layer.frame = CGRectMake(0, 0, size.width, size.height - 20);
    layer.colors = @[(__bridge id)[[UIColor alloc] initWithRed:178.0/255.0 green:226.0/255.0 blue:248.0/255.0 alpha:1].CGColor,(__bridge id)[[UIColor alloc] initWithRed:232.0/255.0 green:244.0/255.0 blue:193.0/255.0 alpha:1].CGColor];
    layer.startPoint = CGPointMake(0, 0);
    layer.endPoint = CGPointMake(1, 1);
    [self.view.layer addSublayer:layer];
    return layer;
}

- (void)createMountainLayerWithSize:(CGSize)size
{
    CAShapeLayer *mountainOne = [CAShapeLayer layer];
    UIBezierPath *pathOne = [[UIBezierPath alloc] init];
    [pathOne moveToPoint:CGPointMake(0, size.height - 100)];
    [pathOne addLineToPoint:CGPointMake(100, 100)];
    [pathOne addLineToPoint:CGPointMake(size.width / 3, size.height - 100)];
    [pathOne addLineToPoint:CGPointMake(size.width / 1.5, size.width - 50)];
    [pathOne addLineToPoint:CGPointMake(0, size.height)];
    mountainOne.path = pathOne.CGPath;
    mountainOne.fillColor = [UIColor whiteColor].CGColor;
    [self.view.layer addSublayer:mountainOne];
    
    CAShapeLayer *mountainOneLayer = [CAShapeLayer layer];
    UIBezierPath *pathLayerOne = [[UIBezierPath alloc] init];
    [pathLayerOne moveToPoint:CGPointMake(0, size.height - 120)];
    CGFloat pathOneHeight = [self getPoint:CGPointMake(0, size.height - 120) pointTow:CGPointMake(100, 100) referenceX:55];
    CGFloat pathTwoHeight = [self getPoint:CGPointMake(100, 100) pointTow:CGPointMake(size.width / 3, size.height - 100) referenceX:160];
    [pathLayerOne addLineToPoint:CGPointMake(55, pathOneHeight)];
    [pathLayerOne addLineToPoint:CGPointMake(70, pathOneHeight + 15)];
    [pathLayerOne addLineToPoint:CGPointMake(90, pathOneHeight)];
    [pathLayerOne addLineToPoint:CGPointMake(110, pathOneHeight + 25)];
    [pathLayerOne addLineToPoint:CGPointMake(130, pathOneHeight - 5)];
    [pathLayerOne addLineToPoint:CGPointMake(160, pathTwoHeight)];
    
    [pathLayerOne addLineToPoint:CGPointMake(size.width / 3, size.height - 100)];
    [pathLayerOne addLineToPoint:CGPointMake(size.width / 1.5, size.height - 50)];
    [pathLayerOne addLineToPoint:CGPointMake(0, size.height)];
    mountainOneLayer.path = pathLayerOne.CGPath;
    mountainOneLayer.fillColor = [[UIColor alloc] initWithRed:104.0/255.0 green:92.0/255.0 blue:157.0/255.0 alpha:1].CGColor;
    [self.view.layer addSublayer:mountainOneLayer];
    
    CAShapeLayer *mountainTwo = [CAShapeLayer layer];
    UIBezierPath *pathTwo = [[UIBezierPath alloc] init];
    [pathTwo moveToPoint:CGPointMake(size.width / 4, size.height - 90)];
    [pathTwo addLineToPoint:CGPointMake(size.width / 2.7, 200)];
    [pathTwo addLineToPoint:CGPointMake(size.width / 1.8, size.height - 85)];
    [pathTwo addLineToPoint:CGPointMake(size.width / 1.6, size.height - 125)];
    [pathTwo addLineToPoint:CGPointMake(size.width / 1.35, size.height - 70)];
    [pathTwo addLineToPoint:CGPointMake(0, size.height)];
    mountainTwo.path = pathTwo.CGPath;
    mountainTwo.fillColor = [UIColor whiteColor].CGColor;
    [self.view.layer insertSublayer:mountainTwo below:mountainOne];
    
    CAShapeLayer *mountainTwoLayer = [CAShapeLayer layer];
    UIBezierPath *pathLayerTwo = [[UIBezierPath alloc] init];
    [pathLayerTwo moveToPoint:CGPointMake(0, size.height)];
    [pathLayerTwo addLineToPoint:CGPointMake(size.width / 4, size.height - 90)];
    pathOneHeight = [self getPoint:CGPointMake(size.width / 4, size.height - 90) pointTow:CGPointMake(size.width / 2.7, 200) referenceX:size.width / 4 + 50];
    pathTwoHeight = [self getPoint:CGPointMake(size.width / 1.8, size.height - 85) pointTow:CGPointMake(size.width / 2.7, 200) referenceX:size.width / 2.2];
    CGFloat pathThreeHeight = [self getPoint:CGPointMake(size.width / 1.8, size.height - 85) pointTow:CGPointMake(size.width / 1.6, size.height - 125) referenceX:size.width / 1.67];
    CGFloat pathFourHeight = [self getPoint:CGPointMake(size.width / 1.35, size.height - 70) pointTow:CGPointMake(size.width / 1.6, size.height - 125) referenceX:size.width / 1.50];
    [pathLayerTwo addLineToPoint:CGPointMake(size.width / 4 + 50, pathOneHeight)];
    [pathLayerTwo addLineToPoint:CGPointMake(size.width / 4 + 70, pathOneHeight + 15)];
    [pathLayerTwo addLineToPoint:CGPointMake(size.width / 4 + 90, pathOneHeight)];
    [pathLayerTwo addLineToPoint:CGPointMake(size.width / 4 + 110, pathOneHeight + 15)];
    [pathLayerTwo addLineToPoint:CGPointMake(size.width / 2.2, pathTwoHeight)];
    [pathLayerTwo addLineToPoint:CGPointMake(size.width / 1.8, size.height - 85)];
    [pathLayerTwo addLineToPoint:CGPointMake(size.width / 1.67, pathThreeHeight)];
    [pathLayerTwo addLineToPoint:CGPointMake(size.width / 1.65, pathThreeHeight + 5)];
    [pathLayerTwo addLineToPoint:CGPointMake(size.width / 1.60, pathThreeHeight - 2)];
    [pathLayerTwo addLineToPoint:CGPointMake(size.width / 1.58, pathFourHeight + 2)];
    [pathLayerTwo addLineToPoint:CGPointMake(size.width / 1.55, pathFourHeight - 5)];
    [pathLayerTwo addLineToPoint:CGPointMake(size.width / 1.50, pathFourHeight)];
    [pathLayerTwo addLineToPoint:CGPointMake(size.width / 1.35, size.height - 70)];
    [pathLayerTwo addLineToPoint:CGPointMake(0, size.height)];
    
    mountainTwoLayer.path = pathLayerTwo.CGPath;
    mountainTwoLayer.fillColor = [[UIColor alloc] initWithRed:75.0/255.0 green:65.0/255.0 blue:111.0/255.0 alpha:1.0].CGColor;
    [self.view.layer insertSublayer:mountainTwoLayer below:mountainOne];
}

- (NSArray<CAShapeLayer *> *)createGrasslandlayerWithSize:(CGSize)size
{
    CAShapeLayer *grasslandOne = [CAShapeLayer layer];
    UIBezierPath *patnOne = [[UIBezierPath alloc] init];
    [patnOne moveToPoint:CGPointMake(0, size.height - 20)];
    [patnOne addLineToPoint:CGPointMake(0, size.height - 100)];
    [patnOne addQuadCurveToPoint:CGPointMake(size.width / 3.0, size.height - 20) controlPoint:CGPointMake(size.width, size.height - 100)];
    grasslandOne.path = patnOne.CGPath;
    
    grasslandOne.fillColor = [[UIColor alloc] initWithRed:82.0/255.0 green:177.0/255.0 blue:44.0/255.0 alpha:1.0].CGColor;
    [self.view.layer addSublayer:grasslandOne];
    
    CAShapeLayer *grasslandTwo = [CAShapeLayer layer];
    UIBezierPath *pathTwo = [[UIBezierPath alloc] init];
    [pathTwo moveToPoint:CGPointMake(0, size.height - 20)];
    [pathTwo addQuadCurveToPoint:CGPointMake(size.width, size.height - 60) controlPoint:CGPointMake(size.width / 2.0, size.height - 100)];
    [pathTwo addLineToPoint:CGPointMake(size.width, size.height - 20)];
    grasslandTwo.path = pathTwo.CGPath;
    grasslandTwo.fillColor = [[UIColor alloc] initWithRed:92.0/255.0 green:195.0/255.0 blue:52.0/255.0 alpha:1.0].CGColor;
    [self.view.layer addSublayer:grasslandTwo];
    
    return @[grasslandOne, grasslandTwo];
}

- (CALayer *)createGroundLayerWithSize:(CGSize)size
{
    CALayer *ground = [CALayer layer];
    ground.frame = CGRectMake(0, size.height - 20, size.width, 20);
    ground.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"7"]].CGColor;
    [self.view.layer addSublayer:ground];
    return ground;
}

- (CAShapeLayer *)createYellowPathLayerWithSize:(CGSize)size
{
    CAShapeLayer *calayer = [CAShapeLayer layer];
    calayer.backgroundColor = [UIColor redColor].CGColor;
    calayer.lineWidth = 5;
    calayer.strokeColor = [[UIColor alloc] initWithRed:210.0/255.0 green:179.0/255.0 blue:54.0/255.0 alpha:1.0].CGColor;
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path moveToPoint:CGPointMake(0, size.height - 70)];
    [path addCurveToPoint:CGPointMake(size.width / 1.5, 200) controlPoint1:CGPointMake(size.width / 6, size.height - 200) controlPoint2:CGPointMake(size.width / 2.5, size.height + 50)];
    [path addQuadCurveToPoint:CGPointMake(size.width + 10, size.height / 3) controlPoint:CGPointMake(size.width - 100, 50)];
    [path addLineToPoint:CGPointMake(size.width + 10, size.height + 10)];
    [path addLineToPoint:CGPointMake(0, size.height + 10)];
    calayer.fillColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"2"]].CGColor;
    calayer.path = path.CGPath;
    [self.view.layer insertSublayer:calayer below:_groundLayer];
    
    CAShapeLayer *lineLayer = [CAShapeLayer layer];
    lineLayer.lineCap = kCALineCapRound;
    lineLayer.strokeColor = [UIColor whiteColor].CGColor;
    lineLayer.lineDashPattern = @[@1,@5];
    lineLayer.lineWidth = 2;
    lineLayer.fillColor = [UIColor clearColor].CGColor;
    lineLayer.path = path.CGPath;
    
    [calayer addSublayer:lineLayer];
    return calayer;
}

- (CAShapeLayer *)createGreenPathLayerWithSize:(CGSize)size
{
    CAShapeLayer *calayer = [CAShapeLayer layer];
    calayer.backgroundColor = [UIColor redColor].CGColor;
    calayer.lineWidth = 5;
    calayer.fillRule = kCAFillRuleEvenOdd;
    calayer.strokeColor = [[UIColor alloc] initWithRed:0.0/255.0 green:147.0/255.0 blue:163.0/255.0 alpha:1.0].CGColor;
    UIBezierPath *path = [[UIBezierPath alloc] init];
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineJoinRound;
    [path moveToPoint:CGPointMake(size.width + 10, size.height)];
    [path addLineToPoint:CGPointMake(size.width + 10, size.height - 70)];
    [path addQuadCurveToPoint:CGPointMake(size.width / 1.8, size.height - 70) controlPoint:CGPointMake(size.width - 120, 200)];
    [path addArcWithCenter:CGPointMake(size.width / 1.9, size.height - 140) radius:70 startAngle:0.5 * M_PI endAngle:2.5 * M_PI clockwise:YES];
    [path addCurveToPoint:CGPointMake(0, size.height - 100) controlPoint1:CGPointMake(size.width / 1.8 - 60, size.height - 60) controlPoint2:CGPointMake(150, size.height / 2.3)];
    [path addLineToPoint:CGPointMake(-100, size.height + 10)];
    calayer.fillColor = [UIColor clearColor].CGColor;
    calayer.path = path.CGPath;
    [self.view.layer insertSublayer:calayer below:_groundLayer];
    
    CAShapeLayer *greenLayer = [CAShapeLayer layer];
    greenLayer.fillRule = kCAFillRuleEvenOdd;
    greenLayer.strokeColor = [[UIColor alloc] initWithRed:0.0/255.0 green:147.0/255.0 blue:163.0/255.0 alpha:1.0].CGColor;
    UIBezierPath *greenPath = [[UIBezierPath alloc] init];
    [greenPath moveToPoint:CGPointMake(size.width + 10, size.height)];
    [greenPath addLineToPoint:CGPointMake(size.width + 10, size.height - 70)];
    [greenPath addQuadCurveToPoint:CGPointMake(size.width / 1.8, size.height - 70) controlPoint:CGPointMake(size.width - 120, 200)];
    [greenPath addCurveToPoint:CGPointMake(0, size.height - 100) controlPoint1:CGPointMake(size.width / 1.8 - 60, size.height - 60) controlPoint2:CGPointMake(150, size.height / 2.3)];
    [greenPath addLineToPoint:CGPointMake(-100, size.height + 10)];
    greenLayer.fillColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"3"]].CGColor;
    greenLayer.path = greenPath.CGPath;
    [self.view.layer insertSublayer:greenLayer below:calayer];
    
    CAShapeLayer *lineLayer = [CAShapeLayer layer];
    lineLayer.lineCap = kCALineCapRound;
    lineLayer.strokeColor = [UIColor whiteColor].CGColor;
    lineLayer.lineDashPattern = @[@1,@5];
    lineLayer.lineWidth = 2;
    lineLayer.fillColor = [UIColor clearColor].CGColor;
    lineLayer.path = path.CGPath;
    [calayer addSublayer:lineLayer];
    
    return calayer;
}

- (void)addYellowCarPathAnimation
{
    CALayer *carLayer = [CALayer layer];
    carLayer.frame = CGRectMake(0, 0, 17, 11);
    [carLayer setAffineTransform:CGAffineTransformTranslate(carLayer.affineTransform, 0, -7)];
    carLayer.contents = (__bridge id)[UIImage imageNamed:@"6"].CGImage;
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.path = [_yellowPath path];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animation.duration = 6;
    animation.repeatCount = MAXFLOAT;
    animation.autoreverses = NO;
    animation.calculationMode = kCAAnimationCubicPaced;
    animation.rotationMode = kCAAnimationRotateAuto;
    [_yellowPath addSublayer:carLayer];
    [carLayer addAnimation:animation forKey:nil];
}

- (void)addGreenCarPathAnimationWithSize:(CGSize)size
{
    CALayer *carLayer = [CALayer layer];
    carLayer.frame = CGRectMake(0, 0, 17, 11);
    carLayer.contents = (__bridge id)[UIImage imageNamed:@"1"].CGImage;
    UIBezierPath *path = [[UIBezierPath alloc] init];
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineJoinRound;
    [path moveToPoint:CGPointMake(size.width + 10, size.height - 7)];
    [path addLineToPoint:CGPointMake(size.width + 10, size.height - 77)];
    [path addQuadCurveToPoint:CGPointMake(size.width / 1.8, size.height - 77) controlPoint:CGPointMake(size.width - 120, 193)];
    [path addArcWithCenter:CGPointMake(size.width / 1.9, size.height - 140) radius:63 startAngle:0.5 * M_PI endAngle:2.5 * M_PI clockwise:YES];
    [path addCurveToPoint:CGPointMake(0, size.height - 107) controlPoint1:CGPointMake(size.width / 1.8 - 60, size.height - 67) controlPoint2:CGPointMake(150, size.height / 2.3)];
    [path addLineToPoint:CGPointMake(-100, size.height + 7)];
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.path = path.CGPath;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animation.duration = 6;
    animation.repeatCount = MAXFLOAT;
    animation.autoreverses = NO;
    animation.calculationMode = kCAAnimationCubicPaced;
    animation.rotationMode = kCAAnimationRotateAuto;
    [self.view.layer addSublayer:carLayer];
    
    [carLayer addAnimation:animation forKey:nil];
}

- (CALayer *)addCloudAnimationWithSize:(CGSize)size
{
    CALayer *cloudLayer = [CALayer layer];
    cloudLayer.contents = (__bridge id)[UIImage imageNamed:@"5"].CGImage;
    cloudLayer.frame = CGRectMake(0, 0, 63, 20);
    [self.view.layer addSublayer:cloudLayer];
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path moveToPoint:CGPointMake(size.width + 63, 40)];
    [path addLineToPoint:CGPointMake(- 63, 40)];
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.path = path.CGPath;
    animation.duration = 40;
    animation.repeatCount = MAXFLOAT;
    animation.autoreverses = NO;
    animation.calculationMode = kCAAnimationCubicPaced;
    [cloudLayer addAnimation:animation forKey:nil];
    
    return cloudLayer;
}

- (void)addTreeLayeWithSize:(CGSize)size
{
    for (int i = 0; i < 7; i ++) {
        CALayer *treeOne = [CALayer layer];
        treeOne.contents = (__bridge id)[UIImage imageNamed:@"4"].CGImage;
        treeOne.frame = CGRectMake([@[@5,@55,@70,@(size.width / 3 + 15),@(size.width / 3 + 25), @(size.width - 130),@(size.width - 160)][i] floatValue], size.height - 43, 13, 23);
        [self.view.layer addSublayer:treeOne];
    }
    for (int i = 0; i < 4; i ++) {
        CALayer *treeOne = [CALayer layer];
        treeOne.contents = (__bridge id)[UIImage imageNamed:@"4"].CGImage;
        treeOne.frame = CGRectMake([@[@10,@60,@(size.width / 3),@(size.width - 150)][i] floatValue], size.height - 52, 18, 32);
        [self.view.layer addSublayer:treeOne];
    }
    for (int i = 0; i < 2; i ++) {
        CALayer *treeOne = [CALayer layer];
        treeOne.contents = (__bridge id)[UIImage imageNamed:@"4"].CGImage;
        treeOne.frame = CGRectMake([@[@(size.width - 210),@(size.width - 50)][i] floatValue], [@[@(size.height - 75),@(size.height - 80)][i] floatValue], 18, 32);
        [self.view.layer addSublayer:treeOne];
    }
    for (int i = 0; i < 3; i ++) {
        CALayer *treeOne = [CALayer layer];
        treeOne.contents = (__bridge id)[UIImage imageNamed:@"4"].CGImage;
        treeOne.frame = CGRectMake([@[@(size.width - 235),@(size.width - 220), @(size.width - 40)][i] floatValue], [@[@(size.height - 67),@(size.height - 67),@(size.height - 72)][i] floatValue], 13, 23);
        [self.view.layer addSublayer:treeOne];
    }
}

@end
