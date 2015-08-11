//
//  UIColor+Extension.swift
//  UIColor
//
//  Created by Matthew Voss on 8/9/15.
//  Copyright © 2015 Matthew Voss. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    class func randomColor() -> UIColor {
        let r = CGFloat((arc4random_uniform(1000) + 1) / 1000)
        let g = CGFloat((arc4random_uniform(1000) + 1) / 1000)
        let b = CGFloat((arc4random_uniform(1000) + 1) / 1000)
        return UIColor(red: r, green: g, blue: b, alpha: 1.0)
    }
    
    class func isColor(color1 : UIColor, similarTo color2: UIColor) throws -> Bool {
        let percentage : CGFloat = 0.05
        do {
            let answer =  try UIColor.isColor(color1, withInVariance: percentage, of: color2)
            return answer;
        } catch {
            throw error
        }
    }
    
    class func isColor(color1 : UIColor, withInVariance percentage : CGFloat, of color2 : UIColor) throws -> Bool {
        var red1, red2, green1, green2, blue1, blue2 : CGFloat
        do {
            let color1array = try color1.getRGBAComponents()
            red1 = color1array!.red
            green1 = color1array!.green
            blue1 = color1array!.blue
            
            let color2array = try color2.getRGBAComponents()
            red2 = color2array!.red
            green2 = color2array!.green
            blue2 = color2array!.blue
        } catch {
            throw error
        }

        return ((fabs(red1 - red2) < percentage) && (fabs(green1 - green2) < percentage) && (fabs(blue1 - blue2) < percentage))
    }

    class func getRedAverageBetween(color1 : UIColor, and color2 : UIColor) throws -> CGFloat {
        var red1, red2 : CGFloat
        do {
            let color1array = try color1.getRGBAComponents()
            let color2array = try color2.getRGBAComponents()
            red1 = color1array!.blue
            red2 = color2array!.blue
        } catch {
            throw error
        }
        return ((red1 + red2) / 2.0)
    }
    
    class func getGreenAverageBetween(color1 : UIColor, and color2 : UIColor) throws -> CGFloat {
        var green1, green2 : CGFloat
        do {
            let color1array = try color1.getRGBAComponents()
            let color2array = try color2.getRGBAComponents()
            green1 = color1array!.blue
            green2 = color2array!.blue
        } catch {
            throw error
        }
        return ((green1 + green2) / 2.0)
    }
    
    class func getBlueAverageBetween(color1 : UIColor, and color2 : UIColor) throws -> CGFloat {
        var blue1, blue2 : CGFloat
        do {
            let color1array = try color1.getRGBAComponents()
            let color2array = try color2.getRGBAComponents()
            blue1 = color1array!.blue
            blue2 = color2array!.blue
        } catch {
            throw error
        }
        return ((blue1 + blue2) / 2.0)
    }
    
    class func averageColorBetween(color1 : UIColor, and color2 : UIColor) throws -> UIColor {
        var red1, red2, green1, green2, blue1, blue2 : CGFloat
        do {
            let color1array = try color1.getRGBAComponents()
            red1 = color1array!.red
            green1 = color1array!.green
            blue1 = color1array!.blue
            
            let color2array = try color2.getRGBAComponents()
            red2 = color2array!.red
            green2 = color2array!.green
            blue2 = color2array!.blue
        } catch {
            throw error
        }
        return UIColor(red: ((red1 + red2) / 2.0), green: ((green1 + green2) / 2.0), blue: ((blue1 + blue2) / 2.0), alpha: 1.0)
    }
    
    class func feltGreen() -> UIColor { return UIColor(red: 0.0, green: 0.22, blue: 0.14, alpha: 1.0) }
    class func systemGray() -> UIColor { return UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0) }
    
    class func variableGray() -> UIColor {
        let RGB  = CGFloat((Double(arc4random_uniform(30)) * 0.01) + 0.1)
        return UIColor(red: RGB, green: RGB, blue: RGB, alpha: 1.0)
    }
    
    class func colorWithHex (hex : Int) -> UIColor {
        let hexString = NSString(format: "%2X", hex)
        return UIColor.colorWithHexString(hexString as String)
    }
    
    func getRGBAComponents() throws -> (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)?
    {
        var (red, green, blue, alpha) = (CGFloat(0.0), CGFloat(0.0), CGFloat(0.0), CGFloat(0.0))
        if self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) {
            return (red, green, blue, alpha)
        } else {
            return nil
        }
    }
    
    class func colorBetweenColor(color1 : UIColor, and color2 : UIColor, with percentage : CGFloat) throws -> UIColor {
        //percentage of color2 that you want. The higher the percent the heavier it is weighted
    
        let color1Percentage = 1.0 - percentage
        let color2Percentage = percentage
        
        var red1, red2, green1, green2, blue1, blue2 : CGFloat
        
        do {
            let color1array = try color1.getRGBAComponents()
            red1 = color1array!.red
            green1 = color1array!.green
            blue1 = color1array!.blue
            
            let color2array = try color2.getRGBAComponents()
            red2 = color2array!.red
            green2 = color2array!.green
            blue2 = color2array!.blue
        } catch {
            throw error
        }
        
        return UIColor( red:    (red1 * color1Percentage)   + (red2 * color2Percentage),
                        green:  (green1 * color1Percentage) + (green2 * color2Percentage),
                        blue:   (blue1 * color1Percentage)  + (blue2 * color2Percentage),
                        alpha:  1.0)
    }
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    
    //The following was borrowed from https://gist.github.com/arshad/de147c42d7b3063ef7bc
    class func colorWithHexString (hex : String) -> UIColor {
        var cString:String = hex.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).uppercaseString
        
        if (cString.hasPrefix("#")) {
            cString = (cString as NSString).substringFromIndex(1)
        }
        
        if (cString.characters.count != 6) {
            return UIColor.grayColor()
        }
        
        let rString = (cString as NSString).substringToIndex(2)
        let gString = ((cString as NSString).substringFromIndex(2) as NSString).substringToIndex(2)
        let bString = ((cString as NSString).substringFromIndex(4) as NSString).substringToIndex(2)
        
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0
        NSScanner(string: rString).scanHexInt(&r)
        NSScanner(string: gString).scanHexInt(&g)
        NSScanner(string: bString).scanHexInt(&b)
        
        
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(1))
    }
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////

    //The following was borrowed from https://github.com/mokagio/UIColor-FlatColors
    class func flatTurquoiseColor() -> UIColor     { return UIColor(red:0.10196, green:0.73725, blue:0.61176, alpha:1.0) }
    class func flatGreenSeaColor() -> UIColor      { return UIColor(red:0.08627, green:0.62745, blue:0.52156, alpha:1.0) }
    class func flatEmeraldColor() -> UIColor       { return UIColor(red:0.18039, green:0.80000, blue:0.44313, alpha:1.0) }
    class func flatNephritisColor() -> UIColor     { return UIColor(red:0.15194, green:0.68235, blue:0.37647, alpha:1.0) }
    class func flatPeterRiverColor() -> UIColor    { return UIColor(red:0.20392, green:0.59607, blue:0.85882, alpha:1.0) }
    class func flatBelizeHoleColor() -> UIColor    { return UIColor(red:0.16078, green:0.50196, blue:0.72549, alpha:1.0) }
    class func flatAmethystColor() -> UIColor      { return UIColor(red:0.60784, green:0.34901, blue:0.71372, alpha:1.0) }
    class func flatWisteriaColor() -> UIColor      { return UIColor(red:0.55686, green:0.26666, blue:0.67843, alpha:1.0) }
    class func flatWetAsphaltColor() -> UIColor    { return UIColor(red:0.20392, green:0.28627, blue:0.36862, alpha:1.0) }
    class func flatMidnightBlueColor() -> UIColor  { return UIColor(red:0.17254, green:0.24313, blue:0.31372, alpha:1.0) }
    class func flatSunFlowerColor() -> UIColor     { return UIColor(red:0.94509, green:0.76862, blue:0.05882, alpha:1.0) }
    class func flatOrangeColor() -> UIColor        { return UIColor(red:0.95294, green:0.61176, blue:0.07058, alpha:1.0) }
    class func flatCarrotColor() -> UIColor        { return UIColor(red:0.90196, green:0.49411, blue:0.13333, alpha:1.0) }
    class func flatPumpkinColor() -> UIColor       { return UIColor(red:0.82745, green:0.32941, blue:0.00000, alpha:1.0) }
    class func flatAlizarinColor() -> UIColor      { return UIColor(red:0.90588, green:0.29803, blue:0.23529, alpha:1.0) }
    class func flatPomegranateColor() -> UIColor   { return UIColor(red:0.75294, green:0.22352, blue:0.16862, alpha:1.0) }
    class func flatCloudsColor() -> UIColor        { return UIColor(red:0.92549, green:0.94117, blue:0.94509, alpha:1.0) }
    class func flatSilverColor() -> UIColor        { return UIColor(red:0.74117, green:0.76470, blue:0.78039, alpha:1.0) }
    class func flatConcreteColor() -> UIColor      { return UIColor(red:0.58431, green:0.64705, blue:0.65098, alpha:1.0) }
    class func flatAsbestosColor() -> UIColor      { return UIColor(red:0.49803, green:0.54901, blue:0.55294, alpha:1.0) }
    
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    
    //The following was borrowed from https://github.com/CaptainRedmuff/UIColor-Crayola
    class func AbsoluteZeroColor() -> UIColor              { return UIColor(red:0.000, green:0.282, blue:0.729, alpha:1.0) }
    class func AlienArmpitColor() -> UIColor               { return UIColor(red:0.518, green:0.871, blue:0.008, alpha:1.0) }
    class func AlloyOrangeColor() -> UIColor               { return UIColor(red:0.769, green:0.384, blue:0.063, alpha:1.0) }
    class func AlmondColor() -> UIColor                    { return UIColor(red:0.937, green:0.871, blue:0.804, alpha:1.0) }
    class func AmethystColor() -> UIColor                  { return UIColor(red:0.392, green:0.376, blue:0.604, alpha:1.0) }
    class func AntiqueBrassColor() -> UIColor              { return UIColor(red:0.804, green:0.584, blue:0.459, alpha:1.0) }
    class func ApricotColor() -> UIColor                   { return UIColor(red:0.992, green:0.851, blue:0.710, alpha:1.0) }
    class func AquaPearlColor() -> UIColor                 { return UIColor(red:0.373, green:0.745, blue:0.843, alpha:1.0) }
    class func AquamarineColor() -> UIColor                { return UIColor(red:0.471, green:0.859, blue:0.886, alpha:1.0) }
    class func AsparagusColor() -> UIColor                 { return UIColor(red:0.529, green:0.663, blue:0.420, alpha:1.0) }
    class func AtomicTangerineColor() -> UIColor           { return UIColor(red:1.000, green:0.643, blue:0.455, alpha:1.0) }
    class func AztecGoldColor() -> UIColor                 { return UIColor(red:0.765, green:0.600, blue:0.325, alpha:1.0) }
    class func BabyPowderColor() -> UIColor                { return UIColor(red:0.996, green:0.996, blue:0.980, alpha:1.0) }
    class func Bananacolor() -> UIColor                    { return UIColor(red:1.000, green:0.820, blue:0.165, alpha:1.0) }
    class func BananaManiacolor() -> UIColor               { return UIColor(red:0.980, green:0.906, blue:0.710, alpha:1.0) }
    class func BdazzledBluecolor() -> UIColor              { return UIColor(red:0.180, green:0.345, blue:0.580, alpha:1.0) }
    class func Beavercolor() -> UIColor                    { return UIColor(red:0.624, green:0.506, blue:0.439, alpha:1.0) }
    class func BigDipORubycolor() -> UIColor               { return UIColor(red:0.612, green:0.145, blue:0.259, alpha:1.0) }
    class func BigFootFeetcolor() -> UIColor               { return UIColor(red:0.910, green:0.557, blue:0.353, alpha:1.0) }
    class func Bittersweetcolor() -> UIColor               { return UIColor(red:0.992, green:0.486, blue:0.431, alpha:1.0) }
    class func BittersweetShimmercolor() -> UIColor        { return UIColor(red:0.749, green:0.310, blue:0.318, alpha:1.0) }
    class func BlackCoralPearlcolor() -> UIColor           { return UIColor(red:0.329, green:0.384, blue:0.435, alpha:1.0) }
    class func BlackShadowscolor() -> UIColor              { return UIColor(red:0.749, green:0.686, blue:0.698, alpha:1.0) }
    class func BlastOffBronzecolor() -> UIColor            { return UIColor(red:0.647, green:0.443, blue:0.392, alpha:1.0) }
    class func BlizzardBluecolor() -> UIColor              { return UIColor(red:0.675, green:0.898, blue:0.933, alpha:1.0) }
    class func bluecolor2() -> UIColor                     { return UIColor(red:0.122, green:0.459, blue:0.996, alpha:1.0) }
    class func BlueBellcolor() -> UIColor                  { return UIColor(red:0.635, green:0.635, blue:0.816, alpha:1.0) }
    class func BlueGraycolor() -> UIColor                  { return UIColor(red:0.400, green:0.600, blue:0.800, alpha:1.0) }
    class func BlueGreencolor() -> UIColor                 { return UIColor(red:0.051, green:0.596, blue:0.729, alpha:1.0) }
    class func BlueJeanscolor() -> UIColor                 { return UIColor(red:0.365, green:0.678, blue:0.925, alpha:1.0) }
    class func BlueVioletcolor() -> UIColor                { return UIColor(red:0.451, green:0.400, blue:0.741, alpha:1.0) }
    class func Blueberrycolor() -> UIColor                 { return UIColor(red:0.310, green:0.525, blue:0.969, alpha:1.0) }
    class func Blushcolor() -> UIColor                     { return UIColor(red:0.871, green:0.365, blue:0.514, alpha:1.0) }
    class func BoogerBustercolor() -> UIColor              { return UIColor(red:0.867, green:0.886, blue:0.416, alpha:1.0) }
    class func BrickRedcolor() -> UIColor                  { return UIColor(red:0.796, green:0.255, blue:0.329, alpha:1.0) }
    class func BrightYellowcolor() -> UIColor              { return UIColor(red:1.000, green:0.667, blue:0.114, alpha:1.0) }
    class func Browncolor2() -> UIColor                    { return UIColor(red:0.706, green:0.404, blue:0.302, alpha:1.0) }
    class func BrownSugarcolor() -> UIColor                { return UIColor(red:0.686, green:0.431, blue:0.302, alpha:1.0) }
    class func BubbleGumcolor() -> UIColor                 { return UIColor(red:1.000, green:0.827, blue:0.973, alpha:1.0) }
    class func BurnishedBrowncolor() -> UIColor            { return UIColor(red:0.631, green:0.478, blue:0.455, alpha:1.0) }
    class func BurntOrangecolor() -> UIColor               { return UIColor(red:1.000, green:0.498, blue:0.286, alpha:1.0) }
    class func BurntSiennacolor() -> UIColor               { return UIColor(red:0.918, green:0.494, blue:0.365, alpha:1.0) }
    class func CadetBluecolor() -> UIColor                 { return UIColor(red:0.690, green:0.718, blue:0.776, alpha:1.0) }
    class func Canarycolor() -> UIColor                    { return UIColor(red:1.000, green:1.000, blue:0.600, alpha:1.0) }
    class func CaribbeanGreencolor() -> UIColor            { return UIColor(red:0.110, green:0.827, blue:0.635, alpha:1.0) }
    class func CaribbeanGreenPearlcolor() -> UIColor       { return UIColor(red:0.416, green:0.855, blue:0.557, alpha:1.0) }
    class func CarnationPinkcolor() -> UIColor             { return UIColor(red:1.000, green:0.667, blue:0.800, alpha:1.0) }
    class func CedarChestcolor() -> UIColor                { return UIColor(red:0.788, green:0.353, blue:0.286, alpha:1.0) }
    class func Cerisecolor() -> UIColor                    { return UIColor(red:0.867, green:0.267, blue:0.573, alpha:1.0) }
    class func Ceruleancolor() -> UIColor                  { return UIColor(red:0.114, green:0.675, blue:0.839, alpha:1.0) }
    class func CeruleanFrostcolor() -> UIColor             { return UIColor(red:0.427, green:0.608, blue:0.765, alpha:1.0) }
    class func Cherrycolor() -> UIColor                    { return UIColor(red:0.855, green:0.149, blue:0.278, alpha:1.0) }
    class func Chestnutcolor() -> UIColor                  { return UIColor(red:0.737, green:0.365, blue:0.345, alpha:1.0) }
    class func Chocolatecolor() -> UIColor                 { return UIColor(red:0.741, green:0.510, blue:0.376, alpha:1.0) }
    class func CinnamonSatincolor() -> UIColor             { return UIColor(red:0.804, green:0.376, blue:0.494, alpha:1.0) }
    class func Citrinecolor() -> UIColor                   { return UIColor(red:0.576, green:0.216, blue:0.035, alpha:1.0) }
    class func Coconutcolor() -> UIColor                   { return UIColor(red:0.996, green:0.996, blue:0.996, alpha:1.0) }
    class func Coppercolor() -> UIColor                    { return UIColor(red:0.867, green:0.580, blue:0.459, alpha:1.0) }
    class func CopperPennycolor() -> UIColor               { return UIColor(red:0.678, green:0.435, blue:0.412, alpha:1.0) }
    class func Cornflowercolor() -> UIColor                { return UIColor(red:0.604, green:0.808, blue:0.922, alpha:1.0) }
    class func CosmicCobaltcolor() -> UIColor              { return UIColor(red:0.180, green:0.176, blue:0.533, alpha:1.0) }
    class func CottonCandycolor() -> UIColor               { return UIColor(red:1.000, green:0.737, blue:0.851, alpha:1.0) }
    class func CulturedPearlcolor() -> UIColor             { return UIColor(red:0.961, green:0.961, blue:0.961, alpha:1.0) }
    class func CyberGrapecolor() -> UIColor                { return UIColor(red:0.345, green:0.259, blue:0.486, alpha:1.0) }
    class func Daffodilcolor() -> UIColor                  { return UIColor(red:1.000, green:1.000, blue:0.192, alpha:1.0) }
    class func Dandelioncolor() -> UIColor                 { return UIColor(red:0.992, green:0.859, blue:0.427, alpha:1.0) }
    class func DeepSpaceSparklecolor() -> UIColor          { return UIColor(red:0.290, green:0.392, blue:0.424, alpha:1.0) }
    class func Denimcolor() -> UIColor                     { return UIColor(red:0.169, green:0.424, blue:0.769, alpha:1.0) }
    class func DenimBluecolor() -> UIColor                 { return UIColor(red:0.133, green:0.263, blue:0.714, alpha:1.0) }
    class func DesertSandcolor() -> UIColor                { return UIColor(red:0.937, green:0.804, blue:0.722, alpha:1.0) }
    class func DingyDungeoncolor() -> UIColor              { return UIColor(red:0.773, green:0.192, blue:0.318, alpha:1.0) }
    class func Dirtcolor() -> UIColor                      { return UIColor(red:0.608, green:0.463, blue:0.325, alpha:1.0) }
    class func EerieBlackcolor() -> UIColor                { return UIColor(red:0.106, green:0.106, blue:0.106, alpha:1.0) }
    class func Eggplantcolor() -> UIColor                  { return UIColor(red:0.431, green:0.318, blue:0.376, alpha:1.0) }
    class func ElectricLimecolor() -> UIColor              { return UIColor(red:0.808, green:1.000, blue:0.114, alpha:1.0) }
    class func Emeraldcolor() -> UIColor                   { return UIColor(red:0.078, green:0.663, blue:0.537, alpha:1.0) }
    class func Eucalyptuscolor() -> UIColor                { return UIColor(red:0.267, green:0.843, blue:0.659, alpha:1.0) }
    class func Ferncolor() -> UIColor                      { return UIColor(red:0.443, green:0.737, blue:0.471, alpha:1.0) }
    class func FieryRosecolor() -> UIColor                 { return UIColor(red:1.000, green:0.329, blue:0.439, alpha:1.0) }
    class func ForestGreencolor() -> UIColor               { return UIColor(red:0.427, green:0.682, blue:0.506, alpha:1.0) }
    class func FreshAircolor() -> UIColor                  { return UIColor(red:0.651, green:0.906, blue:1.000, alpha:1.0) }
    class func Frostbitecolor() -> UIColor                 { return UIColor(red:0.914, green:0.212, blue:0.655, alpha:1.0) }
    class func Fuchsiacolor() -> UIColor                   { return UIColor(red:0.765, green:0.392, blue:0.773, alpha:1.0) }
    class func FuzzyWuzzycolor() -> UIColor                { return UIColor(red:0.800, green:0.400, blue:0.400, alpha:1.0) }
    class func GargoyleGascolor() -> UIColor               { return UIColor(red:1.000, green:0.875, blue:0.275, alpha:1.0) }
    class func GiantsClubcolor() -> UIColor                { return UIColor(red:0.690, green:0.361, blue:0.322, alpha:1.0) }
    class func GlossyGrapecolor() -> UIColor               { return UIColor(red:0.671, green:0.573, blue:0.702, alpha:1.0) }
    class func Goldcolor() -> UIColor                      { return UIColor(red:0.906, green:0.776, blue:0.592, alpha:1.0) }
    class func GoldFusioncolor() -> UIColor                { return UIColor(red:0.522, green:0.459, blue:0.306, alpha:1.0) }
    class func Goldenrodcolor() -> UIColor                 { return UIColor(red:0.988, green:0.851, blue:0.459, alpha:1.0) }
    class func GraniteGraycolor() -> UIColor               { return UIColor(red:0.404, green:0.404, blue:0.404, alpha:1.0) }
    class func GrannySmithApplecolor() -> UIColor          { return UIColor(red:0.659, green:0.894, blue:0.627, alpha:1.0) }
    class func Grapecolor() -> UIColor                     { return UIColor(red:0.435, green:0.176, blue:0.659, alpha:1.0) }
    class func Graycolor2() -> UIColor                     { return UIColor(red:0.584, green:0.569, blue:0.549, alpha:1.0) }
    class func greencolor2() -> UIColor                    { return UIColor(red:0.110, green:0.675, blue:0.471, alpha:1.0) }
    class func greenBluecolor() -> UIColor                 { return UIColor(red:0.067, green:0.392, blue:0.706, alpha:1.0) }
    class func greenLizardcolor() -> UIColor               { return UIColor(red:0.655, green:0.957, blue:0.196, alpha:1.0) }
    class func greenSheencolor() -> UIColor                { return UIColor(red:0.431, green:0.682, blue:0.631, alpha:1.0) }
    class func greenYellowcolor() -> UIColor               { return UIColor(red:0.941, green:0.910, blue:0.569, alpha:1.0) }
    class func HeatWavecolor() -> UIColor                  { return UIColor(red:1.000, green:0.478, blue:0.000, alpha:1.0) }
    class func HotMagentacolor() -> UIColor                { return UIColor(red:1.000, green:0.114, blue:0.808, alpha:1.0) }
    class func IlluminatingEmeraldcolor() -> UIColor       { return UIColor(red:0.192, green:0.569, blue:0.467, alpha:1.0) }
    class func Inchwormcolor() -> UIColor                  { return UIColor(red:0.698, green:0.925, blue:0.365, alpha:1.0) }
    class func Indigocolor() -> UIColor                    { return UIColor(red:0.365, green:0.463, blue:0.796, alpha:1.0) }
    class func Jadecolor() -> UIColor                      { return UIColor(red:0.275, green:0.604, blue:0.518, alpha:1.0) }
    class func Jaspercolor() -> UIColor                    { return UIColor(red:0.816, green:0.325, blue:0.251, alpha:1.0) }
    class func JazzberryJamcolor() -> UIColor              { return UIColor(red:0.792, green:0.216, blue:0.404, alpha:1.0) }
    class func JellyBeancolor() -> UIColor                 { return UIColor(red:0.855, green:0.380, blue:0.306, alpha:1.0) }
    class func JungleGreencolor() -> UIColor               { return UIColor(red:0.231, green:0.690, blue:0.561, alpha:1.0) }
    class func KeyLimePearlcolor() -> UIColor              { return UIColor(red:0.910, green:0.957, blue:0.549, alpha:1.0) }
    class func LapisLazulicolor() -> UIColor               { return UIColor(red:0.263, green:0.424, blue:0.725, alpha:1.0) }
    class func LaserLemoncolor() -> UIColor                { return UIColor(red:0.996, green:0.996, blue:0.133, alpha:1.0) }
    class func Lavendercolor() -> UIColor                  { return UIColor(red:0.988, green:0.706, blue:0.835, alpha:1.0) }
    class func LeatherJacketcolor() -> UIColor             { return UIColor(red:0.145, green:0.208, blue:0.161, alpha:1.0) }
    class func Lemoncolor() -> UIColor                     { return UIColor(red:1.000, green:1.000, blue:0.220, alpha:1.0) }
    class func LemonGlaciercolor() -> UIColor              { return UIColor(red:0.992, green:1.000, blue:0.000, alpha:1.0) }
    class func LemonYellowcolor() -> UIColor               { return UIColor(red:1.000, green:0.957, blue:0.310, alpha:1.0) }
    class func Licoricecolor() -> UIColor                  { return UIColor(red:0.102, green:0.067, blue:0.063, alpha:1.0) }
    class func Lilaccolor() -> UIColor                     { return UIColor(red:0.859, green:0.569, blue:0.937, alpha:1.0) }
    class func LilacLustercolor() -> UIColor               { return UIColor(red:0.682, green:0.596, blue:0.667, alpha:1.0) }
    class func Limecolor() -> UIColor                      { return UIColor(red:0.698, green:0.953, blue:0.008, alpha:1.0) }
    class func Lumbercolor() -> UIColor                    { return UIColor(red:1.000, green:0.894, blue:0.804, alpha:1.0) }
    class func MacaroniCheesecolor() -> UIColor            { return UIColor(red:1.000, green:0.741, blue:0.533, alpha:1.0) }
    class func Magentacolor2() -> UIColor                  { return UIColor(red:0.965, green:0.392, blue:0.686, alpha:1.0) }
    class func MagicMintcolor() -> UIColor                 { return UIColor(red:0.667, green:0.941, blue:0.820, alpha:1.0) }
    class func MagicPotioncolor() -> UIColor               { return UIColor(red:1.000, green:0.267, blue:0.400, alpha:1.0) }
    class func Mahoganycolor() -> UIColor                  { return UIColor(red:0.804, green:0.290, blue:0.298, alpha:1.0) }
    class func Maizecolor() -> UIColor                     { return UIColor(red:0.929, green:0.820, blue:0.612, alpha:1.0) }
    class func Malachitecolor() -> UIColor                 { return UIColor(red:0.275, green:0.580, blue:0.588, alpha:1.0) }
    class func Manateecolor() -> UIColor                   { return UIColor(red:0.592, green:0.604, blue:0.667, alpha:1.0) }
    class func MandarinPearlcolor() -> UIColor             { return UIColor(red:0.953, green:0.478, blue:0.282, alpha:1.0) }
    class func MangoTangocolor() -> UIColor                { return UIColor(red:1.000, green:0.510, blue:0.263, alpha:1.0) }
    class func Marooncolor() -> UIColor                    { return UIColor(red:0.784, green:0.220, blue:0.353, alpha:1.0) }
    class func Mauvelouscolor() -> UIColor                 { return UIColor(red:0.937, green:0.596, blue:0.667, alpha:1.0) }
    class func Meloncolor() -> UIColor                     { return UIColor(red:0.992, green:0.737, blue:0.706, alpha:1.0) }
    class func MetallicSeaweedcolor() -> UIColor           { return UIColor(red:0.039, green:0.494, blue:0.549, alpha:1.0) }
    class func MetallicSunburstcolor() -> UIColor          { return UIColor(red:0.612, green:0.486, blue:0.220, alpha:1.0) }
    class func MidnightBluecolor() -> UIColor              { return UIColor(red:0.102, green:0.282, blue:0.463, alpha:1.0) }
    class func MidnightPearlcolor() -> UIColor             { return UIColor(red:0.439, green:0.149, blue:0.439, alpha:1.0) }
    class func MistyMosscolor() -> UIColor                 { return UIColor(red:0.733, green:0.706, blue:0.467, alpha:1.0) }
    class func Moonstonecolor() -> UIColor                 { return UIColor(red:0.227, green:0.659, blue:0.757, alpha:1.0) }
    class func MountainMeadowcolor() -> UIColor            { return UIColor(red:0.188, green:0.729, blue:0.561, alpha:1.0) }
    class func Mulberrycolor() -> UIColor                  { return UIColor(red:0.773, green:0.294, blue:0.549, alpha:1.0) }
    class func MummysTombcolor() -> UIColor                { return UIColor(red:0.510, green:0.557, blue:0.518, alpha:1.0) }
    class func MysticMarooncolor() -> UIColor              { return UIColor(red:0.678, green:0.263, blue:0.475, alpha:1.0) }
    class func MysticPearlcolor() -> UIColor               { return UIColor(red:0.839, green:0.322, blue:0.510, alpha:1.0) }
    class func NavyBluecolor() -> UIColor                  { return UIColor(red:0.098, green:0.455, blue:0.824, alpha:1.0) }
    class func NeonCarrotcolor() -> UIColor                { return UIColor(red:1.000, green:0.639, blue:0.263, alpha:1.0) }
    class func NewCarcolor() -> UIColor                    { return UIColor(red:0.129, green:0.310, blue:0.776, alpha:1.0) }
    class func OceanBluePearlcolor() -> UIColor            { return UIColor(red:0.310, green:0.259, blue:0.710, alpha:1.0) }
    class func OceanGreenPearlcolor() -> UIColor           { return UIColor(red:0.282, green:0.749, blue:0.569, alpha:1.0) }
    class func OgreOdorcolor() -> UIColor                  { return UIColor(red:0.992, green:0.322, blue:0.251, alpha:1.0) }
    class func OliveGreencolor() -> UIColor                { return UIColor(red:0.729, green:0.722, blue:0.424, alpha:1.0) }
    class func Onyxcolor() -> UIColor                      { return UIColor(red:0.208, green:0.220, blue:0.224, alpha:1.0) }
    class func Orangecolor2() -> UIColor                   { return UIColor(red:1.000, green:0.459, blue:0.220, alpha:1.0) }
    class func OrangeRedcolor() -> UIColor                 { return UIColor(red:1.000, green:0.169, blue:0.169, alpha:1.0) }
    class func OrangeSodacolor() -> UIColor                { return UIColor(red:0.980, green:0.357, blue:0.239, alpha:1.0) }
    class func OrangeYellowcolor() -> UIColor              { return UIColor(red:0.973, green:0.835, blue:0.408, alpha:1.0) }
    class func Orchidcolor() -> UIColor                    { return UIColor(red:0.902, green:0.659, blue:0.843, alpha:1.0) }
    class func OrchidPearlcolor() -> UIColor               { return UIColor(red:0.482, green:0.259, blue:0.349, alpha:1.0) }
    class func OuterSpacecolor() -> UIColor                { return UIColor(red:0.255, green:0.290, blue:0.298, alpha:1.0) }
    class func OutrageousOrangecolor() -> UIColor          { return UIColor(red:1.000, green:0.431, blue:0.290, alpha:1.0) }
    class func PacificBluecolor() -> UIColor               { return UIColor(red:0.110, green:0.663, blue:0.788, alpha:1.0) }
    class func Peachcolor() -> UIColor                     { return UIColor(red:1.000, green:0.812, blue:0.671, alpha:1.0) }
    class func PearlyPurplecolor() -> UIColor              { return UIColor(red:0.718, green:0.408, blue:0.635, alpha:1.0) }
    class func Peridotcolor() -> UIColor                   { return UIColor(red:0.671, green:0.678, blue:0.282, alpha:1.0) }
    class func Periwinklecolor() -> UIColor                { return UIColor(red:0.773, green:0.816, blue:0.902, alpha:1.0) }
    class func PewterBluecolor() -> UIColor                { return UIColor(red:0.545, green:0.659, blue:0.718, alpha:1.0) }
    class func PiggyPinkcolor() -> UIColor                 { return UIColor(red:0.992, green:0.867, blue:0.902, alpha:1.0) }
    class func Pinecolor() -> UIColor                      { return UIColor(red:0.271, green:0.635, blue:0.490, alpha:1.0) }
    class func PineGreencolor() -> UIColor                 { return UIColor(red:0.082, green:0.502, blue:0.471, alpha:1.0) }
    class func PinkFlamingocolor() -> UIColor              { return UIColor(red:0.988, green:0.455, blue:0.992, alpha:1.0) }
    class func PinkPearlcolor() -> UIColor                 { return UIColor(red:0.690, green:0.439, blue:0.502, alpha:1.0) }
    class func PinkSherbertcolor() -> UIColor              { return UIColor(red:0.969, green:0.561, blue:0.655, alpha:1.0) }
    class func PixiePowdercolor() -> UIColor               { return UIColor(red:0.224, green:0.071, blue:0.522, alpha:1.0) }
    class func Plumcolor() -> UIColor                      { return UIColor(red:0.557, green:0.271, blue:0.522, alpha:1.0) }
    class func PlumpPurplecolor() -> UIColor               { return UIColor(red:0.349, green:0.275, blue:0.698, alpha:1.0) }
    class func PolishedPinecolor() -> UIColor              { return UIColor(red:0.365, green:0.643, blue:0.576, alpha:1.0) }
    class func PrincessPerfumecolor() -> UIColor           { return UIColor(red:1.000, green:0.522, blue:0.812, alpha:1.0) }
    class func PurpleHeartcolor() -> UIColor               { return UIColor(red:0.455, green:0.259, blue:0.784, alpha:1.0) }
    class func PurpleMountainsMajestycolor() -> UIColor    { return UIColor(red:0.616, green:0.506, blue:0.729, alpha:1.0) }
    class func PurplePizzazzcolor() -> UIColor             { return UIColor(red:0.996, green:0.306, blue:0.855, alpha:1.0) }
    class func PurplePlumcolor() -> UIColor                { return UIColor(red:0.612, green:0.318, blue:0.714, alpha:1.0) }
    class func QuickSilvercolor() -> UIColor               { return UIColor(red:0.651, green:0.651, blue:0.651, alpha:1.0) }
    class func RadicalRedcolor() -> UIColor                { return UIColor(red:1.000, green:0.286, blue:0.424, alpha:1.0) }
    class func RawSiennacolor() -> UIColor                 { return UIColor(red:0.839, green:0.541, blue:0.349, alpha:1.0) }
    class func RawUmbercolor() -> UIColor                  { return UIColor(red:0.443, green:0.294, blue:0.137, alpha:1.0) }
    class func RazzleDazzleRosecolor() -> UIColor          { return UIColor(red:1.000, green:0.282, blue:0.816, alpha:1.0) }
    class func Razzmatazzcolor() -> UIColor                { return UIColor(red:0.890, green:0.145, blue:0.420, alpha:1.0) }
    class func RazzmicBerrycolor() -> UIColor              { return UIColor(red:0.553, green:0.306, blue:0.522, alpha:1.0) }
    class func Redcolor2() -> UIColor                      { return UIColor(red:0.933, green:0.125, blue:0.302, alpha:1.0) }
    class func RedOrangecolor() -> UIColor                 { return UIColor(red:1.000, green:0.325, blue:0.286, alpha:1.0) }
    class func RedSalsacolor() -> UIColor                  { return UIColor(red:0.992, green:0.227, blue:0.290, alpha:1.0) }
    class func RedVioletcolor() -> UIColor                 { return UIColor(red:0.753, green:0.267, blue:0.561, alpha:1.0) }
    class func RobinsEggBluecolor() -> UIColor             { return UIColor(red:0.122, green:0.808, blue:0.796, alpha:1.0) }
    class func Rosecolor() -> UIColor                      { return UIColor(red:1.000, green:0.314, blue:0.314, alpha:1.0) }
    class func RoseDustcolor() -> UIColor                  { return UIColor(red:0.620, green:0.369, blue:0.435, alpha:1.0) }
    class func RosePearlcolor() -> UIColor                 { return UIColor(red:0.941, green:0.220, blue:0.396, alpha:1.0) }
    class func RoseQuartzcolor() -> UIColor                { return UIColor(red:0.741, green:0.333, blue:0.612, alpha:1.0) }
    class func RoyalPurplecolor() -> UIColor               { return UIColor(red:0.471, green:0.318, blue:0.663, alpha:1.0) }
    class func Rubycolor() -> UIColor                      { return UIColor(red:0.667, green:0.251, blue:0.412, alpha:1.0) }
    class func RustyRedcolor() -> UIColor                  { return UIColor(red:0.855, green:0.173, blue:0.263, alpha:1.0) }
    class func Salmoncolor() -> UIColor                    { return UIColor(red:1.000, green:0.608, blue:0.667, alpha:1.0) }
    class func SalmonPearlcolor() -> UIColor               { return UIColor(red:0.945, green:0.267, blue:0.290, alpha:1.0) }
    class func Sapphirecolor() -> UIColor                  { return UIColor(red:0.176, green:0.365, blue:0.631, alpha:1.0) }
    class func SasquatchSockscolor() -> UIColor            { return UIColor(red:1.000, green:0.275, blue:0.506, alpha:1.0) }
    class func Scarletcolor() -> UIColor                   { return UIColor(red:0.988, green:0.157, blue:0.278, alpha:1.0) }
    class func ScreaminGreencolor() -> UIColor             { return UIColor(red:0.463, green:1.000, blue:0.478, alpha:1.0) }
    class func SeaGreencolor() -> UIColor                  { return UIColor(red:0.624, green:0.886, blue:0.749, alpha:1.0) }
    class func SeaSerpentcolor() -> UIColor                { return UIColor(red:0.294, green:0.780, blue:0.812, alpha:1.0) }
    class func Sepiacolor() -> UIColor                     { return UIColor(red:0.647, green:0.412, blue:0.310, alpha:1.0) }
    class func Shadowcolor() -> UIColor                    { return UIColor(red:0.541, green:0.475, blue:0.365, alpha:1.0) }
    class func ShadowBluecolor() -> UIColor                { return UIColor(red:0.467, green:0.545, blue:0.647, alpha:1.0) }
    class func Shampoocolor() -> UIColor                   { return UIColor(red:1.000, green:0.812, blue:0.945, alpha:1.0) }
    class func Shamrockcolor() -> UIColor                  { return UIColor(red:0.271, green:0.808, blue:0.635, alpha:1.0) }
    class func SheenGreencolor() -> UIColor                { return UIColor(red:0.561, green:0.831, blue:0.000, alpha:1.0) }
    class func ShimmeringBlushcolor() -> UIColor           { return UIColor(red:0.851, green:0.525, blue:0.584, alpha:1.0) }
    class func ShinyShamrockcolor() -> UIColor             { return UIColor(red:0.373, green:0.655, blue:0.471, alpha:1.0) }
    class func ShockingPinkcolor() -> UIColor              { return UIColor(red:0.984, green:0.494, blue:0.992, alpha:1.0) }
    class func Silvercolor() -> UIColor                    { return UIColor(red:0.804, green:0.773, blue:0.761, alpha:1.0) }
    class func SizzlingRedcolor() -> UIColor               { return UIColor(red:1.000, green:0.220, blue:0.333, alpha:1.0) }
    class func SizzlingSunrisecolor() -> UIColor           { return UIColor(red:1.000, green:0.859, blue:0.000, alpha:1.0) }
    class func SkyBluecolor() -> UIColor                   { return UIColor(red:0.502, green:0.855, blue:0.922, alpha:1.0) }
    class func SlimyGreencolor() -> UIColor                { return UIColor(red:0.161, green:0.588, blue:0.090, alpha:1.0) }
    class func SmashedPumpkincolor() -> UIColor            { return UIColor(red:1.000, green:0.427, blue:0.227, alpha:1.0) }
    class func Smokecolor() -> UIColor                     { return UIColor(red:0.451, green:0.510, blue:0.463, alpha:1.0) }
    class func SmokeyTopazcolor() -> UIColor               { return UIColor(red:0.514, green:0.165, blue:0.051, alpha:1.0) }
    class func Soapcolor() -> UIColor                      { return UIColor(red:0.808, green:0.784, blue:0.937, alpha:1.0) }
    class func SonicSilvercolor() -> UIColor               { return UIColor(red:0.459, green:0.459, blue:0.459, alpha:1.0) }
    class func SpringFrostcolor() -> UIColor               { return UIColor(red:0.529, green:1.000, blue:0.165, alpha:1.0) }
    class func SpringGreencolor() -> UIColor               { return UIColor(red:0.925, green:0.918, blue:0.745, alpha:1.0) }
    class func SteelBluecolor() -> UIColor                 { return UIColor(red:0.000, green:0.506, blue:0.671, alpha:1.0) }
    class func SteelTealcolor() -> UIColor                 { return UIColor(red:0.373, green:0.541, blue:0.545, alpha:1.0) }
    class func Strawberrycolor() -> UIColor                { return UIColor(red:0.988, green:0.353, blue:0.553, alpha:1.0) }
    class func SugarPlumcolor() -> UIColor                 { return UIColor(red:0.569, green:0.306, blue:0.459, alpha:1.0) }
    class func SunburntCyclopscolor() -> UIColor           { return UIColor(red:1.000, green:0.251, blue:0.298, alpha:1.0) }
    class func Sunglowcolor() -> UIColor                   { return UIColor(red:1.000, green:0.812, blue:0.282, alpha:1.0) }
    class func SunnyPearlcolor() -> UIColor                { return UIColor(red:0.949, green:0.949, blue:0.478, alpha:1.0) }
    class func SunsetOrangecolor() -> UIColor              { return UIColor(red:0.992, green:0.369, blue:0.325, alpha:1.0) }
    class func SunsetPearlcolor() -> UIColor               { return UIColor(red:0.945, green:0.800, blue:0.475, alpha:1.0) }
    class func SweetBrowncolor() -> UIColor                { return UIColor(red:0.659, green:0.216, blue:0.192, alpha:1.0) }
    class func Tancolor() -> UIColor                       { return UIColor(red:0.980, green:0.655, blue:0.424, alpha:1.0) }
    class func TartOrangecolor() -> UIColor                { return UIColor(red:0.984, green:0.302, blue:0.275, alpha:1.0) }
    class func TealBluecolor() -> UIColor                  { return UIColor(red:0.094, green:0.655, blue:0.710, alpha:1.0) }
    class func Thistlecolor() -> UIColor                   { return UIColor(red:0.922, green:0.780, blue:0.875, alpha:1.0) }
    class func TickleMePinkcolor() -> UIColor              { return UIColor(red:0.988, green:0.537, blue:0.675, alpha:1.0) }
    class func TigersEyecolor() -> UIColor                 { return UIColor(red:0.710, green:0.412, blue:0.090, alpha:1.0) }
    class func Timberwolfcolor() -> UIColor                { return UIColor(red:0.859, green:0.843, blue:0.824, alpha:1.0) }
    class func TropicalRainForestcolor() -> UIColor        { return UIColor(red:0.090, green:0.502, blue:0.427, alpha:1.0) }
    class func Tulipcolor() -> UIColor                     { return UIColor(red:1.000, green:0.529, blue:0.553, alpha:1.0) }
    class func Tumbleweedcolor() -> UIColor                { return UIColor(red:0.871, green:0.667, blue:0.533, alpha:1.0) }
    class func TurquoiseBluecolor() -> UIColor             { return UIColor(red:0.467, green:0.867, blue:0.906, alpha:1.0) }
    class func TurquoisePearlcolor() -> UIColor            { return UIColor(red:0.231, green:0.737, blue:0.816, alpha:1.0) }
    class func TwilightLavendercolor() -> UIColor          { return UIColor(red:0.541, green:0.286, blue:0.420, alpha:1.0) }
    class func UnmellowYellowcolor() -> UIColor            { return UIColor(red:1.000, green:1.000, blue:0.400, alpha:1.0) }
    class func VioletBluecolor() -> UIColor                { return UIColor(red:0.196, green:0.290, blue:0.698, alpha:1.0) }
    class func VioletPurplecolor() -> UIColor              { return UIColor(red:0.573, green:0.431, blue:0.682, alpha:1.0) }
    class func VioletRedcolor() -> UIColor                 { return UIColor(red:0.969, green:0.325, blue:0.580, alpha:1.0) }
    class func VividTangerinecolor() -> UIColor            { return UIColor(red:1.000, green:0.627, blue:0.537, alpha:1.0) }
    class func VividVioletcolor() -> UIColor               { return UIColor(red:0.561, green:0.314, blue:0.616, alpha:1.0) }
    class func WildBlueYondercolor() -> UIColor            { return UIColor(red:0.635, green:0.678, blue:0.816, alpha:1.0) }
    class func WildStrawberrycolor() -> UIColor            { return UIColor(red:1.000, green:0.263, blue:0.643, alpha:1.0) }
    class func WildWatermeloncolor() -> UIColor            { return UIColor(red:0.988, green:0.424, blue:0.522, alpha:1.0) }
    class func WinterSkycolor() -> UIColor                 { return UIColor(red:1.000, green:0.000, blue:0.486, alpha:1.0) }
    class func WinterWizardcolor() -> UIColor              { return UIColor(red:0.627, green:0.902, blue:1.000, alpha:1.0) }
    class func WintergreenDreamcolor() -> UIColor          { return UIColor(red:0.337, green:0.533, blue:0.490, alpha:1.0) }
    class func Wisteriacolor() -> UIColor                  { return UIColor(red:0.804, green:0.643, blue:0.871, alpha:1.0) }
    class func Yellowcolor2() -> UIColor                   { return UIColor(red:0.988, green:0.910, blue:0.514, alpha:1.0) }
    class func YellowGreencolor() -> UIColor               { return UIColor(red:0.773, green:0.890, blue:0.518, alpha:1.0) }
    class func YellowOrangecolor() -> UIColor              { return UIColor(red:1.000, green:0.714, blue:0.325, alpha:1.0) }
    class func YellowSunshinecolor() -> UIColor            { return UIColor(red:1.000, green:0.969, blue:0.000, alpha:1.0) }

}