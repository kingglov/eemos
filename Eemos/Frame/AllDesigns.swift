//
//  AllDesigns.swift
//  Empeiros
//
//  Created by Habibu Zaman on 7/18/19.
//  Copyright © 2019 Habibu Zaman. All rights reserved.
//

import UIKit




class GradientView1: UINavigationBar {
    
    @IBInspectable var startColor:   UIColor = .black { didSet { updateColors() }}
    @IBInspectable var endColor:     UIColor = .white { didSet { updateColors() }}
    @IBInspectable var startLocation: Double =   0.05 { didSet { updateLocations() }}
    @IBInspectable var endLocation:   Double =   0.95 { didSet { updateLocations() }}
    @IBInspectable var horizontalMode:  Bool =  false { didSet { updatePoints() }}
    @IBInspectable var diagonalMode:    Bool =  false { didSet { updatePoints() }}
    
    override public class var layerClass: AnyClass { return CAGradientLayer.self }
    
    var gradientLayer: CAGradientLayer { return layer as! CAGradientLayer }
    
    func updatePoints() {
        if horizontalMode {
            gradientLayer.startPoint = diagonalMode ? CGPoint(x: 1, y: 0) : CGPoint(x: 0, y: 0.5)
            gradientLayer.endPoint   = diagonalMode ? CGPoint(x: 0, y: 1) : CGPoint(x: 1, y: 0.5)
        } else {
            gradientLayer.startPoint = diagonalMode ? CGPoint(x: 0, y: 0) : CGPoint(x: 0.5, y: 0)
            gradientLayer.endPoint   = diagonalMode ? CGPoint(x: 1, y: 1) : CGPoint(x: 0.5, y: 1)
        }
    }
    func updateLocations() {
        gradientLayer.locations = [startLocation as NSNumber, endLocation as NSNumber]
    }
    func updateColors() {
        gradientLayer.colors    = [startColor.cgColor, endColor.cgColor]
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        updatePoints()
        updateLocations()
        updateColors()
    }
}

class GradientView: UIView {
    
    @IBInspectable var startColor:   UIColor = .black { didSet { updateColors() }}
    @IBInspectable var endColor:     UIColor = .white { didSet { updateColors() }}
    @IBInspectable var startLocation: Double =   0.05 { didSet { updateLocations() }}
    @IBInspectable var endLocation:   Double =   0.95 { didSet { updateLocations() }}
    @IBInspectable var horizontalMode:  Bool =  false { didSet { updatePoints() }}
    @IBInspectable var diagonalMode:    Bool =  false { didSet { updatePoints() }}
    
    override public class var layerClass: AnyClass { return CAGradientLayer.self }
    
    var gradientLayer: CAGradientLayer { return layer as! CAGradientLayer }
    
    func updatePoints() {
        if horizontalMode {
            gradientLayer.startPoint = diagonalMode ? CGPoint(x: 1, y: 0) : CGPoint(x: 0, y: 0.5)
            gradientLayer.endPoint   = diagonalMode ? CGPoint(x: 0, y: 1) : CGPoint(x: 1, y: 0.5)
        } else {
            gradientLayer.startPoint = diagonalMode ? CGPoint(x: 0, y: 0) : CGPoint(x: 0.5, y: 0)
            gradientLayer.endPoint   = diagonalMode ? CGPoint(x: 1, y: 1) : CGPoint(x: 0.5, y: 1)
        }
    }
    func updateLocations() {
        gradientLayer.locations = [startLocation as NSNumber, endLocation as NSNumber]
    }
    func updateColors() {
        gradientLayer.colors    = [startColor.cgColor, endColor.cgColor]
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        updatePoints()
        updateLocations()
        updateColors()
    }
}



@IBDesignable class Card: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 13
    @IBInspectable var shadowColor: UIColor? = UIColor.black
    
    @IBInspectable var shadowOffsetWidth: Int = 0
    @IBInspectable var shadowOffsetHeight: Int = 1
    
    @IBInspectable var shadowOpacity: Float = 0.3
    
    override func layoutSubviews() {
        layer.cornerRadius = cornerRadius
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight);
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        layer.shadowPath = shadowPath.cgPath
        layer.shadowOpacity = shadowOpacity
    }
}
@IBDesignable class ScocialMediaButtonRound : UIButton {
    
    @IBInspectable var startColor:   UIColor = .white { didSet { didMoveToWindow() }}
    @IBInspectable var brderwidth:   CGFloat = 1 { didSet { didMoveToWindow() }}
    
    override func didMoveToWindow() {
        
        self.layer.borderColor = startColor.cgColor
        self.layer.borderWidth = brderwidth
        self.layer.cornerRadius = self.frame.height / 2

    }
    
}
@IBDesignable class ButtonWhatsapp : UIButton {
    
