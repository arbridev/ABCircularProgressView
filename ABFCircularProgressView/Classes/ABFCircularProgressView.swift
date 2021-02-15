//
//  ABFCircularProgressView.swift
//  ABFCircularProgressView
//
//  Created by Armando Brito on 2/14/21.
//

import UIKit

/// A progress view of circular shape.
public class ABFCircularProgressView: UIView {
    
    /// Color of the progress circle.
    public var progressColor: UIColor = .black
    
    /// Color of the track behind the progress circle.
    public var trackColor: UIColor = .clear
    
    /// Total progress of the task.
    private var progress: CGFloat = 0.0
    
    /// Initializes an instance of this class with default values.
    /// - Parameter frame: The rect where this view is placed.
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    /// Initializes an instance of this class with the provided values.
    /// - Parameters:
    ///   - frame: The rect where this view is placed.
    ///   - progressColor: Color of the progress circle.
    ///   - trackColor: Color of the track behind the progress. circle
    public init(frame: CGRect, progressColor: UIColor = .black, trackColor: UIColor = .clear) {
        super.init(frame: frame)
        self.progressColor = progressColor
        self.trackColor = trackColor
    }
    
    /// Initializes an instance of this class for the Interface Builder.
    /// - Parameter coder: Archives files for the Interface Builder.
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    /// Sets the progress for this view.
    /// - Parameter progress: The progress of this view from 0.0 to 1.0.
    public func setProgress(_ progress: Float) {
        self.progress = CGFloat(progress)
        self.setNeedsDisplay()
    }
    
    /// Sets the progress of this view as a percentage.
    /// - Parameter percentage: Progress of this view represented as a percentage.
    public func setProgress(percentage: Int) {
        self.progress = CGFloat(CGFloat(percentage) / 100)
        self.setNeedsDisplay()
    }
    
    /// Draws a circle with the specified values.
    /// - Parameters:
    ///   - radius: The radius of the circle used to define the arc.
    ///   - startAngle: The starting angle of the arc (measured in radians).
    ///   - endAngle: The end angle of the arc (measured in radians).
    ///   - color: The color of this circle.
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
    
    /// Draws the receiver’s image within the passed-in rectangle.
    /// - Parameter rect: The portion of the view’s bounds that needs to be updated.
    override public func draw(_ rect: CGRect) {
        super.draw(rect)
        self.layer.sublayers = nil
        drawCircle(radius: frame.width / 2, color: trackColor)
        drawCircle(radius: frame.width / 2, startAngle: 1.5 * .pi, endAngle: 1.5 * .pi + 2 * progress * .pi, color: progressColor)
        drawCircle(radius: frame.width / 2.5, color: .white)
    }
    
}
