//
//  ViewController.swift
//  ABCircularProgressView
//
//  Created by Armando Brito on 02/07/2021.
//  Copyright (c) 2021 Armando Brito. All rights reserved.
//

import UIKit
import ABCircularProgressView

class ViewController: UIViewController {
    
    var progressView: ABCircularProgressView!
    
    var slider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressView = ABCircularProgressView(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 60, height: 60)), barColor: .systemBlue)
        progressView.setProgress(percentage: 75)
        view.addSubview(progressView)
        progressView.center = view.center
        
        slider = UISlider(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: view.bounds.width / 2, height: 50)))
        slider.setValue(0.75, animated: false)
        slider.addTarget(self, action: #selector(sliderChanged(sender:forEvent:)), for: .valueChanged)
        slider.isContinuous = true
        view.addSubview(slider)
        slider.frame = slider.frame.offsetBy(dx: slider.frame.width / 2, dy: progressView.frame.maxY + 25)
    }
    
    @objc func sliderChanged(sender: UISlider, forEvent event: UIEvent) {
        progressView.setProgress(sender.value)
    }

}

