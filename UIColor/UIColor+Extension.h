//
//  UIColor+Extension.h
//  HELPER_FILES_AND_CATEGORIES
//
//  Created by Matthew Voss on 4/25/14.
//  Copyright (c) 2014 Matthew Voss. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extension)

//These are mine
+(UIColor *)randomColor;
+(UIColor *)averageColorBetweenColor:(UIColor *)color1
                            andColor:(UIColor *)color2;
+(CGFloat)getRedAverageBetweenColor:(UIColor *)color1
                           andColor:(UIColor *)color2;
+(CGFloat)getGreenAverageBetweenColor:(UIColor *)color1
                             andColor:(UIColor *)color2;
+(CGFloat)getBlueAverageBetweenColor:(UIColor *)color1
                            andColor:(UIColor *)color2;

+(CGFloat)getColorBrightness:(UIColor *)color;
+(UIColor *)changeBrightness:(UIColor *)color amount:(CGFloat)amount;
+(NSArray *)randomColorPaletteOfFourColors;
+(NSArray *)randomColorPaletteOfMaxSixteenColors:(NSInteger)numberOfColors;
+(NSArray *)randomColorPaletteOfSixteenColors;
+(NSArray *)getColorPaletteFromColor:(UIColor *)mainColor ofMaxSixteenColors:(NSInteger)numberOfColors;
+(NSArray *)getTwelveColors;
+(NSArray *)getArrayOfTwelveColorsFromSeedColor:(UIColor *)mainColor;

-(UIColor *)getBrownPaletteColor;
-(UIColor *)getYellowPaletteColor;
-(UIColor *)getOrangePaletteColor;

-(CGFloat)getHigestRGBValueFromColor;
-(CGFloat)getLowestRGBValueFromColor;
-(CGFloat)getMiddleRGBValueFromColor;

+(BOOL)isColor:(UIColor *)color1 withinVariance:(CGFloat)variance toColor:(UIColor *)color2;
+(BOOL)isColor:(UIColor *)color1 similerToColor:(UIColor *)color2;
+(BOOL)isRedValueOfColor:(UIColor *)color1 withinVariance:(CGFloat)variance toRedValueOfColor:(UIColor *)color2;
+(BOOL)isRedVlueofColor:(UIColor *)color1 similerToRedValueOfColor:(UIColor *)color2;
+(BOOL)isGreenValueOfColor:(UIColor *)color1 withinVariance:(CGFloat)variance toGreenValueOfColor:(UIColor *)color2;
+(BOOL)isGreenVlueofColor:(UIColor *)color1 similerToGreenValueOfColor:(UIColor *)color2;
+(BOOL)isBlueValueOfColor:(UIColor *)color1 withinVariance:(CGFloat)variance toBlueValueOfColor:(UIColor *)color2;
+(BOOL)isBlueVlueofColor:(UIColor *)color1 similerToBlueValueOfColor:(UIColor *)color2;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////

//The following was borrowed from https://github.com/needbee/uicolor-mix
//percentage of color2 that you want. The higher the percent the heavier it is weighted
+(UIColor *)colorBetweenColor:(UIColor *)color1
                     andColor:(UIColor *)color2
                   percentage:(float)percentage;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////

//The following was borrowed from https://github.com/ldehai/UIColor-Categories
+ (UIColor *)colorWithHexString:(NSString *)str; // takes @"#123456"
+ (UIColor *)colorWithHex:(UInt32)col; // takes 0x123456

//////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////

//The following was borrowed from https://github.com/mokagio/UIColor-FlatColors
+(UIColor *)flatTurquoiseColor;
+(UIColor *)flatGreenSeaColor;
+(UIColor *)flatEmeraldColor;
+(UIColor *)flatNephritisColor;
+(UIColor *)flatPeterRiverColor;
+(UIColor *)flatBelizeHoleColor;
+(UIColor *)flatAmethystColor;
+(UIColor *)flatWisteriaColor;
+(UIColor *)flatWetAsphaltColor;
+(UIColor *)flatMidnightBlueColor;
+(UIColor *)flatSunFlowerColor;
+(UIColor *)flatOrangeColor;
+(UIColor *)flatCarrotColor;
+(UIColor *)flatPumpkinColor;
+(UIColor *)flatAlizarinColor;
+(UIColor *)flatPomegranateColor;
+(UIColor *)flatCloudsColor;
+(UIColor *)flatSilverColor;
+(UIColor *)flatConcreteColor;
+(UIColor *)flatAsbestosColor;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////

