//
//  HeaterViewController.swift
//  ModuloTech
//
//  Created by Lucas Lee on 27/07/2021.
//  Copyright © 2021 Lucas Lee. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class HeaterViewController: UIViewController {
    
    var viewModel: HeaterViewModel!
    private let disposeBag = DisposeBag()
    private let kStepSlider: Float = 5
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var switchHeater: UISwitch!
    @IBOutlet weak var labelValue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.viewModel.heater.subscribe(onNext: {  [weak self] heater in
            guard let self = self else { return }
            self.title = heater?.deviceName
            self.slider.value = Float(heater?.temperature ?? 0)
            self.switchHeater.isOn = heater?.mode == "ON" ? true : false
        }).disposed(by: disposeBag)
        
        self.slider.rx.value
            .map {[weak self] value -> Float in
                guard let self = self else { return value }
                let numberSteps = roundf(value/self.kStepSlider)
                let newValue = numberSteps * self.kStepSlider
                if newValue < self.slider.minimumValue {
                    return self.slider.minimumValue
                } else if newValue > self.slider.maximumValue {
                    return self.slider.maximumValue
                }
                return newValue
        }
        .subscribe(onNext: { [weak self] value in
            guard let self = self else { return }
            self.labelValue.text = String(format: "%0.f", value)
            self.slider.value = value
        }).disposed(by: disposeBag)
    }
    
}
