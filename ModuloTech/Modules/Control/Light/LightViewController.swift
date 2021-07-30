//
//  LightViewController.swift
//  ModuloTech
//
//  Created by Lucas Lee on 27/07/2021.
//  Copyright © 2021 Lucas Lee. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class LightViewController: UIViewController {
    
    var viewModel: LightViewModel!
    private let disposeBag = DisposeBag()
    private let kStepSlider: Float = 10
    
    @IBOutlet weak var slider: CustomSlider!
    @IBOutlet weak var switchLight: UISwitch!
    @IBOutlet weak var labelValue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.viewModel.light.subscribe(onNext: { [weak self] light in
            guard let self = self else { return }
            self.title = light?.deviceName
            self.switchLight.isOn = light?.mode == DeviceMode.onn.rawValue ? true : false
            self.slider.value = Float(light?.intensity ?? 0)
        }).disposed(by: disposeBag)
        
        self.switchLight.rx.isOn
            .bind(to: self.viewModel.lightMode)
            .disposed(by: disposeBag)
        
        self.slider.rx.value
            .bind(to: self.viewModel.intensity)
            .disposed(by: disposeBag)
        
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
        }.subscribe(onNext: { [weak self] value in
            guard let self = self else { return }
            self.slider.value = value
            self.labelValue.text = String(format: "%0.f", value)
        }).disposed(by: disposeBag)
        
        self.slider.transform = CGAffineTransform(rotationAngle: CGFloat(-Double.pi / 2))
    }
    
}