//The following was borrowed from https://github.com/CaptainRedmuff/UIColor-Crayola
+(UIColor *)AbsoluteZeroColor;
+(UIColor *)AlienArmpitColor;
+(UIColor *)AlloyOrangeColor;
+(UIColor *)AlmondColor;
+(UIColor *)AmethystColor;
+(UIColor *)AntiqueBrassColor;
+(UIColor *)ApricotColor;
+(UIColor *)AquaPearlColor;
+(UIColor *)AquamarineColor;
+(UIColor *)AsparagusColor;
+(UIColor *)AtomicTangerineColor;
+(UIColor *)AztecGoldColor;
+(UIColor *)BabyPowderColor;
+(UIColor *)BananaColor;
+(UIColor *)BananaManiaColor;
+(UIColor *)BdazzledBlueColor;
+(UIColor *)BeaverColor;
+(UIColor *)BigDipORubyColor;
+(UIColor *)BigFootFeetColor;
+(UIColor *)BittersweetColor;
+(UIColor *)BittersweetShimmerColor;
+(UIColor *)BlackCoralPearlColor;
+(UIColor *)BlackShadowsColor;
+(UIColor *)BlastOffBronzeColor;
+(UIColor *)BlizzardBlueColor;
+(UIColor *)BlueColor2;
+(UIColor *)BlueBellColor;
+(UIColor *)BlueGrayColor;
+(UIColor *)BlueGreenColor;
+(UIColor *)BlueJeansColor;
+(UIColor *)BlueVioletColor;
+(UIColor *)BlueberryColor;
+(UIColor *)BlushColor;
+(UIColor *)BoogerBusterColor;
+(UIColor *)BrickRedColor;
+(UIColor *)BrightYellowColor;
+(UIColor *)BrownColor2;
+(UIColor *)BrownSugarColor;
+(UIColor *)BubbleGumColor;
+(UIColor *)BurnishedBrownColor;
+(UIColor *)BurntOrangeColor;
+(UIColor *)BurntSiennaColor;
+(UIColor *)CadetBlueColor;
+(UIColor *)CanaryColor;
+(UIColor *)CaribbeanGreenColor;
+(UIColor *)CaribbeanGreenPearlColor;
+(UIColor *)CarnationPinkColor;
+(UIColor *)CedarChestColor;
+(UIColor *)CeriseColor;
+(UIColor *)CeruleanColor;
+(UIColor *)CeruleanFrostColor;
+(UIColor *)CherryColor;
+(UIColor *)ChestnutColor;
+(UIColor *)ChocolateColor;
+(UIColor *)CinnamonSatinColor;
+(UIColor *)CitrineColor;
+(UIColor *)CoconutColor;
+(UIColor *)CopperColor;
+(UIColor *)CopperPennyColor;
+(UIColor *)CornflowerColor;
+(UIColor *)CosmicCobaltColor;
+(UIColor *)CottonCandyColor;
+(UIColor *)CulturedPearlColor;
+(UIColor *)CyberGrapeColor;
+(UIColor *)DaffodilColor;
+(UIColor *)DandelionColor;
+(UIColor *)DeepSpaceSparkleColor;
+(UIColor *)DenimColor;
+(UIColor *)DenimBlueColor;
+(UIColor *)DesertSandColor;
+(UIColor *)DingyDungeonColor;
+(UIColor *)DirtColor;
+(UIColor *)EerieBlackColor;
+(UIColor *)EggplantColor;
+(UIColor *)ElectricLimeColor;
+(UIColor *)EmeraldColor;
+(UIColor *)EucalyptusColor;
+(UIColor *)FernColor;
+(UIColor *)FieryRoseColor;
+(UIColor *)ForestGreenColor;
+(UIColor *)FreshAirColor;
+(UIColor *)FrostbiteColor;
+(UIColor *)FuchsiaColor;
+(UIColor *)FuzzyWuzzyColor;
+(UIColor *)GargoyleGasColor;
+(UIColor *)GiantsClubColor;
+(UIColor *)GlossyGrapeColor;
+(UIColor *)GoldColor;
+(UIColor *)GoldFusionColor;
+(UIColor *)GoldenrodColor;
+(UIColor *)GraniteGrayColor;
+(UIColor *)GrannySmithAppleColor;
+(UIColor *)GrapeColor;
+(UIColor *)GrayColor2;
+(UIColor *)GreenColor2;
+(UIColor *)GreenBlueColor;
+(UIColor *)GreenLizardColor;
+(UIColor *)GreenSheenColor;
+(UIColor *)GreenYellowColor;
+(UIColor *)HeatWaveColor;
+(UIColor *)HotMagentaColor;
+(UIColor *)IlluminatingEmeraldColor;
+(UIColor *)InchwormColor;
+(UIColor *)IndigoColor;
+(UIColor *)JadeColor;
+(UIColor *)JasperColor;
+(UIColor *)JazzberryJamColor;
+(UIColor *)JellyBeanColor;
+(UIColor *)JungleGreenColor;
+(UIColor *)KeyLimePearlColor;
+(UIColor *)LapisLazuliColor;
+(UIColor *)LaserLemonColor;
+(UIColor *)LavenderColor;
+(UIColor *)LeatherJacketColor;
+(UIColor *)LemonColor;
+(UIColor *)LemonGlacierColor;
+(UIColor *)LemonYellowColor;
+(UIColor *)LicoriceColor;
+(UIColor *)LilacColor;
+(UIColor *)LilacLusterColor;
+(UIColor *)LimeColor;
+(UIColor *)LumberColor;
+(UIColor *)MacaroniCheeseColor;
+(UIColor *)MagentaColor2;
+(UIColor *)MagicMintColor;
+(UIColor *)MagicPotionColor;
+(UIColor *)MahoganyColor;
+(UIColor *)MaizeColor;
+(UIColor *)MalachiteColor;
+(UIColor *)ManateeColor;
+(UIColor *)MandarinPearlColor;
+(UIColor *)MangoTangoColor;
+(UIColor *)MaroonColor;
+(UIColor *)MauvelousColor;
+(UIColor *)MelonColor;
+(UIColor *)MetallicSeaweedColor;
+(UIColor *)MetallicSunburstColor;
+(UIColor *)MidnightBlueColor;
+(UIColor *)MidnightPearlColor;
+(UIColor *)MistyMossColor;
+(UIColor *)MoonstoneColor;
+(UIColor *)MountainMeadowColor;
+(UIColor *)MulberryColor;
+(UIColor *)MummysTombColor;
+(UIColor *)MysticMaroonColor;
+(UIColor *)MysticPearlColor;
+(UIColor *)NavyBlueColor;
+(UIColor *)NeonCarrotColor;
+(UIColor *)NewCarColor;
+(UIColor *)OceanBluePearlColor;
+(UIColor *)OceanGreenPearlColor;
+(UIColor *)OgreOdorColor;
+(UIColor *)OliveGreenColor;
+(UIColor *)OnyxColor;
+(UIColor *)OrangeColor2;
+(UIColor *)OrangeRedColor;
+(UIColor *)OrangeSodaColor;
+(UIColor *)OrangeYellowColor;
+(UIColor *)OrchidColor;
+(UIColor *)OrchidPearlColor;
+(UIColor *)OuterSpaceColor;
+(UIColor *)OutrageousOrangeColor;
+(UIColor *)PacificBlueColor;
+(UIColor *)PeachColor;
+(UIColor *)PearlyPurpleColor;
+(UIColor *)PeridotColor;
+(UIColor *)PeriwinkleColor;
+(UIColor *)PewterBlueColor;
+(UIColor *)PiggyPinkColor;
+(UIColor *)PineColor;
+(UIColor *)PineGreenColor;
+(UIColor *)PinkFlamingoColor;
+(UIColor *)PinkPearlColor;
+(UIColor *)PinkSherbertColor;
+(UIColor *)PixiePowderColor;
+(UIColor *)PlumColor;
+(UIColor *)PlumpPurpleColor;
+(UIColor *)PolishedPineColor;
+(UIColor *)PrincessPerfumeColor;
+(UIColor *)PurpleHeartColor;
+(UIColor *)PurpleMountainsMajestyColor;
+(UIColor *)PurplePizzazzColor;
+(UIColor *)PurplePlumColor;
+(UIColor *)QuickSilverColor;
+(UIColor *)RadicalRedColor;
+(UIColor *)RawSiennaColor;
+(UIColor *)RawUmberColor;
+(UIColor *)RazzleDazzleRoseColor;
+(UIColor *)RazzmatazzColor;
+(UIColor *)RazzmicBerryColor;
+(UIColor *)RedColor2;
+(UIColor *)RedOrangeColor;
+(UIColor *)RedSalsaColor;
+(UIColor *)RedVioletColor;
+(UIColor *)RobinsEggBlueColor;
+(UIColor *)RoseColor;
+(UIColor *)RoseDustColor;
+(UIColor *)RosePearlColor;
+(UIColor *)RoseQuartzColor;
+(UIColor *)RoyalPurpleColor;
+(UIColor *)RubyColor;
+(UIColor *)RustyRedColor;
+(UIColor *)SalmonColor;
+(UIColor *)SalmonPearlColor;
+(UIColor *)SapphireColor;
+(UIColor *)SasquatchSocksColor;
+(UIColor *)ScarletColor;
+(UIColor *)ScreaminGreenColor;
+(UIColor *)SeaGreenColor;
+(UIColor *)SeaSerpentColor;
+(UIColor *)SepiaColor;
+(UIColor *)ShadowColor;
+(UIColor *)ShadowBlueColor;
+(UIColor *)ShampooColor;
+(UIColor *)ShamrockColor;
+(UIColor *)SheenGreenColor;
+(UIColor *)ShimmeringBlushColor;
+(UIColor *)ShinyShamrockColor;
+(UIColor *)ShockingPinkColor;
+(UIColor *)SilverColor;
+(UIColor *)SizzlingRedColor;
+(UIColor *)SizzlingSunriseColor;
+(UIColor *)SkyBlueColor;
+(UIColor *)SlimyGreenColor;
+(UIColor *)SmashedPumpkinColor;
+(UIColor *)SmokeColor;
+(UIColor *)SmokeyTopazColor;
+(UIColor *)SoapColor;
+(UIColor *)SonicSilverColor;
+(UIColor *)SpringFrostColor;
+(UIColor *)SpringGreenColor;
+(UIColor *)SteelBlueColor;
+(UIColor *)SteelTealColor;
+(UIColor *)StrawberryColor;
+(UIColor *)SugarPlumColor;
+(UIColor *)SunburntCyclopsColor;
+(UIColor *)SunglowColor;
+(UIColor *)SunnyPearlColor;
+(UIColor *)SunsetOrangeColor;
+(UIColor *)SunsetPearlColor;
+(UIColor *)SweetBrownColor;
+(UIColor *)TanColor;
+(UIColor *)TartOrangeColor;
+(UIColor *)TealBlueColor;
+(UIColor *)ThistleColor;
+(UIColor *)TickleMePinkColor;
+(UIColor *)TigersEyeColor;
+(UIColor *)TimberwolfColor;
+(UIColor *)TropicalRainForestColor;
+(UIColor *)TulipColor;
+(UIColor *)TumbleweedColor;
+(UIColor *)TurquoiseBlueColor;
+(UIColor *)TurquoisePearlColor;
+(UIColor *)TwilightLavenderColor;
+(UIColor *)UnmellowYellowColor;
+(UIColor *)VioletBlueColor;
+(UIColor *)VioletPurpleColor;
+(UIColor *)VioletRedColor;
+(UIColor *)VividTangerineColor;
+(UIColor *)VividVioletColor;
+(UIColor *)WildBlueYonderColor;
+(UIColor *)WildStrawberryColor;
+(UIColor *)WildWatermelonColor;
+(UIColor *)WinterSkyColor;
+(UIColor *)WinterWizardColor;
+(UIColor *)WintergreenDreamColor;
+(UIColor *)WisteriaColor;
+(UIColor *)YellowColor2;
+(UIColor *)YellowGreenColor;
+(UIColor *)YellowOrangeColor;
+(UIColor *)YellowSunshineColor;

@end
