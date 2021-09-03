//
//  ViewController.swift
//  TrafficLight
//
//  Created by leila leila on 17.08.2021.
//

import UIKit

enum LightColor {
    case red , yellow, green
}

class ViewController: UIViewController {
    
    @IBOutlet weak var redLightView: UIView!
    @IBOutlet weak var yellowLightView: UIView!
    @IBOutlet weak var greenLightView: UIView!
    
    @IBOutlet weak var startButton: UIButton!
    
    private var currentLight = LightColor.red
    
    private var lightIsOn : CGFloat = 1
    private var lightIsOff : CGFloat = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.layer.cornerRadius = 10
        
        redLightView.alpha = lightIsOff
        yellowLightView.alpha = lightIsOff
        greenLightView.alpha = lightIsOff
    }
    
    override func viewDidLayoutSubviews() {
        redLightView.layer.cornerRadius =  redLightView.frame.width / 2
        yellowLightView.layer.cornerRadius = yellowLightView.frame.width / 2
        greenLightView.layer.cornerRadius = greenLightView.frame.width / 2
    }
    
    @IBAction func startButtonPressed() {
        if startButton.currentTitle == "START" {
            startButton.setTitle("NEXT", for: .normal)
        }
        
        switch currentLight {
        case .red:
            currentLight = .yellow
            redLightView.alpha = lightIsOn
            greenLightView.alpha = lightIsOff
        case .yellow:
            currentLight = .green
            redLightView.alpha = lightIsOff
            yellowLightView.alpha = lightIsOn
        case .green:
            yellowLightView.alpha = lightIsOff
            greenLightView.alpha = lightIsOn
            currentLight = .red
        }
    }
}