    @IBInspectable var startColor:   UIColor = .white { didSet { didMoveToWindow() }}
    @IBInspectable var brderwidth:   CGFloat = 1 { didSet { didMoveToWindow() }}
    @IBInspectable var shadowOffsetWidth: Int = 0
     @IBInspectable var corner: CGFloat = 0
    @IBInspectable var shadowOffsetHeight: Int = 1
    @IBInspectable var shadowOpacity: Float = 0.3
    override func didMoveToWindow() {
        
        self.layer.borderColor = startColor.cgColor
        self.layer.borderWidth = brderwidth
        self.layer.cornerRadius = corner
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowRadius = 4
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width:0, height:1)
        self.layer.masksToBounds = false
        self.imageView?.layer.cornerRadius = corner
       
    }
    
}
@IBDesignable class ButtonRound : UIButton {
    
    @IBInspectable var startColor:   UIColor = .white { didSet { didMoveToWindow() }}
    @IBInspectable var brderwidth:   CGFloat = 1 { didSet { didMoveToWindow() }}
    @IBInspectable var shadowOffsetWidth: Int = 0
    @IBInspectable var shadowOffsetHeight: Int = 1
    @IBInspectable var shadowOpacity: Float = 0.3
    override func didMoveToWindow() {
        
        self.layer.borderColor = startColor.cgColor
        self.layer.borderWidth = brderwidth
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowRadius = 4
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width:0, height:1)
        self.layer.masksToBounds = false
       
    }
    
}

@IBDesignable class Button: UIButton {
   @IBInspectable var startColor:   UIColor = .white { didSet { didMoveToWindow() }}
    @IBInspectable var brderwidth:   CGFloat = 1 { didSet { didMoveToWindow() }}
    @IBInspectable var shadowOffsetWidth: Int = 0
    @IBInspectable var shadowOffsetHeight: Int = 1
    @IBInspectable var shadowOpacity: Float = 0.3
    override func didMoveToWindow() {
        
        self.layer.masksToBounds = true
        self.layer.borderColor = startColor.cgColor
        self.layer.borderWidth = brderwidth
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowRadius = 4
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize.zero // Use any CGSize
}
}
class RadioButton: UIButton {
    
     @IBInspectable var startColor:   UIColor = .white { didSet { didMoveToWindow() }}
       @IBInspectable var brderwidth:   CGFloat = 1 { didSet { didMoveToWindow() }}
       override func didMoveToWindow() {
           
          
           self.layer.borderWidth = brderwidth
           self.layer.cornerRadius = self.frame.height / 2
           self.layer.shadowColor = UIColor.darkGray.cgColor
           self.layer.shadowRadius = 4
           self.layer.shadowOpacity = 0.5
           self.layer.shadowOffset = CGSize(width: 0, height: 0)
            
       }
   
    var alternateButton:Array<RadioButton>?

    func unselectAlternateButtons(){
        if alternateButton != nil {
            self.isSelected = true

            for aButton:RadioButton in alternateButton! {
                aButton.isSelected = false
            }
        }else{
            toggleButton()
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        unselectAlternateButtons()
        super.touchesBegan(touches, with: event)
    }

    func toggleButton(){
        self.isSelected = !isSelected
    }

    override var isSelected: Bool {
        didSet {
            if isSelected {
                
                self.backgroundColor = UIColor.magenta
                self.layer.borderColor = UIColor.white.cgColor
            } else {
        
                self.backgroundColor = UIColor.white
                self.layer.borderColor = UIColor.magenta.cgColor
            }
        }
    }
}

@IBDesignable class LabelButton: UILabel {
       var onClick: () -> Void = {}
       override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
           onClick()
       }
   }


@IBDesignable class CircleCard : UIView {
    
    var circleLayer:CAShapeLayer!
   
    @IBInspectable var shadowColor: UIColor? = UIColor.black
    
    @IBInspectable var shadowOffsetWidth: Int = 0
    @IBInspectable var shadowOffsetHeight: Int = 0
    
    @IBInspectable var shadowOpacity: Float = 0.3
    
    override func layoutSubviews() {
        layer.cornerRadius = layer.frame.size.width / 2
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight);
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: layer.cornerRadius)
        layer.shadowPath = shadowPath.cgPath
        layer.shadowOpacity = shadowOpacity
    }
    
}


@IBDesignable class LoginTextField : UITextField {
    
    @IBInspectable var height:CGFloat = 50
    
    override func didMoveToWindow() {
        self.frame.size.height = height
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.masksToBounds = true
        self.layer.borderColor = UIColor(named: "profileTextBoxBg")?.cgColor
    }
}



