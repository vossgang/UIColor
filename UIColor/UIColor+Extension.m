//
//  UIColor+Extension.m
//  HELPER_FILES_AND_CATEGORIES
//
//  Created by Matthew Voss on 4/25/14.
//  Copyright (c) 2014 Matthew Voss. All rights reserved.
//

#import "UIColor+Extension.h"

@implementation UIColor (Extension)

//These are mine
+(UIColor *)randomColor
{
    CGFloat r = (arc4random_uniform(1000) + 1) / (float)1000;
    CGFloat g = (arc4random_uniform(1000) + 1) / (float)1000;
    CGFloat b = (arc4random_uniform(1000) + 1) / (float)1000;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
}

+(UIColor *)changeBrightness:(UIColor *)color amount:(CGFloat)amount
{
    CGFloat hue, saturation, brightness, alpha;
    if ([color getHue:&hue saturation:&saturation brightness:&brightness alpha:&alpha]) {
        brightness += (amount-1.0);
        return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:alpha];
    }
    
    CGFloat white;
    if ([color getWhite:&white alpha:&alpha]) {
        white += (amount-1.0);
        white = MAX(MIN(white, 1.0), 0.0);
        return [UIColor colorWithWhite:white alpha:alpha];
    }
    return nil;
}

+(CGFloat)getColorBrightness:(UIColor *)color
{
    const CGFloat *components = CGColorGetComponents([color CGColor]);
    CGFloat red    = components[0];
    CGFloat green  = components[1];
    CGFloat blue   = components[2];
    
    return ((red + blue + green)/ 3);
}

+(NSArray *)randomColorPaletteOfFourColors
{
    NSMutableArray *colors = [NSMutableArray new];

    UIColor *currentColor = [UIColor randomColor];
    [colors addObject:currentColor];

    const CGFloat *components = CGColorGetComponents([currentColor CGColor]);
    CGFloat red    = components[0];
    CGFloat green  = components[1];
    CGFloat blue   = components[2];
    
    currentColor = [UIColor colorWithRed:green green:red blue:blue alpha:1];
    
    [colors addObject:currentColor];
    
    currentColor = [UIColor colorWithRed:blue green:green blue:red alpha:1];
    
    [colors addObject:currentColor];
    
    currentColor = [UIColor colorWithRed:red green:blue blue:green alpha:1];
    [colors addObject:currentColor];
    
    return colors;
}

+(NSArray *)randomColorPaletteOfMaxSixteenColors:(NSInteger)numberOfColors
{
    NSMutableArray *colors      = [NSMutableArray new];
    
    UIColor *currentColor       = [UIColor randomColor];
    
    const CGFloat *components   = CGColorGetComponents([currentColor CGColor]);
    CGFloat red                 = components[0];
    CGFloat green               = components[1];
    CGFloat blue                = components[2];
    
    for (int i = 0; i < numberOfColors; i++) {
        switch (i) {
            case 0:                                                                                                     break;
            case 1:     currentColor = [UIColor colorWithRed:green green:red blue:blue alpha:1];                        break;
            case 2:     currentColor = [UIColor colorWithRed:blue green:green blue:red alpha:1];                        break;
            case 3:     currentColor = [UIColor colorWithRed:red green:blue blue:green alpha:1];                        break;
            case 4:     currentColor = [UIColor colorWithRed:((red + green) / 2) green:green blue:blue alpha:1];        break;
            case 5:     currentColor = [UIColor colorWithRed:((red + blue) / 2) green:green blue:blue alpha:1];         break;
            case 6:     currentColor = [UIColor colorWithRed:((green + blue) / 2) green:green blue:blue alpha:1];       break;
            case 7:     currentColor = [UIColor colorWithRed:red green:((red + green) / 2) blue:blue alpha:1];          break;
            case 8:     currentColor = [UIColor colorWithRed:red green:((red + blue) / 2) blue:blue alpha:1];           break;
            case 9:     currentColor = [UIColor colorWithRed:red green:((green + blue) / 2) blue:blue alpha:1];         break;
            case 10:    currentColor = [UIColor colorWithRed:red green:green blue:((red + green) / 2) alpha:1];         break;
            case 11:    currentColor = [UIColor colorWithRed:red green:green blue:((red + blue) / 2) alpha:1];          break;
            case 12:    currentColor = [UIColor colorWithRed:red green:green blue:((green + blue) / 2) alpha:1];        break;
            case 13:    currentColor = [UIColor colorWithRed:((red + green + blue) / 3) green:green blue:blue alpha:1]; break;
            case 14:    currentColor = [UIColor colorWithRed:red green:((red + green + blue) / 3) blue:blue alpha:1];   break;
            case 15:    currentColor = [UIColor colorWithRed:red green:green blue:((red + green + blue) / 3) alpha:1];  break;
            default:
                break;
        }
        [colors addObject:currentColor];
    }

    return colors;
}

+(NSArray *)getTwelveColors
{
    return [UIColor getArrayOfTwelveColorsFromSeedColor:[UIColor randomColor]];
}

+(NSArray *)getArrayOfTwelveColorsFromSeedColor:(UIColor *)mainColor
{
    const CGFloat *components = CGColorGetComponents([mainColor CGColor]);
    CGFloat red     = components[0];
    CGFloat green   = components[1];
    CGFloat blue    = components[2];
    
    CGFloat high    = [mainColor getHigestRGBValueFromColor];
    CGFloat low     = [mainColor getLowestRGBValueFromColor];
    CGFloat mid     = [mainColor getMiddleRGBValueFromColor];
    
    NSArray *colors =  @[mainColor,
                         [UIColor  colorWithRed:green green:red blue:blue alpha:1],
                         [UIColor  colorWithRed:blue green:green blue:red alpha:1],
                         [UIColor  colorWithRed:red green:blue blue:green alpha:1],
                         
                         [UIColor  colorWithRed:high green:high blue:(low * .25) alpha:1],           //Yellow
                         [UIColor  colorWithRed:high green:(low * .25) blue:(low * .25) alpha:1],    //Red
                         [UIColor  colorWithRed:(low * .25) green:high blue:(low * .25) alpha:1],    //Green
                         [UIColor  colorWithRed:(low * .25) green:(low * .25) blue:high alpha:1],    //Blue
                         
                         [UIColor  colorWithRed:(low * .25) green:high blue:high alpha:1],           //Cyan
                         [UIColor  colorWithRed:high green:(low * .25) blue:high alpha:1],           //Megenta
                         [UIColor  colorWithRed:mid green:(low * .25) blue:mid alpha:1],             //purple
                         
                         [UIColor  colorWithRed:(((2 * high) + (2 * mid)) / 5) green:((4 * mid)/ 5) blue:(high / 5) alpha:1],  //brown
                         [UIColor  colorWithRed:high green:((high + mid)  / 3) blue:0 alpha:1]];      //Orange
    
    return colors;
}

-(UIColor *)getYellowPaletteColor
{
    CGFloat high    = [self getHigestRGBValueFromColor];
    CGFloat low     = [self getLowestRGBValueFromColor];
    
    return [UIColor  colorWithRed:high green:high blue:(low * .25) alpha:1];
}

-(UIColor *)getBrownPaletteColor
{
    CGFloat high    = [self getHigestRGBValueFromColor];
    CGFloat mid     = [self getMiddleRGBValueFromColor];
    
    return [UIColor colorWithRed:(((2 * high) + (2 * mid)) / 5) green:((4 * mid)/ 5) blue:(mid / 5) alpha:1];
}

-(UIColor *)getOrangePaletteColor
{
    CGFloat high    = [self getHigestRGBValueFromColor];
    CGFloat mid     = [self getMiddleRGBValueFromColor];

    return [UIColor  colorWithRed:high green:((high + mid)  / 3) blue:0 alpha:1];
}

