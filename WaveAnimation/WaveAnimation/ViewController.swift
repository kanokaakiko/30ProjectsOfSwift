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
        
        let parameter = SineParameter(waveHeight: Double(self.waveheight.value * 320), waveSpeed: Double(self.wavespeed.value), waveIncrease: Double(self.waveincrease.value * 100), wavePeriod: Double(self.waveperiod.value))
        
        self.configureWave(parameter)
        
    }
    
    @IBAction func changeWaveSpeed(_ sender: Any) {
        
    }
    
    @IBAction func changeWaveInscrease(_ sender: Any) {
        
    }
    
    @IBAction func changeWavePeriod(_ sender: Any) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