/* ========================================================================== */

@IBDesignable class LocationTextField : UITextField {
    
  
    @IBInspectable var shadowOffsetWidth: Int = 0
    @IBInspectable var shadowOffsetHeight: Int = 1
    @IBInspectable var shadowOpacity: Float = 0.3
   
    
    override func didMoveToWindow() {

        //To apply Shadow
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 3.0
        self.layer.shadowOffset = CGSize.zero // Use any CGSize
        self.layer.shadowColor = UIColor.gray.cgColor

        
    }
}

@IBDesignable class CardHeader: UIView {
    
    override func layoutSubviews() {
        let cornerRadius: CGFloat = 13
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: [.topLeft,.topRight], cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}
@IBDesignable class AboutUsHeader: UIView {
    @IBInspectable var startColor:   UIColor = .black { didSet { updateColors() }}
    @IBInspectable var endColor:     UIColor = .white { didSet { updateColors() }}
    @IBInspectable var startLocation: Double =   0.05 { didSet { updateLocations() }}
    @IBInspectable var endLocation:   Double =   0.95 { didSet { updateLocations() }}
    @IBInspectable var horizontalMode:  Bool =  false { didSet { updatePoints() }}
    @IBInspectable var diagonalMode:    Bool =  false { didSet { updatePoints() }}
    
    override public class var layerClass: AnyClass { return CAGradientLayer.self }
    
    var gradientLayer: CAGradientLayer { return layer as! CAGradientLayer }
    
    func updatePoints() {
        if horizontalMode {
            gradientLayer.startPoint = diagonalMode ? CGPoint(x: 1, y: 0) : CGPoint(x: 0, y: 0.5)
            gradientLayer.endPoint   = diagonalMode ? CGPoint(x: 0, y: 1) : CGPoint(x: 1, y: 0.5)
        } else {
            gradientLayer.startPoint = diagonalMode ? CGPoint(x: 0, y: 0) : CGPoint(x: 0.5, y: 0)
            gradientLayer.endPoint   = diagonalMode ? CGPoint(x: 1, y: 1) : CGPoint(x: 0.5, y: 1)
        }
    }
    func updateLocations() {
        gradientLayer.locations = [startLocation as NSNumber, endLocation as NSNumber]
    }
    func updateColors() {
        gradientLayer.colors    = [startColor.cgColor, endColor.cgColor]
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        updatePoints()
        updateLocations()
        updateColors()
    
        let cornerRadius: CGFloat = 40
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: [.bottomLeft,.bottomRight], cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}



@IBDesignable class ProfileCircle : UIView {
    
    var circleLayer:CAShapeLayer!
    @IBInspectable var circleLayerColorLUIColor = UIColor.darkGray

    @IBInspectable var shadowColor: UIColor? = UIColor.black
    @IBInspectable var shadowOffsetWidth: Int = 0
    @IBInspectable var shadowOffsetHeight: Int = 1
    
    @IBInspectable var shadowOpacity: Float = 0.3
    
    override func layoutSubviews() {
        layer.cornerRadius = layer.frame.size.width / 2
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight);
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: layer.cornerRadius)
        layer.shadowPath = shadowPath.cgPath
        layer.shadowOpacity = shadowOpacity
        
        layer.borderWidth = 2.0
        layer.borderColor = UIColor.white.cgColor
    }
    
}


public extension  UITextField {

    
    func shake(horizantaly:CGFloat = 0  , Verticaly:CGFloat = 0) {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 5
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - horizantaly, y: self.center.y - Verticaly ))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + horizantaly, y: self.center.y + Verticaly ))
        
        
        self.layer.add(animation, forKey: "position")
        
    }
    
    func uncustomizeTextField(backGroundColor : UIColor ) {
        // change UIbutton propertie
        self.layer.cornerRadius = 7
        self.layer.borderWidth = 0.8
        self.layer.borderColor = backGroundColor.cgColor
        self.layer.shadowOpacity = 0.2
        self.layer.shadowRadius = 2
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
    
    
}
public extension  UITextView {

    
    func shake(horizantaly:CGFloat = 0  , Verticaly:CGFloat = 0) {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 5
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - horizantaly, y: self.center.y - Verticaly ))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + horizantaly, y: self.center.y + Verticaly ))
        
        
        self.layer.add(animation, forKey: "position")
        
    }
    
    func uncustomizeTextField(backGroundColor : UIColor ) {
        // change UIbutton propertie
        self.layer.cornerRadius = 7
        self.layer.borderWidth = 0.8
        self.layer.borderColor = backGroundColor.cgColor
        self.layer.shadowOpacity = 0.2
        self.layer.shadowRadius = 2
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
    
    
}