-(CGFloat)getMiddleRGBValueFromColor
{
    const CGFloat *components = CGColorGetComponents([self CGColor]);
    CGFloat red     = components[0];
    CGFloat green   = components[1];
    CGFloat blue    = components[2];
    
    if (((red > green) && (red < blue)) || ((red > blue) && (red < green))) {
        return red;
    }
    if (((green > red) && (green < blue)) || ((green > blue) && (green < red))) {
        return green;
    }
    return blue;
}

-(CGFloat)getHigestRGBValueFromColor
{
    const CGFloat *components = CGColorGetComponents([self CGColor]);
    CGFloat red     = components[0];
    CGFloat green   = components[1];
    CGFloat blue    = components[2];
    
    if ((red > green) && (red > blue) ) {
        return red;
    }
    if (green > blue) {
        return green;
    }
    return blue;
}

-(CGFloat)getLowestRGBValueFromColor
{
    const CGFloat *components = CGColorGetComponents([self CGColor]);
    CGFloat red     = components[0];
    CGFloat green   = components[1];
    CGFloat blue    = components[2];
    
    if ((red < green) && (red < blue) ) {
        return red;
    }
    if (green < blue) {
        return green;
    }
    return blue;
}

+(NSArray *)getColorPaletteFromColor:(UIColor *)mainColor ofMaxSixteenColors:(NSInteger)numberOfColors
{
    NSMutableArray *colors      = [NSMutableArray new];
    
    UIColor *currentColor       = mainColor;
    
    const CGFloat *components   = CGColorGetComponents([currentColor CGColor]);
    CGFloat red                 = components[0];
    CGFloat green               = components[1];
    CGFloat blue                = components[2];
    
    for (int i = 0; i < numberOfColors; i++) {
        switch (i) {
            case 0:                                                                                                     break;
            case 1:     currentColor = [UIColor colorWithRed:green green:red blue:blue alpha:1];                        break;
            case 2:     currentColor = [UIColor colorWithRed:blue green:green blue:red alpha:1];                        break;
            case 3:     currentColor = [UIColor colorWithRed:red green:blue blue:green alpha:1];                        break;
            case 4:     currentColor = [UIColor colorWithRed:((red + green) / 2) green:green blue:blue alpha:1];        break;
            case 5:     currentColor = [UIColor colorWithRed:((red + blue) / 2) green:green blue:blue alpha:1];         break;
            case 6:     currentColor = [UIColor colorWithRed:((green + blue) / 2) green:green blue:blue alpha:1];       break;
            case 7:     currentColor = [UIColor colorWithRed:red green:((red + green) / 2) blue:blue alpha:1];          break;
            case 8:     currentColor = [UIColor colorWithRed:red green:((red + blue) / 2) blue:blue alpha:1];           break;
            case 9:     currentColor = [UIColor colorWithRed:red green:((green + blue) / 2) blue:blue alpha:1];         break;
            case 10:    currentColor = [UIColor colorWithRed:red green:green blue:((red + green) / 2) alpha:1];         break;
            case 11:    currentColor = [UIColor colorWithRed:red green:green blue:((red + blue) / 2) alpha:1];          break;
            case 12:    currentColor = [UIColor colorWithRed:red green:green blue:((green + blue) / 2) alpha:1];        break;
            case 13:    currentColor = [UIColor colorWithRed:((red + green + blue) / 3) green:green blue:blue alpha:1]; break;
            case 14:    currentColor = [UIColor colorWithRed:red green:((red + green + blue) / 3) blue:blue alpha:1];   break;
            case 15:    currentColor = [UIColor colorWithRed:red green:green blue:((red + green + blue) / 3) alpha:1];  break;
            default:
                break;
        }
        [colors addObject:currentColor];
    }
    
    return colors;
}

+(NSArray *)randomColorPaletteOfSixteenColors
{
    NSMutableArray *colors = [NSMutableArray new];
    
    UIColor *currentColor = [UIColor randomColor];
    [colors addObject:currentColor];
    
    const CGFloat *components = CGColorGetComponents([currentColor CGColor]);
    CGFloat red    = components[0];
    CGFloat green  = components[1];
    CGFloat blue   = components[2];
    
    currentColor = [UIColor colorWithRed:green green:red blue:blue alpha:1];
    [colors addObject:currentColor];
    
    currentColor = [UIColor colorWithRed:blue green:green blue:red alpha:1];
    [colors addObject:currentColor];
    
    currentColor = [UIColor colorWithRed:red green:blue blue:green alpha:1];
    [colors addObject:currentColor];
    
    currentColor = [UIColor colorWithRed:((red + green) / 2) green:green blue:blue alpha:1];
    [colors addObject:currentColor];
    
    currentColor = [UIColor colorWithRed:((red + blue) / 2) green:green blue:blue alpha:1];
    [colors addObject:currentColor];
    
    currentColor = [UIColor colorWithRed:((green + blue) / 2) green:green blue:blue alpha:1];
    [colors addObject:currentColor];
    
    currentColor = [UIColor colorWithRed:red green:((red + green) / 2) blue:blue alpha:1];
    [colors addObject:currentColor];
    
    currentColor = [UIColor colorWithRed:red green:((red + blue) / 2) blue:blue alpha:1];
    [colors addObject:currentColor];
    
    currentColor = [UIColor colorWithRed:red green:((green + blue) / 2) blue:blue alpha:1];
    [colors addObject:currentColor];
    
    currentColor = [UIColor colorWithRed:red green:green blue:((red + green) / 2) alpha:1];
    [colors addObject:currentColor];
    
    currentColor = [UIColor colorWithRed:red green:green blue:((red + blue) / 2) alpha:1];
    [colors addObject:currentColor];
    
    currentColor = [UIColor colorWithRed:red green:green blue:((green + blue) / 2) alpha:1];
    [colors addObject:currentColor];
    
    currentColor = [UIColor colorWithRed:((red + green + blue) / 3) green:green blue:blue alpha:1];
    [colors addObject:currentColor];
    
    currentColor = [UIColor colorWithRed:red green:((red + green + blue) / 3) blue:blue alpha:1];
    [colors addObject:currentColor];
    
    currentColor = [UIColor colorWithRed:red green:green blue:((red + green + blue) / 3) alpha:1];
    [colors addObject:currentColor];
    
    return colors;
}

+(BOOL)isRedVlueofColor:(UIColor *)color1 similerToRedValueOfColor:(UIColor *)color2
{
    CGFloat variance = .05;
    return [UIColor isRedValueOfColor:color1 withinVariance:variance toRedValueOfColor:color2];
}

+(BOOL)isRedValueOfColor:(UIColor *)color1 withinVariance:(CGFloat)variance toRedValueOfColor:(UIColor *)color2
{
    const CGFloat *components = CGColorGetComponents([color1 CGColor]);
    CGFloat red1   = components[0];
    
    components = CGColorGetComponents([color2 CGColor]);
    CGFloat red2   = components[0];
    
    return (abs(red1 - red2) < variance);
}

+(BOOL)isGreenVlueofColor:(UIColor *)color1 similerToGreenValueOfColor:(UIColor *)color2
{
    CGFloat variance = .05;
    return [UIColor isGreenValueOfColor:color1 withinVariance:variance toGreenValueOfColor:color2];
}

+(BOOL)isGreenValueOfColor:(UIColor *)color1 withinVariance:(CGFloat)variance toGreenValueOfColor:(UIColor *)color2
{
    const CGFloat *components = CGColorGetComponents([color1 CGColor]);
    CGFloat green1   = components[1];
    
    components = CGColorGetComponents([color2 CGColor]);
    CGFloat green2   = components[1];
    
    return (abs(green1 - green2) < variance);
}

+(BOOL)isBlueVlueofColor:(UIColor *)color1 similerToBlueValueOfColor:(UIColor *)color2
{
    CGFloat variance = .05;
    return [UIColor isBlueValueOfColor:color1 withinVariance:variance toBlueValueOfColor:color2];
}

