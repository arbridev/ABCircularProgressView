//
//  ABCircularProgressView.swift
//  ABCircularProgressView
//
//  Created by Armando Brito on 2/7/21.
//

import UIKit

public class ABCircularProgressView: UIView {
    
    public var barColor: UIColor = .black
    public var barBackColor: UIColor = .clear
    private var progress: CGFloat = 0.0
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public init(frame: CGRect, barColor: UIColor = .black, barBackColor: UIColor = .clear) {
        super.init(frame: frame)
        self.barColor = barColor
        self.barBackColor = barBackColor
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public func setProgress(_ progress: Float) {
        self.progress = CGFloat(progress)
        self.setNeedsDisplay()
    }
    
    public func setProgress(percentage: Int) {
        self.progress = CGFloat(CGFloat(percentage) / 100)
        self.setNeedsDisplay()
    }
    
    private func drawCircle(radius: CGFloat, startAngle: CGFloat = .pi, endAngle: CGFloat = 4 * .pi, color: UIColor = .black) {
        let center = CGPoint(x: bounds.width/2, y: bounds.height/2)
        let bezierPath = UIBezierPath()
        bezierPath.move(to: center)
        bezierPath.addArc(withCenter: center,
                          radius: radius,
                          startAngle: startAngle,
                          endAngle: endAngle,
                          clockwise: true)
        bezierPath.close()
        let circle = CAShapeLayer()
        circle.path = bezierPath.cgPath
        circle.fillColor = color.cgColor
        self.layer.addSublayer(circle)
    }
    
    override public func draw(_ rect: CGRect) {
        super.draw(rect)
        self.layer.sublayers = nil
        drawCircle(radius: frame.width / 2, color: barBackColor)
        drawCircle(radius: frame.width / 2, startAngle: 1.5 * .pi, endAngle: 1.5 * .pi + 2 * progress * .pi, color: barColor)
        drawCircle(radius: frame.width / 2.5, color: .white)
    }
    
}
