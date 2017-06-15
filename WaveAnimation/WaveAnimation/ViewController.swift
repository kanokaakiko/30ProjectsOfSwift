//
//  ViewController.swift
//  WaveAnimation
//
//  Created by Qi Xin on 8/6/2017.
//  Copyright © 2017 Omni_Hsin. All rights reserved.
//

import UIKit

struct SineParameter {
    
    var waveHeight = 0.0
    var waveSpeed = 0.0
    var waveIncrease = 0.0
    var wavePeriod = 0.0;
}

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
    @IBOutlet weak var waveView: WaveView!
    
    @IBOutlet weak var waveheight: UISlider!
    
    @IBOutlet weak var wavespeed: UISlider!
    
    @IBOutlet weak var waveincrease: UISlider!
    
    @IBOutlet weak var waveperiod: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        ///y=Asin（ωx+φ）+h
        
        let parameter = SineParameter(waveHeight: 140.0, waveSpeed: 0.1, waveIncrease: 50.0, wavePeriod: 1.0)
        self.configureWave(parameter)
    }

    func configureWave(_ parameter: SineParameter) {
        
        self.waveView.A = parameter.waveIncrease
        self.waveView.omega = parameter.wavePeriod
        self.waveView.fi = parameter.waveSpeed
        self.waveView.height = parameter.waveHeight
        
        self.waveView.createTimer()
    }
    
    @IBAction func changeWaveParameter(_ sender: Any) {
        
        let parameter = SineParameter(waveHeight: Double(self.waveheight.value), waveSpeed: Double(self.wavespeed.value), waveIncrease: Double(self.waveincrease.value), wavePeriod: Double(self.waveperiod.value))
        
        self.configureWave(parameter)
        
        self.display.text = String.init(format: "%.2f sin(%.2f x + %.2f) + %.2f" , self.waveincrease.value, self.waveperiod.value, self.wavespeed.value, self.waveheight.value)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