+(BOOL)isBlueValueOfColor:(UIColor *)color1 withinVariance:(CGFloat)variance toBlueValueOfColor:(UIColor *)color2
{
    const CGFloat *components = CGColorGetComponents([color1 CGColor]);
    CGFloat blue1   = components[2];
    
    components = CGColorGetComponents([color2 CGColor]);
    CGFloat blue2   = components[2];
    
    return (abs(blue1 - blue2) < variance);
}

+(BOOL)isColor:(UIColor *)color1 withinVariance:(CGFloat)variance toColor:(UIColor *)color2
{
    const CGFloat *components = CGColorGetComponents([color1 CGColor]);
    CGFloat red1    = components[0];
    CGFloat green1  = components[1];
    CGFloat blue1   = components[2];
    CGFloat alpha1  = components[3];
    
    components = CGColorGetComponents([color2 CGColor]);
    CGFloat red2    = components[0];
    CGFloat green2  = components[1];
    CGFloat blue2   = components[2];
    CGFloat alpha2  = components[3];
    
    return ((abs(red1 - red2) < variance) && (abs(green1 - green2) < variance) && (abs(blue1 - blue2) < variance) && (abs(alpha1 - alpha2) < variance));
}

+(BOOL)isColor:(UIColor *)color1 similerToColor:(UIColor *)color2
{
    CGFloat variance = .05;
    return [UIColor isColor:color1 withinVariance:variance toColor:color2];
}

+(CGFloat)getRedAverageBetweenColor:(UIColor *)color1
                           andColor:(UIColor *)color2
{
    const CGFloat *components = CGColorGetComponents([color1 CGColor]);
    CGFloat red1    = components[0];
    
    components = CGColorGetComponents([color2 CGColor]);
    CGFloat red2    = components[0];
    
    return ((red1 + red2) / 2);
}

+(CGFloat)getGreenAverageBetweenColor:(UIColor *)color1
                            andColor:(UIColor *)color2
{
    const CGFloat *components = CGColorGetComponents([color1 CGColor]);
    CGFloat green1    = components[1];
    
    components = CGColorGetComponents([color2 CGColor]);
    CGFloat green2    = components[1];
    
    return ((green1 + green2) / 2);
}

+(CGFloat)getBlueAverageBetweenColor:(UIColor *)color1
                            andColor:(UIColor *)color2
{
    const CGFloat *components = CGColorGetComponents([color1 CGColor]);
    CGFloat blue1    = components[3];
    
    components = CGColorGetComponents([color2 CGColor]);
    CGFloat blue2    = components[3];
    
    return ((blue1 + blue2) / 2);
}

+(UIColor *)averageColorBetweenColor:(UIColor *)color1
                            andColor:(UIColor *)color2
{
    const CGFloat *components = CGColorGetComponents([color1 CGColor]);
    CGFloat red1    = components[0];
    CGFloat green1  = components[1];
    CGFloat blue1   = components[2];
    CGFloat alpha1  = components[3];
    
    components = CGColorGetComponents([color2 CGColor]);
    CGFloat red2    = components[0];
    CGFloat green2  = components[1];
    CGFloat blue2   = components[2];
    CGFloat alpha2  = components[3];
    
    return [UIColor colorWithRed:((red1 + red2) / 2) green:((green1 + green2) / 2) blue:((blue1 + blue2) / 2) alpha:((alpha1 + alpha2) / 2)];
    
}


//////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////


//The following was borrowed from https://github.com/needbee/uicolor-mix
+(UIColor *)colorBetweenColor:(UIColor *)c1
                     andColor:(UIColor *)c2
                   percentage:(float)p
{   //percentage of color2 that you want. The higher the percent the heavier it is weighted
    float p1 = 1.0 - p;
    float p2 = p;
    
    const CGFloat *components = CGColorGetComponents([c1 CGColor]);
    CGFloat r1 = components[0];
    CGFloat g1 = components[1];
    CGFloat b1 = components[2];
    CGFloat a1 = components[3];
    
    components = CGColorGetComponents([c2 CGColor]);
    CGFloat r2 = components[0];
    CGFloat g2 = components[1];
    CGFloat b2 = components[2];
    CGFloat a2 = components[3];
    
    return [UIColor colorWithRed:r1*p1 + r2*p2
                           green:g1*p1 + g2*p2
                            blue:b1*p1 + b2*p2
                           alpha:a1*p1 + a2*p2];
}


//////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////


//The following was borrowed from https://github.com/ldehai/UIColor-Categories
+(UIColor *)colorWithHexString:(NSString *)str
{   // takes @"#123456"
    const char *cStr = [str cStringUsingEncoding:NSASCIIStringEncoding];
    long x = strtol(cStr+1, NULL, 16);
    return [UIColor colorWithHex:(unsigned int)x];
}

+(UIColor *)colorWithHex:(UInt32)col
{   // takes 0x123456
    unsigned char r, g, b;
    b = col & 0xFF;
    g = (col >> 8) & 0xFF;
    r = (col >> 16) & 0xFF;
    return [UIColor colorWithRed:(float)r/255.0f green:(float)g/255.0f blue:(float)b/255.0f alpha:1];
}


//////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////


//The following was borrowed from https://github.com/mokagio/UIColor-FlatColors
+(UIColor *)flatTurquoiseColor      {return [UIColor colorWithRed:0.10196 green:0.73725 blue:0.61176 alpha:1.0];}
+(UIColor *)flatGreenSeaColor       {return [UIColor colorWithRed:0.08627 green:0.62745 blue:0.52156 alpha:1.0];}
+(UIColor *)flatEmeraldColor        {return [UIColor colorWithRed:0.18039 green:0.80000 blue:0.44313 alpha:1.0];}
+(UIColor *)flatNephritisColor      {return [UIColor colorWithRed:0.15294 green:0.68235 blue:0.37647 alpha:1.0];}
+(UIColor *)flatPeterRiverColor     {return [UIColor colorWithRed:0.20392 green:0.59607 blue:0.85882 alpha:1.0];}
+(UIColor *)flatBelizeHoleColor     {return [UIColor colorWithRed:0.16078 green:0.50196 blue:0.72549 alpha:1.0];}
+(UIColor *)flatAmethystColor       {return [UIColor colorWithRed:0.60784 green:0.34901 blue:0.71372 alpha:1.0];}
+(UIColor *)flatWisteriaColor       {return [UIColor colorWithRed:0.55686 green:0.26666 blue:0.67843 alpha:1.0];}
+(UIColor *)flatWetAsphaltColor     {return [UIColor colorWithRed:0.20392 green:0.28627 blue:0.36862 alpha:1.0];}
+(UIColor *)flatMidnightBlueColor   {return [UIColor colorWithRed:0.17254 green:0.24313 blue:0.31372 alpha:1.0];}
+(UIColor *)flatSunFlowerColor      {return [UIColor colorWithRed:0.94509 green:0.76862 blue:0.05882 alpha:1.0];}
+(UIColor *)flatOrangeColor         {return [UIColor colorWithRed:0.95294 green:0.61176 blue:0.07058 alpha:1.0];}
+(UIColor *)flatCarrotColor         {return [UIColor colorWithRed:0.90196 green:0.49411 blue:0.13333 alpha:1.0];}
+(UIColor *)flatPumpkinColor        {return [UIColor colorWithRed:0.82745 green:0.32941 blue:0.00000 alpha:1.0];}
+(UIColor *)flatAlizarinColor       {return [UIColor colorWithRed:0.90588 green:0.29803 blue:0.23529 alpha:1.0];}
+(UIColor *)flatPomegranateColor    {return [UIColor colorWithRed:0.75294 green:0.22352 blue:0.16862 alpha:1.0];}
+(UIColor *)flatCloudsColor         {return [UIColor colorWithRed:0.92549 green:0.94117 blue:0.94509 alpha:1.0];}
+(UIColor *)flatSilverColor         {return [UIColor colorWithRed:0.74117 green:0.76470 blue:0.78039 alpha:1.0];}
+(UIColor *)flatConcreteColor       {return [UIColor colorWithRed:0.58431 green:0.64705 blue:0.65098 alpha:1.0];}
+(UIColor *)flatAsbestosColor       {return [UIColor colorWithRed:0.49803 green:0.54901 blue:0.55294 alpha:1.0];}


