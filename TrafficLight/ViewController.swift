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
    
    private let alphaValue: CGFloat = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redLightView.alpha = alphaValue
        yellowLightView.alpha = alphaValue
        greenLightView.alpha = alphaValue
        
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
            currentLight = LightColor.yellow
            redLightView.alpha = 1
            startButton.setTitle("NEXT", for: .normal)
        case .yellow:
            currentLight = LightColor.green
            redLightView.alpha = alphaValue
            yellowLightView.alpha = 1
        case .green:
            yellowLightView.alpha = alphaValue
            greenLightView.alpha = 1
        }
    }
}
