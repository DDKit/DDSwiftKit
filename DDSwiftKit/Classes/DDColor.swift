//
//  DDColor.swift
//  DDSwiftKit
//
//  Created by ztemap on 2018/9/4.
//

import UIKit

public class DDColor: NSObject {
    open var red: UIColor = UIColor.red
    open var green: UIColor = UIColor.green
}

public extension UIColor {
    
    // rgb颜色工具 hexString
    public static func dd_color(_ hexString: String) -> UIColor {
        var hex = hexString.uppercased()
        if hex.hasPrefix("#") { hex = hex.replacingOccurrences(of: "#", with: "0X") }
        var rString: String = "FF"
        var gString: String = "FF"
        var bString: String = "FF"
        var aString: String = "FF"
        var r: UInt32 = 255
        var g: UInt32 = 255
        var b: UInt32 = 255
        var a: UInt32 = 255
        if hex.count == 5 {
            //0Xfff rgb
            rString = String(hex[String.Index(encodedOffset: 2)..<String.Index(encodedOffset: 3)])
            gString = String(hex[String.Index(encodedOffset: 3)..<String.Index(encodedOffset: 4)])
            bString = String(hex[String.Index(encodedOffset: 4)..<String.Index(encodedOffset: 5)])
            rString = rString + rString
            gString = gString + gString
            bString = bString + bString
            aString = "ff"
        } else if hex.count == 6 {
            //0Xffff rgba
            rString = String(hex[String.Index(encodedOffset: 2)..<String.Index(encodedOffset: 3)])
            gString = String(hex[String.Index(encodedOffset: 3)..<String.Index(encodedOffset: 4)])
            bString = String(hex[String.Index(encodedOffset: 4)..<String.Index(encodedOffset: 5)])
            aString = String(hex[String.Index(encodedOffset: 5)..<String.Index(encodedOffset: 6)])
            rString = rString + rString
            gString = gString + gString
            bString = bString + bString
            aString = aString + aString
        } else if hex.count == 8 {
            //0Xffffff rgb
            rString = String(hex[String.Index(encodedOffset: 2)..<String.Index(encodedOffset: 4)])
            gString = String(hex[String.Index(encodedOffset: 4)..<String.Index(encodedOffset: 6)])
            bString = String(hex[String.Index(encodedOffset: 6)..<String.Index(encodedOffset: 8)])
            aString = "ff"
        } else if hex.count == 10 {
            //0Xffffffff rgba
            rString = String(hex[String.Index(encodedOffset: 2)..<String.Index(encodedOffset: 4)])
            gString = String(hex[String.Index(encodedOffset: 4)..<String.Index(encodedOffset: 6)])
            bString = String(hex[String.Index(encodedOffset: 6)..<String.Index(encodedOffset: 8)])
            aString = String(hex[String.Index(encodedOffset: 8)..<String.Index(encodedOffset: 10)])
        }
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)
        Scanner(string: aString).scanHexInt32(&a)
        return UIColor(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: CGFloat(a)/255.0)
    }
    
    public static func dd_color(_ r: UInt8,_ g: UInt8,_ b: UInt8,_ a: UInt8) -> UIColor {
        return UIColor(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: CGFloat()/255.0)
    }
    
    // rgb颜色工具
    public static func dd_color(_ rString: String,_ gString: String,_ bString: String,_ aString: String) -> UIColor {
        var rStr: String = rString.uppercased().replacingOccurrences(of: "0X", with: "").replacingOccurrences(of: "#", with: "")
        var gStr: String = gString.uppercased().replacingOccurrences(of: "0X", with: "").replacingOccurrences(of: "#", with: "")
        var bStr: String = bString.uppercased().replacingOccurrences(of: "0X", with: "").replacingOccurrences(of: "#", with: "")
        var aStr: String = aString.uppercased().replacingOccurrences(of: "0X", with: "").replacingOccurrences(of: "#", with: "")
        
        
        
        rStr = rStr.count == 2 ? rStr : rStr + rStr
        gStr = gStr.count == 2 ? gStr : gStr + gStr
        bStr = bStr.count == 2 ? bStr : bStr + bStr
        aStr = aStr.count == 2 ? aStr : aStr + aStr
        var r: Int32 = 0xff
        var g: Int32 = 0xff
        var b: Int32 = 0xff
        var a: Int32 = 0xff
        Scanner(string: rStr).scanInt32(&r)
        Scanner(string: gStr).scanInt32(&g)
        Scanner(string: bStr).scanInt32(&b)
        Scanner(string: aStr).scanInt32(&a)
        return UIColor(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: CGFloat()/255.0)
    }
    
}