//////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////


//The following was borrowed from https://github.com/CaptainRedmuff/UIColor-Crayola
+(UIColor *)AbsoluteZeroColor           {return [UIColor colorWithRed:0.000 green:0.282 blue:0.729 alpha:1.0];}
+(UIColor *)AlienArmpitColor            {return [UIColor colorWithRed:0.518 green:0.871 blue:0.008 alpha:1.0];}
+(UIColor *)AlloyOrangeColor            {return [UIColor colorWithRed:0.769 green:0.384 blue:0.063 alpha:1.0];}
+(UIColor *)AlmondColor                 {return [UIColor colorWithRed:0.937 green:0.871 blue:0.804 alpha:1.0];}
+(UIColor *)AmethystColor               {return [UIColor colorWithRed:0.392 green:0.376 blue:0.604 alpha:1.0];}
+(UIColor *)AntiqueBrassColor           {return [UIColor colorWithRed:0.804 green:0.584 blue:0.459 alpha:1.0];}
+(UIColor *)ApricotColor                {return [UIColor colorWithRed:0.992 green:0.851 blue:0.710 alpha:1.0];}
+(UIColor *)AquaPearlColor              {return [UIColor colorWithRed:0.373 green:0.745 blue:0.843 alpha:1.0];}
+(UIColor *)AquamarineColor             {return [UIColor colorWithRed:0.471 green:0.859 blue:0.886 alpha:1.0];}
+(UIColor *)AsparagusColor              {return [UIColor colorWithRed:0.529 green:0.663 blue:0.420 alpha:1.0];}
+(UIColor *)AtomicTangerineColor        {return [UIColor colorWithRed:1.000 green:0.643 blue:0.455 alpha:1.0];}
+(UIColor *)AztecGoldColor              {return [UIColor colorWithRed:0.765 green:0.600 blue:0.325 alpha:1.0];}
+(UIColor *)BabyPowderColor             {return [UIColor colorWithRed:0.996 green:0.996 blue:0.980 alpha:1.0];}
+(UIColor *)BananaColor                 {return [UIColor colorWithRed:1.000 green:0.820 blue:0.165 alpha:1.0];}
+(UIColor *)BananaManiaColor            {return [UIColor colorWithRed:0.980 green:0.906 blue:0.710 alpha:1.0];}
+(UIColor *)BdazzledBlueColor           {return [UIColor colorWithRed:0.180 green:0.345 blue:0.580 alpha:1.0];}
+(UIColor *)BeaverColor                 {return [UIColor colorWithRed:0.624 green:0.506 blue:0.439 alpha:1.0];}
+(UIColor *)BigDipORubyColor            {return [UIColor colorWithRed:0.612 green:0.145 blue:0.259 alpha:1.0];}
+(UIColor *)BigFootFeetColor            {return [UIColor colorWithRed:0.910 green:0.557 blue:0.353 alpha:1.0];}
+(UIColor *)BittersweetColor            {return [UIColor colorWithRed:0.992 green:0.486 blue:0.431 alpha:1.0];}
+(UIColor *)BittersweetShimmerColor     {return [UIColor colorWithRed:0.749 green:0.310 blue:0.318 alpha:1.0];}
+(UIColor *)BlackCoralPearlColor        {return [UIColor colorWithRed:0.329 green:0.384 blue:0.435 alpha:1.0];}
+(UIColor *)BlackShadowsColor           {return [UIColor colorWithRed:0.749 green:0.686 blue:0.698 alpha:1.0];}
+(UIColor *)BlastOffBronzeColor         {return [UIColor colorWithRed:0.647 green:0.443 blue:0.392 alpha:1.0];}
+(UIColor *)BlizzardBlueColor           {return [UIColor colorWithRed:0.675 green:0.898 blue:0.933 alpha:1.0];}
+(UIColor *)BlueColor2                  {return [UIColor colorWithRed:0.122 green:0.459 blue:0.996 alpha:1.0];}
+(UIColor *)BlueBellColor               {return [UIColor colorWithRed:0.635 green:0.635 blue:0.816 alpha:1.0];}
+(UIColor *)BlueGrayColor               {return [UIColor colorWithRed:0.400 green:0.600 blue:0.800 alpha:1.0];}
+(UIColor *)BlueGreenColor              {return [UIColor colorWithRed:0.051 green:0.596 blue:0.729 alpha:1.0];}
+(UIColor *)BlueJeansColor              {return [UIColor colorWithRed:0.365 green:0.678 blue:0.925 alpha:1.0];}
+(UIColor *)BlueVioletColor             {return [UIColor colorWithRed:0.451 green:0.400 blue:0.741 alpha:1.0];}
+(UIColor *)BlueberryColor              {return [UIColor colorWithRed:0.310 green:0.525 blue:0.969 alpha:1.0];}
+(UIColor *)BlushColor                  {return [UIColor colorWithRed:0.871 green:0.365 blue:0.514 alpha:1.0];}
+(UIColor *)BoogerBusterColor           {return [UIColor colorWithRed:0.867 green:0.886 blue:0.416 alpha:1.0];}
+(UIColor *)BrickRedColor               {return [UIColor colorWithRed:0.796 green:0.255 blue:0.329 alpha:1.0];}
+(UIColor *)BrightYellowColor           {return [UIColor colorWithRed:1.000 green:0.667 blue:0.114 alpha:1.0];}
+(UIColor *)BrownColor2                 {return [UIColor colorWithRed:0.706 green:0.404 blue:0.302 alpha:1.0];}
+(UIColor *)BrownSugarColor             {return [UIColor colorWithRed:0.686 green:0.431 blue:0.302 alpha:1.0];}
+(UIColor *)BubbleGumColor              {return [UIColor colorWithRed:1.000 green:0.827 blue:0.973 alpha:1.0];}
+(UIColor *)BurnishedBrownColor         {return [UIColor colorWithRed:0.631 green:0.478 blue:0.455 alpha:1.0];}
+(UIColor *)BurntOrangeColor            {return [UIColor colorWithRed:1.000 green:0.498 blue:0.286 alpha:1.0];}
+(UIColor *)BurntSiennaColor            {return [UIColor colorWithRed:0.918 green:0.494 blue:0.365 alpha:1.0];}
+(UIColor *)CadetBlueColor              {return [UIColor colorWithRed:0.690 green:0.718 blue:0.776 alpha:1.0];}
+(UIColor *)CanaryColor                 {return [UIColor colorWithRed:1.000 green:1.000 blue:0.600 alpha:1.0];}
+(UIColor *)CaribbeanGreenColor         {return [UIColor colorWithRed:0.110 green:0.827 blue:0.635 alpha:1.0];}
+(UIColor *)CaribbeanGreenPearlColor    {return [UIColor colorWithRed:0.416 green:0.855 blue:0.557 alpha:1.0];}
+(UIColor *)CarnationPinkColor          {return [UIColor colorWithRed:1.000 green:0.667 blue:0.800 alpha:1.0];}
+(UIColor *)CedarChestColor             {return [UIColor colorWithRed:0.788 green:0.353 blue:0.286 alpha:1.0];}
+(UIColor *)CeriseColor                 {return [UIColor colorWithRed:0.867 green:0.267 blue:0.573 alpha:1.0];}
+(UIColor *)CeruleanColor               {return [UIColor colorWithRed:0.114 green:0.675 blue:0.839 alpha:1.0];}
+(UIColor *)CeruleanFrostColor          {return [UIColor colorWithRed:0.427 green:0.608 blue:0.765 alpha:1.0];}
+(UIColor *)CherryColor                 {return [UIColor colorWithRed:0.855 green:0.149 blue:0.278 alpha:1.0];}
+(UIColor *)ChestnutColor               {return [UIColor colorWithRed:0.737 green:0.365 blue:0.345 alpha:1.0];}
+(UIColor *)ChocolateColor              {return [UIColor colorWithRed:0.741 green:0.510 blue:0.376 alpha:1.0];}
+(UIColor *)CinnamonSatinColor          {return [UIColor colorWithRed:0.804 green:0.376 blue:0.494 alpha:1.0];}
+(UIColor *)CitrineColor                {return [UIColor colorWithRed:0.576 green:0.216 blue:0.035 alpha:1.0];}
+(UIColor *)CoconutColor                {return [UIColor colorWithRed:0.996 green:0.996 blue:0.996 alpha:1.0];}
+(UIColor *)CopperColor                 {return [UIColor colorWithRed:0.867 green:0.580 blue:0.459 alpha:1.0];}
+(UIColor *)CopperPennyColor            {return [UIColor colorWithRed:0.678 green:0.435 blue:0.412 alpha:1.0];}
+(UIColor *)CornflowerColor             {return [UIColor colorWithRed:0.604 green:0.808 blue:0.922 alpha:1.0];}
+(UIColor *)CosmicCobaltColor           {return [UIColor colorWithRed:0.180 green:0.176 blue:0.533 alpha:1.0];}
+(UIColor *)CottonCandyColor            {return [UIColor colorWithRed:1.000 green:0.737 blue:0.851 alpha:1.0];}
+(UIColor *)CulturedPearlColor          {return [UIColor colorWithRed:0.961 green:0.961 blue:0.961 alpha:1.0];}
+(UIColor *)CyberGrapeColor             {return [UIColor colorWithRed:0.345 green:0.259 blue:0.486 alpha:1.0];}
+(UIColor *)DaffodilColor               {return [UIColor colorWithRed:1.000 green:1.000 blue:0.192 alpha:1.0];}
+(UIColor *)DandelionColor              {return [UIColor colorWithRed:0.992 green:0.859 blue:0.427 alpha:1.0];}
+(UIColor *)DeepSpaceSparkleColor       {return [UIColor colorWithRed:0.290 green:0.392 blue:0.424 alpha:1.0];}
+(UIColor *)DenimColor                  {return [UIColor colorWithRed:0.169 green:0.424 blue:0.769 alpha:1.0];}
+(UIColor *)DenimBlueColor              {return [UIColor colorWithRed:0.133 green:0.263 blue:0.714 alpha:1.0];}
+(UIColor *)DesertSandColor             {return [UIColor colorWithRed:0.937 green:0.804 blue:0.722 alpha:1.0];}
+(UIColor *)DingyDungeonColor           {return [UIColor colorWithRed:0.773 green:0.192 blue:0.318 alpha:1.0];}
+(UIColor *)DirtColor                   {return [UIColor colorWithRed:0.608 green:0.463 blue:0.325 alpha:1.0];}
+(UIColor *)EerieBlackColor             {return [UIColor colorWithRed:0.106 green:0.106 blue:0.106 alpha:1.0];}
+(UIColor *)EggplantColor               {return [UIColor colorWithRed:0.431 green:0.318 blue:0.376 alpha:1.0];}
+(UIColor *)ElectricLimeColor           {return [UIColor colorWithRed:0.808 green:1.000 blue:0.114 alpha:1.0];}
+(UIColor *)EmeraldColor                {return [UIColor colorWithRed:0.078 green:0.663 blue:0.537 alpha:1.0];}
+(UIColor *)EucalyptusColor             {return [UIColor colorWithRed:0.267 green:0.843 blue:0.659 alpha:1.0];}
+(UIColor *)FernColor                   {return [UIColor colorWithRed:0.443 green:0.737 blue:0.471 alpha:1.0];}
+(UIColor *)FieryRoseColor              {return [UIColor colorWithRed:1.000 green:0.329 blue:0.439 alpha:1.0];}
+(UIColor *)ForestGreenColor            {return [UIColor colorWithRed:0.427 green:0.682 blue:0.506 alpha:1.0];}
+(UIColor *)FreshAirColor               {return [UIColor colorWithRed:0.651 green:0.906 blue:1.000 alpha:1.0];}
+(UIColor *)FrostbiteColor              {return [UIColor colorWithRed:0.914 green:0.212 blue:0.655 alpha:1.0];}
+(UIColor *)FuchsiaColor                {return [UIColor colorWithRed:0.765 green:0.392 blue:0.773 alpha:1.0];}
+(UIColor *)FuzzyWuzzyColor             {return [UIColor colorWithRed:0.800 green:0.400 blue:0.400 alpha:1.0];}
+(UIColor *)GargoyleGasColor            {return [UIColor colorWithRed:1.000 green:0.875 blue:0.275 alpha:1.0];}
+(UIColor *)GiantsClubColor             {return [UIColor colorWithRed:0.690 green:0.361 blue:0.322 alpha:1.0];}
+(UIColor *)GlossyGrapeColor            {return [UIColor colorWithRed:0.671 green:0.573 blue:0.702 alpha:1.0];}
+(UIColor *)GoldColor                   {return [UIColor colorWithRed:0.906 green:0.776 blue:0.592 alpha:1.0];}
+(UIColor *)GoldFusionColor             {return [UIColor colorWithRed:0.522 green:0.459 blue:0.306 alpha:1.0];}
+(UIColor *)GoldenrodColor              {return [UIColor colorWithRed:0.988 green:0.851 blue:0.459 alpha:1.0];}
+(UIColor *)GraniteGrayColor            {return [UIColor colorWithRed:0.404 green:0.404 blue:0.404 alpha:1.0];}
+(UIColor *)GrannySmithAppleColor       {return [UIColor colorWithRed:0.659 green:0.894 blue:0.627 alpha:1.0];}
+(UIColor *)GrapeColor                  {return [UIColor colorWithRed:0.435 green:0.176 blue:0.659 alpha:1.0];}
+(UIColor *)GrayColor2                  {return [UIColor colorWithRed:0.584 green:0.569 blue:0.549 alpha:1.0];}
+(UIColor *)GreenColor2                 {return [UIColor colorWithRed:0.110 green:0.675 blue:0.471 alpha:1.0];}
+(UIColor *)GreenBlueColor              {return [UIColor colorWithRed:0.067 green:0.392 blue:0.706 alpha:1.0];}
+(UIColor *)GreenLizardColor            {return [UIColor colorWithRed:0.655 green:0.957 blue:0.196 alpha:1.0];}
+(UIColor *)GreenSheenColor             {return [UIColor colorWithRed:0.431 green:0.682 blue:0.631 alpha:1.0];}
+(UIColor *)GreenYellowColor            {return [UIColor colorWithRed:0.941 green:0.910 blue:0.569 alpha:1.0];}
+(UIColor *)HeatWaveColor               {return [UIColor colorWithRed:1.000 green:0.478 blue:0.000 alpha:1.0];}
+(UIColor *)HotMagentaColor             {return [UIColor colorWithRed:1.000 green:0.114 blue:0.808 alpha:1.0];}
+(UIColor *)IlluminatingEmeraldColor    {return [UIColor colorWithRed:0.192 green:0.569 blue:0.467 alpha:1.0];}
+(UIColor *)InchwormColor               {return [UIColor colorWithRed:0.698 green:0.925 blue:0.365 alpha:1.0];}
+(UIColor *)IndigoColor                 {return [UIColor colorWithRed:0.365 green:0.463 blue:0.796 alpha:1.0];}
+(UIColor *)JadeColor                   {return [UIColor colorWithRed:0.275 green:0.604 blue:0.518 alpha:1.0];}
+(UIColor *)JasperColor                 {return [UIColor colorWithRed:0.816 green:0.325 blue:0.251 alpha:1.0];}
+(UIColor *)JazzberryJamColor           {return [UIColor colorWithRed:0.792 green:0.216 blue:0.404 alpha:1.0];}
+(UIColor *)JellyBeanColor              {return [UIColor colorWithRed:0.855 green:0.380 blue:0.306 alpha:1.0];}
+(UIColor *)JungleGreenColor            {return [UIColor colorWithRed:0.231 green:0.690 blue:0.561 alpha:1.0];}
+(UIColor *)KeyLimePearlColor           {return [UIColor colorWithRed:0.910 green:0.957 blue:0.549 alpha:1.0];}
+(UIColor *)LapisLazuliColor            {return [UIColor colorWithRed:0.263 green:0.424 blue:0.725 alpha:1.0];}
+(UIColor *)LaserLemonColor             {return [UIColor colorWithRed:0.996 green:0.996 blue:0.133 alpha:1.0];}
+(UIColor *)LavenderColor               {return [UIColor colorWithRed:0.988 green:0.706 blue:0.835 alpha:1.0];}
+(UIColor *)LeatherJacketColor          {return [UIColor colorWithRed:0.145 green:0.208 blue:0.161 alpha:1.0];}
+(UIColor *)LemonColor                  {return [UIColor colorWithRed:1.000 green:1.000 blue:0.220 alpha:1.0];}
+(UIColor *)LemonGlacierColor           {return [UIColor colorWithRed:0.992 green:1.000 blue:0.000 alpha:1.0];}
+(UIColor *)LemonYellowColor            {return [UIColor colorWithRed:1.000 green:0.957 blue:0.310 alpha:1.0];}
+(UIColor *)LicoriceColor               {return [UIColor colorWithRed:0.102 green:0.067 blue:0.063 alpha:1.0];}
+(UIColor *)LilacColor                  {return [UIColor colorWithRed:0.859 green:0.569 blue:0.937 alpha:1.0];}
+(UIColor *)LilacLusterColor            {return [UIColor colorWithRed:0.682 green:0.596 blue:0.667 alpha:1.0];}
+(UIColor *)LimeColor                   {return [UIColor colorWithRed:0.698 green:0.953 blue:0.008 alpha:1.0];}
+(UIColor *)LumberColor                 {return [UIColor colorWithRed:1.000 green:0.894 blue:0.804 alpha:1.0];}
+(UIColor *)MacaroniCheeseColor         {return [UIColor colorWithRed:1.000 green:0.741 blue:0.533 alpha:1.0];}
+(UIColor *)MagentaColor2               {return [UIColor colorWithRed:0.965 green:0.392 blue:0.686 alpha:1.0];}
+(UIColor *)MagicMintColor              {return [UIColor colorWithRed:0.667 green:0.941 blue:0.820 alpha:1.0];}
+(UIColor *)MagicPotionColor            {return [UIColor colorWithRed:1.000 green:0.267 blue:0.400 alpha:1.0];}
+(UIColor *)MahoganyColor               {return [UIColor colorWithRed:0.804 green:0.290 blue:0.298 alpha:1.0];}
+(UIColor *)MaizeColor                  {return [UIColor colorWithRed:0.929 green:0.820 blue:0.612 alpha:1.0];}
+(UIColor *)MalachiteColor              {return [UIColor colorWithRed:0.275 green:0.580 blue:0.588 alpha:1.0];}
+(UIColor *)ManateeColor                {return [UIColor colorWithRed:0.592 green:0.604 blue:0.667 alpha:1.0];}
+(UIColor *)MandarinPearlColor          {return [UIColor colorWithRed:0.953 green:0.478 blue:0.282 alpha:1.0];}
+(UIColor *)MangoTangoColor             {return [UIColor colorWithRed:1.000 green:0.510 blue:0.263 alpha:1.0];}
+(UIColor *)MaroonColor                 {return [UIColor colorWithRed:0.784 green:0.220 blue:0.353 alpha:1.0];}
+(UIColor *)MauvelousColor              {return [UIColor colorWithRed:0.937 green:0.596 blue:0.667 alpha:1.0];}
+(UIColor *)MelonColor                  {return [UIColor colorWithRed:0.992 green:0.737 blue:0.706 alpha:1.0];}
+(UIColor *)MetallicSeaweedColor        {return [UIColor colorWithRed:0.039 green:0.494 blue:0.549 alpha:1.0];}
+(UIColor *)MetallicSunburstColor       {return [UIColor colorWithRed:0.612 green:0.486 blue:0.220 alpha:1.0];}
+(UIColor *)MidnightBlueColor           {return [UIColor colorWithRed:0.102 green:0.282 blue:0.463 alpha:1.0];}
+(UIColor *)MidnightPearlColor          {return [UIColor colorWithRed:0.439 green:0.149 blue:0.439 alpha:1.0];}
+(UIColor *)MistyMossColor              {return [UIColor colorWithRed:0.733 green:0.706 blue:0.467 alpha:1.0];}
+(UIColor *)MoonstoneColor              {return [UIColor colorWithRed:0.227 green:0.659 blue:0.757 alpha:1.0];}
+(UIColor *)MountainMeadowColor         {return [UIColor colorWithRed:0.188 green:0.729 blue:0.561 alpha:1.0];}
+(UIColor *)MulberryColor               {return [UIColor colorWithRed:0.773 green:0.294 blue:0.549 alpha:1.0];}
+(UIColor *)MummysTombColor             {return [UIColor colorWithRed:0.510 green:0.557 blue:0.518 alpha:1.0];}
+(UIColor *)MysticMaroonColor           {return [UIColor colorWithRed:0.678 green:0.263 blue:0.475 alpha:1.0];}
+(UIColor *)MysticPearlColor            {return [UIColor colorWithRed:0.839 green:0.322 blue:0.510 alpha:1.0];}
+(UIColor *)NavyBlueColor               {return [UIColor colorWithRed:0.098 green:0.455 blue:0.824 alpha:1.0];}
+(UIColor *)NeonCarrotColor             {return [UIColor colorWithRed:1.000 green:0.639 blue:0.263 alpha:1.0];}
+(UIColor *)NewCarColor                 {return [UIColor colorWithRed:0.129 green:0.310 blue:0.776 alpha:1.0];}
+(UIColor *)OceanBluePearlColor         {return [UIColor colorWithRed:0.310 green:0.259 blue:0.710 alpha:1.0];}
+(UIColor *)OceanGreenPearlColor        {return [UIColor colorWithRed:0.282 green:0.749 blue:0.569 alpha:1.0];}
+(UIColor *)OgreOdorColor               {return [UIColor colorWithRed:0.992 green:0.322 blue:0.251 alpha:1.0];}
+(UIColor *)OliveGreenColor             {return [UIColor colorWithRed:0.729 green:0.722 blue:0.424 alpha:1.0];}
+(UIColor *)OnyxColor                   {return [UIColor colorWithRed:0.208 green:0.220 blue:0.224 alpha:1.0];}
+(UIColor *)OrangeColor2                {return [UIColor colorWithRed:1.000 green:0.459 blue:0.220 alpha:1.0];}
+(UIColor *)OrangeRedColor              {return [UIColor colorWithRed:1.000 green:0.169 blue:0.169 alpha:1.0];}
+(UIColor *)OrangeSodaColor             {return [UIColor colorWithRed:0.980 green:0.357 blue:0.239 alpha:1.0];}
+(UIColor *)OrangeYellowColor           {return [UIColor colorWithRed:0.973 green:0.835 blue:0.408 alpha:1.0];}
+(UIColor *)OrchidColor                 {return [UIColor colorWithRed:0.902 green:0.659 blue:0.843 alpha:1.0];}
+(UIColor *)OrchidPearlColor            {return [UIColor colorWithRed:0.482 green:0.259 blue:0.349 alpha:1.0];}
+(UIColor *)OuterSpaceColor             {return [UIColor colorWithRed:0.255 green:0.290 blue:0.298 alpha:1.0];}
+(UIColor *)OutrageousOrangeColor       {return [UIColor colorWithRed:1.000 green:0.431 blue:0.290 alpha:1.0];}
+(UIColor *)PacificBlueColor            {return [UIColor colorWithRed:0.110 green:0.663 blue:0.788 alpha:1.0];}
+(UIColor *)PeachColor                  {return [UIColor colorWithRed:1.000 green:0.812 blue:0.671 alpha:1.0];}
+(UIColor *)PearlyPurpleColor           {return [UIColor colorWithRed:0.718 green:0.408 blue:0.635 alpha:1.0];}
+(UIColor *)PeridotColor                {return [UIColor colorWithRed:0.671 green:0.678 blue:0.282 alpha:1.0];}
+(UIColor *)PeriwinkleColor             {return [UIColor colorWithRed:0.773 green:0.816 blue:0.902 alpha:1.0];}
+(UIColor *)PewterBlueColor             {return [UIColor colorWithRed:0.545 green:0.659 blue:0.718 alpha:1.0];}
+(UIColor *)PiggyPinkColor              {return [UIColor colorWithRed:0.992 green:0.867 blue:0.902 alpha:1.0];}
+(UIColor *)PineColor                   {return [UIColor colorWithRed:0.271 green:0.635 blue:0.490 alpha:1.0];}
+(UIColor *)PineGreenColor              {return [UIColor colorWithRed:0.082 green:0.502 blue:0.471 alpha:1.0];}
+(UIColor *)PinkFlamingoColor           {return [UIColor colorWithRed:0.988 green:0.455 blue:0.992 alpha:1.0];}
+(UIColor *)PinkPearlColor              {return [UIColor colorWithRed:0.690 green:0.439 blue:0.502 alpha:1.0];}
+(UIColor *)PinkSherbertColor           {return [UIColor colorWithRed:0.969 green:0.561 blue:0.655 alpha:1.0];}
+(UIColor *)PixiePowderColor            {return [UIColor colorWithRed:0.224 green:0.071 blue:0.522 alpha:1.0];}
+(UIColor *)PlumColor                   {return [UIColor colorWithRed:0.557 green:0.271 blue:0.522 alpha:1.0];}
+(UIColor *)PlumpPurpleColor            {return [UIColor colorWithRed:0.349 green:0.275 blue:0.698 alpha:1.0];}
+(UIColor *)PolishedPineColor           {return [UIColor colorWithRed:0.365 green:0.643 blue:0.576 alpha:1.0];}
+(UIColor *)PrincessPerfumeColor        {return [UIColor colorWithRed:1.000 green:0.522 blue:0.812 alpha:1.0];}
+(UIColor *)PurpleHeartColor            {return [UIColor colorWithRed:0.455 green:0.259 blue:0.784 alpha:1.0];}
+(UIColor *)PurpleMountainsMajestyColor {return [UIColor colorWithRed:0.616 green:0.506 blue:0.729 alpha:1.0];}
+(UIColor *)PurplePizzazzColor          {return [UIColor colorWithRed:0.996 green:0.306 blue:0.855 alpha:1.0];}
+(UIColor *)PurplePlumColor             {return [UIColor colorWithRed:0.612 green:0.318 blue:0.714 alpha:1.0];}
+(UIColor *)QuickSilverColor            {return [UIColor colorWithRed:0.651 green:0.651 blue:0.651 alpha:1.0];}
+(UIColor *)RadicalRedColor             {return [UIColor colorWithRed:1.000 green:0.286 blue:0.424 alpha:1.0];}
+(UIColor *)RawSiennaColor              {return [UIColor colorWithRed:0.839 green:0.541 blue:0.349 alpha:1.0];}
+(UIColor *)RawUmberColor               {return [UIColor colorWithRed:0.443 green:0.294 blue:0.137 alpha:1.0];}
+(UIColor *)RazzleDazzleRoseColor       {return [UIColor colorWithRed:1.000 green:0.282 blue:0.816 alpha:1.0];}
+(UIColor *)RazzmatazzColor             {return [UIColor colorWithRed:0.890 green:0.145 blue:0.420 alpha:1.0];}
+(UIColor *)RazzmicBerryColor           {return [UIColor colorWithRed:0.553 green:0.306 blue:0.522 alpha:1.0];}
+(UIColor *)RedColor2                   {return [UIColor colorWithRed:0.933 green:0.125 blue:0.302 alpha:1.0];}
+(UIColor *)RedOrangeColor              {return [UIColor colorWithRed:1.000 green:0.325 blue:0.286 alpha:1.0];}
+(UIColor *)RedSalsaColor               {return [UIColor colorWithRed:0.992 green:0.227 blue:0.290 alpha:1.0];}
+(UIColor *)RedVioletColor              {return [UIColor colorWithRed:0.753 green:0.267 blue:0.561 alpha:1.0];}
+(UIColor *)RobinsEggBlueColor          {return [UIColor colorWithRed:0.122 green:0.808 blue:0.796 alpha:1.0];}
+(UIColor *)RoseColor                   {return [UIColor colorWithRed:1.000 green:0.314 blue:0.314 alpha:1.0];}
+(UIColor *)RoseDustColor               {return [UIColor colorWithRed:0.620 green:0.369 blue:0.435 alpha:1.0];}
+(UIColor *)RosePearlColor              {return [UIColor colorWithRed:0.941 green:0.220 blue:0.396 alpha:1.0];}
+(UIColor *)RoseQuartzColor             {return [UIColor colorWithRed:0.741 green:0.333 blue:0.612 alpha:1.0];}
+(UIColor *)RoyalPurpleColor            {return [UIColor colorWithRed:0.471 green:0.318 blue:0.663 alpha:1.0];}
+(UIColor *)RubyColor                   {return [UIColor colorWithRed:0.667 green:0.251 blue:0.412 alpha:1.0];}
+(UIColor *)RustyRedColor               {return [UIColor colorWithRed:0.855 green:0.173 blue:0.263 alpha:1.0];}
+(UIColor *)SalmonColor                 {return [UIColor colorWithRed:1.000 green:0.608 blue:0.667 alpha:1.0];}
+(UIColor *)SalmonPearlColor            {return [UIColor colorWithRed:0.945 green:0.267 blue:0.290 alpha:1.0];}
+(UIColor *)SapphireColor               {return [UIColor colorWithRed:0.176 green:0.365 blue:0.631 alpha:1.0];}
+(UIColor *)SasquatchSocksColor         {return [UIColor colorWithRed:1.000 green:0.275 blue:0.506 alpha:1.0];}
+(UIColor *)ScarletColor                {return [UIColor colorWithRed:0.988 green:0.157 blue:0.278 alpha:1.0];}
+(UIColor *)ScreaminGreenColor          {return [UIColor colorWithRed:0.463 green:1.000 blue:0.478 alpha:1.0];}
+(UIColor *)SeaGreenColor               {return [UIColor colorWithRed:0.624 green:0.886 blue:0.749 alpha:1.0];}
+(UIColor *)SeaSerpentColor             {return [UIColor colorWithRed:0.294 green:0.780 blue:0.812 alpha:1.0];}
+(UIColor *)SepiaColor                  {return [UIColor colorWithRed:0.647 green:0.412 blue:0.310 alpha:1.0];}
+(UIColor *)ShadowColor                 {return [UIColor colorWithRed:0.541 green:0.475 blue:0.365 alpha:1.0];}
+(UIColor *)ShadowBlueColor             {return [UIColor colorWithRed:0.467 green:0.545 blue:0.647 alpha:1.0];}
+(UIColor *)ShampooColor                {return [UIColor colorWithRed:1.000 green:0.812 blue:0.945 alpha:1.0];}
+(UIColor *)ShamrockColor               {return [UIColor colorWithRed:0.271 green:0.808 blue:0.635 alpha:1.0];}
+(UIColor *)SheenGreenColor             {return [UIColor colorWithRed:0.561 green:0.831 blue:0.000 alpha:1.0];}
+(UIColor *)ShimmeringBlushColor        {return [UIColor colorWithRed:0.851 green:0.525 blue:0.584 alpha:1.0];}
+(UIColor *)ShinyShamrockColor          {return [UIColor colorWithRed:0.373 green:0.655 blue:0.471 alpha:1.0];}
+(UIColor *)ShockingPinkColor           {return [UIColor colorWithRed:0.984 green:0.494 blue:0.992 alpha:1.0];}
+(UIColor *)SilverColor                 {return [UIColor colorWithRed:0.804 green:0.773 blue:0.761 alpha:1.0];}
+(UIColor *)SizzlingRedColor            {return [UIColor colorWithRed:1.000 green:0.220 blue:0.333 alpha:1.0];}
+(UIColor *)SizzlingSunriseColor        {return [UIColor colorWithRed:1.000 green:0.859 blue:0.000 alpha:1.0];}
+(UIColor *)SkyBlueColor                {return [UIColor colorWithRed:0.502 green:0.855 blue:0.922 alpha:1.0];}
+(UIColor *)SlimyGreenColor             {return [UIColor colorWithRed:0.161 green:0.588 blue:0.090 alpha:1.0];}
+(UIColor *)SmashedPumpkinColor         {return [UIColor colorWithRed:1.000 green:0.427 blue:0.227 alpha:1.0];}
+(UIColor *)SmokeColor                  {return [UIColor colorWithRed:0.451 green:0.510 blue:0.463 alpha:1.0];}
+(UIColor *)SmokeyTopazColor            {return [UIColor colorWithRed:0.514 green:0.165 blue:0.051 alpha:1.0];}
+(UIColor *)SoapColor                   {return [UIColor colorWithRed:0.808 green:0.784 blue:0.937 alpha:1.0];}
+(UIColor *)SonicSilverColor            {return [UIColor colorWithRed:0.459 green:0.459 blue:0.459 alpha:1.0];}
+(UIColor *)SpringFrostColor            {return [UIColor colorWithRed:0.529 green:1.000 blue:0.165 alpha:1.0];}
+(UIColor *)SpringGreenColor            {return [UIColor colorWithRed:0.925 green:0.918 blue:0.745 alpha:1.0];}
+(UIColor *)SteelBlueColor              {return [UIColor colorWithRed:0.000 green:0.506 blue:0.671 alpha:1.0];}
+(UIColor *)SteelTealColor              {return [UIColor colorWithRed:0.373 green:0.541 blue:0.545 alpha:1.0];}
+(UIColor *)StrawberryColor             {return [UIColor colorWithRed:0.988 green:0.353 blue:0.553 alpha:1.0];}
+(UIColor *)SugarPlumColor              {return [UIColor colorWithRed:0.569 green:0.306 blue:0.459 alpha:1.0];}
+(UIColor *)SunburntCyclopsColor        {return [UIColor colorWithRed:1.000 green:0.251 blue:0.298 alpha:1.0];}
+(UIColor *)SunglowColor                {return [UIColor colorWithRed:1.000 green:0.812 blue:0.282 alpha:1.0];}
+(UIColor *)SunnyPearlColor             {return [UIColor colorWithRed:0.949 green:0.949 blue:0.478 alpha:1.0];}
+(UIColor *)SunsetOrangeColor           {return [UIColor colorWithRed:0.992 green:0.369 blue:0.325 alpha:1.0];}
+(UIColor *)SunsetPearlColor            {return [UIColor colorWithRed:0.945 green:0.800 blue:0.475 alpha:1.0];}
+(UIColor *)SweetBrownColor             {return [UIColor colorWithRed:0.659 green:0.216 blue:0.192 alpha:1.0];}
+(UIColor *)TanColor                    {return [UIColor colorWithRed:0.980 green:0.655 blue:0.424 alpha:1.0];}
+(UIColor *)TartOrangeColor             {return [UIColor colorWithRed:0.984 green:0.302 blue:0.275 alpha:1.0];}
+(UIColor *)TealBlueColor               {return [UIColor colorWithRed:0.094 green:0.655 blue:0.710 alpha:1.0];}
+(UIColor *)ThistleColor                {return [UIColor colorWithRed:0.922 green:0.780 blue:0.875 alpha:1.0];}
+(UIColor *)TickleMePinkColor           {return [UIColor colorWithRed:0.988 green:0.537 blue:0.675 alpha:1.0];}
+(UIColor *)TigersEyeColor              {return [UIColor colorWithRed:0.710 green:0.412 blue:0.090 alpha:1.0];}
+(UIColor *)TimberwolfColor             {return [UIColor colorWithRed:0.859 green:0.843 blue:0.824 alpha:1.0];}
+(UIColor *)TropicalRainForestColor     {return [UIColor colorWithRed:0.090 green:0.502 blue:0.427 alpha:1.0];}
+(UIColor *)TulipColor                  {return [UIColor colorWithRed:1.000 green:0.529 blue:0.553 alpha:1.0];}
+(UIColor *)TumbleweedColor             {return [UIColor colorWithRed:0.871 green:0.667 blue:0.533 alpha:1.0];}
+(UIColor *)TurquoiseBlueColor          {return [UIColor colorWithRed:0.467 green:0.867 blue:0.906 alpha:1.0];}
+(UIColor *)TurquoisePearlColor         {return [UIColor colorWithRed:0.231 green:0.737 blue:0.816 alpha:1.0];}
+(UIColor *)TwilightLavenderColor       {return [UIColor colorWithRed:0.541 green:0.286 blue:0.420 alpha:1.0];}
+(UIColor *)UnmellowYellowColor         {return [UIColor colorWithRed:1.000 green:1.000 blue:0.400 alpha:1.0];}
+(UIColor *)VioletBlueColor             {return [UIColor colorWithRed:0.196 green:0.290 blue:0.698 alpha:1.0];}
+(UIColor *)VioletPurpleColor           {return [UIColor colorWithRed:0.573 green:0.431 blue:0.682 alpha:1.0];}
+(UIColor *)VioletRedColor              {return [UIColor colorWithRed:0.969 green:0.325 blue:0.580 alpha:1.0];}
+(UIColor *)VividTangerineColor         {return [UIColor colorWithRed:1.000 green:0.627 blue:0.537 alpha:1.0];}
+(UIColor *)VividVioletColor            {return [UIColor colorWithRed:0.561 green:0.314 blue:0.616 alpha:1.0];}
+(UIColor *)WildBlueYonderColor         {return [UIColor colorWithRed:0.635 green:0.678 blue:0.816 alpha:1.0];}
+(UIColor *)WildStrawberryColor         {return [UIColor colorWithRed:1.000 green:0.263 blue:0.643 alpha:1.0];}
+(UIColor *)WildWatermelonColor         {return [UIColor colorWithRed:0.988 green:0.424 blue:0.522 alpha:1.0];}
+(UIColor *)WinterSkyColor              {return [UIColor colorWithRed:1.000 green:0.000 blue:0.486 alpha:1.0];}
+(UIColor *)WinterWizardColor           {return [UIColor colorWithRed:0.627 green:0.902 blue:1.000 alpha:1.0];}
+(UIColor *)WintergreenDreamColor       {return [UIColor colorWithRed:0.337 green:0.533 blue:0.490 alpha:1.0];}
+(UIColor *)WisteriaColor               {return [UIColor colorWithRed:0.804 green:0.643 blue:0.871 alpha:1.0];}
+(UIColor *)YellowColor2                {return [UIColor colorWithRed:0.988 green:0.910 blue:0.514 alpha:1.0];}
+(UIColor *)YellowGreenColor            {return [UIColor colorWithRed:0.773 green:0.890 blue:0.518 alpha:1.0];}
+(UIColor *)YellowOrangeColor           {return [UIColor colorWithRed:1.000 green:0.714 blue:0.325 alpha:1.0];}
+(UIColor *)YellowSunshineColor         {return [UIColor colorWithRed:1.000 green:0.969 blue:0.000 alpha:1.0];}

@end