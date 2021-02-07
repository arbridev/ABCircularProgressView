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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressView = ABCircularProgressView(frame: CGRect(x: 0, y: 0, width: 60, height: 60), barColor: .systemBlue)
        progressView.setProgress(percentage: 75)
        
        progressView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(progressView)
        
        progressView.center = view.center
    }

}

