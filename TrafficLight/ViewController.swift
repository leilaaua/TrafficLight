//
//  ViewController.swift
//  TrafficLight
//
//  Created by leila leila on 17.08.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var redLightView: UIView!
    @IBOutlet weak var yellowLightView: UIView!
    @IBOutlet weak var greenLightView: UIView!
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redLightView.alpha = 0.3
        yellowLightView.alpha = 0.3
        greenLightView.alpha = 0.3
        
        redLightView.backgroundColor = .red
        yellowLightView.backgroundColor = .yellow
        greenLightView.backgroundColor = .green
        startButton.layer.cornerRadius = 10
        
    }
    
    override func viewDidLayoutSubviews() {
        redLightView.layer.cornerRadius =  redLightView.frame.width / 2
        yellowLightView.layer.cornerRadius = yellowLightView.frame.width / 2
        greenLightView.layer.cornerRadius = greenLightView.frame.width / 2
    }
    
    enum LightColor {
        case red , yellow, green
    }
    
    private var currentLight = LightColor.red
    
    @IBAction func startButtonPressed() {
        
        switch currentLight {
        case .red:
            currentLight = .yellow
            redLightView.alpha = 1
            greenLightView.alpha = 0.3
            startButton.setTitle("NEXT", for: .normal)
        case .yellow:
            currentLight = .green
            redLightView.alpha = 0.3
            yellowLightView.alpha = 1
        case .green:
            yellowLightView.alpha = 0.3
            greenLightView.alpha = 1
            currentLight = .red
        }
    }
}
