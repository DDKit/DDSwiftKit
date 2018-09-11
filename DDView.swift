//
//  DDView.swift
//  DDSwiftKit
//
//  Created by ztemap on 2018/9/11.
//

import UIKit

public extension UIView {
    public var x: CGFloat {
        set {
            var f = frame
            f.origin.x = newValue
            frame = f
        }
        get {
            return frame.origin.x
        }
    }
    
    
    public var y: CGFloat {
        set {
            var f = frame
            f.origin.y = newValue
            frame = f
        }
        get {
            return frame.origin.y
        }
    }
    
    public var width: CGFloat {
        set {
            var f = frame
            f.size.width = newValue
            frame = f
        }
        get {
            return frame.size.width
        }
    }
    
    public var height: CGFloat {
        set {
            var f = frame
            f.size.height = newValue
            frame = f
        }
        get {
            return frame.size.height
        }
    }
    
    public var size: CGSize {
        set {
            var f = frame
            f.size = newValue
            frame = f
        }
        get {
            return frame.size
        }
    }
    
    public var origin: CGPoint {
        set {
            var f = frame
            f.origin = newValue
            frame = f
        }
        get {
            return frame.origin
        }
    }
    
    public var corner: CGFloat {
        set {
            layer.masksToBounds = true
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    
    public func shadow()
    {
        self.clipsToBounds = false
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowOpacity = 0.3
        self.layer.shadowRadius = 6
    }

    public var borderColor: UIColor {
        set {
            layer.borderColor = newValue.cgColor
        }
        get {
            return  UIColor(cgColor: layer.borderColor!)
        }
    }
}

public extension UIImage {
    /**
     *  重设图片大小
     */
    func reSizeImage(reSize:CGSize)->UIImage {
        //UIGraphicsBeginImageContext(reSize);
        UIGraphicsBeginImageContextWithOptions(reSize,false,UIScreen.main.scale)
        draw(in: CGRect(origin: CGPoint.zero, size: reSize))
        let reSizeImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext();
        return reSizeImage;
    }
    
    /**
     *  等比率缩放
     */
    func scaleImage(scaleSize:CGFloat)->UIImage {
        let reSize = CGSize(width: size.width * scaleSize, height: size.height * scaleSize)
        return reSizeImage(reSize: reSize)
    }
}

public extension UIButton {
    // 上图下字button
    func upImageDownLabel(_ space: CGFloat = 0)
    {
        if imageView == nil || titleLabel == nil { return }
        let imageSize = imageView!.size
        var titleSize = titleLabel!.size
        titleSize.width = max(titleSize.width,titleLabel!.intrinsicContentSize.width)
        titleEdgeInsets = UIEdgeInsets(top: imageSize.height + space, left: -imageSize.width, bottom: -space, right: 0)
        imageEdgeInsets = UIEdgeInsets(top: -space, left: 0, bottom: 0, right: -titleSize.width)
    }
    
    // 左图右字
    func leftImageRightLabel(_ space: CGFloat = 0)
    {
        if imageView == nil || titleLabel == nil { return }
        let imageSize = imageView!.size
        var titleSize = titleLabel!.size
        titleSize.width = max(titleSize.width,titleLabel!.intrinsicContentSize.width)
        titleEdgeInsets = UIEdgeInsets(top: 0, left: -imageSize.width - space, bottom: 0, right: imageSize.width)
        imageEdgeInsets = UIEdgeInsets(top: 0, left: titleSize.width, bottom: 0, right: -titleSize.width)
    }
    
    // badge
    func badge(_ value: Int?) {
        if imageView == nil || titleLabel == nil { return }
        let badgeW: CGFloat = 20
        let imageSize = imageView!.size
        let imageX = imageView!.x
        let imageY = imageView!.y
        let badgeLable = UILabel()
        badgeLable.text = value == nil ? "" : "\(value!)"
        badgeLable.textAlignment = .center
        badgeLable.textColor = .white
        badgeLable.font = UIFont.systemFont(ofSize: 12)
        badgeLable.layer.masksToBounds = true
        badgeLable.layer.cornerRadius = badgeW * 0.5
        badgeLable.backgroundColor = .red
        
        let badgeX = imageX + imageSize.width - badgeW*0.5;
        let badgeY = imageY - badgeW*0.25;
        badgeLable.frame = CGRect(x: badgeX, y: badgeY, width: badgeW, height: badgeW)
        addSubview(badgeLable)
    }
    
}



