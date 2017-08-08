//
//  DesignableButtonView.swift
//  IntroToDrawing
//
//  Created by Admin on 8/7/17.
//  Copyright © 2017 rusel95. All rights reserved.
//

import UIKit

//Draw:
// 1. define a path (tells CG about the line to trace)
// 2. stroke / fill

@IBDesignable class DesignableButtonView: UIButton {

    @IBInspectable var fillColor : UIColor = UIColor.green
    
    @IBInspectable var lineWidth : CGFloat = 3.0
    @IBInspectable var lineLong : CGFloat = 0.7
    
    @IBInspectable var isAddButton : Bool = true
    
    override func draw(_ rect: CGRect) {
        
        lineLong *= min(self.bounds.width, self.bounds.height) * 0.7
        
        //do the drawings here
        let path = UIBezierPath(ovalIn: rect)
        fillColor.setFill()
        
        path.fill()
        
        drawSign()
    }

    func drawSign() {
        drawHorizontalDash()
        if isAddButton {
            drawVerticalDash()
        }
    }
    
    
    
    func drawHorizontalDash() {
        
        let plusPath = UIBezierPath()
        plusPath.lineWidth = lineWidth
        
        plusPath.move(to: CGPoint(x: bounds.width / 2.0 - lineLong / 2, y: bounds.height / 2.0) )
        plusPath.addLine(to: CGPoint(x: bounds.width / 2.0 + lineLong / 2.0, y: bounds.height / 2.0) )
        
        UIColor.white.setStroke()
        plusPath.stroke()
    }
    
    func drawVerticalDash() {
        
        let plusPath = UIBezierPath()
        plusPath.lineWidth = lineWidth
        
        plusPath.move(to: CGPoint(x: bounds.width / 2.0, y:  bounds.height / 2.0 - lineLong / 2.0 ) )
        plusPath.addLine(to: CGPoint( x: bounds.width / 2.0, y:  bounds.height / 2.0 + lineLong / 2.0) )
        
        UIColor.white.setStroke()
        plusPath.stroke()
    }
    
    
}

// Draw on the UIView`s graphic context
//
