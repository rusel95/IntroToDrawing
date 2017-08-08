//
//  Counter.swift
//  IntroToDrawing
//
//  Created by Admin on 8/8/17.
//  Copyright © 2017 rusel95. All rights reserved.
//

import UIKit

@IBDesignable class Counter: UIView {

    let numberOfItems = 8

    @IBInspectable var counter: Int = 5 {
        didSet {
            if counter <= numberOfItems {
                setNeedsDisplay()
            }
        }
    }
    @IBInspectable var outlineColor: UIColor = UIColor.green
    @IBInspectable var outlineWidth: CGFloat = 5.0
    @IBInspectable var counterColor: UIColor = UIColor.brown
    @IBInspectable var arcWidth : CGFloat = 76
    
    override func draw(_ rect: CGRect) {
        
        let center = CGPoint(x: self.bounds.width / 2.0, y: self.bounds.height / 2.0)
        let diameter = min(self.bounds.width, self.bounds.height)
        
        let startAngle : CGFloat = 3 / 4 * CGFloat.pi
        let endAngle : CGFloat = CGFloat.pi / 4.0
        
        drawArc(center: center, radius: diameter / 2.0 - arcWidth / 2.0, arcWidth: arcWidth, startAngle: startAngle, endAngle: endAngle)
        
        drawOutline(center: center, radius: diameter / 2.0 - outlineWidth / 2.0, arcWidth: arcWidth, startAngle: startAngle, endAngle: endAngle)
    }
    
    private func drawArc(center: CGPoint, radius: CGFloat, arcWidth: CGFloat, startAngle: CGFloat, endAngle: CGFloat) {
        let path = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        path.lineWidth = arcWidth
        counterColor.setStroke()
        path.stroke()
    }
    
    private func drawOutline(center: CGPoint, radius: CGFloat, arcWidth: CGFloat, startAngle: CGFloat, endAngle: CGFloat) {
        let angleDifference: CGFloat = 2 * CGFloat.pi - startAngle + endAngle
        let arcLenthPerItem = angleDifference / CGFloat(numberOfItems)
        
        let outlineEndAngle = arcLenthPerItem * CGFloat(counter) + startAngle
        
        let outlinePath = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: outlineEndAngle, clockwise: true)
        outlinePath.addArc(withCenter: center, radius: radius - arcWidth + outlineWidth, startAngle: outlineEndAngle, endAngle: startAngle, clockwise: false)
        outlinePath.close()
        
        outlineColor.setStroke()
        outlinePath.lineWidth = outlineWidth
        outlinePath.stroke()
    }
    
    
}
