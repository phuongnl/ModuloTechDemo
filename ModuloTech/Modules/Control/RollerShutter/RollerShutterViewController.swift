//
//  RollerShutterViewController.swift
//  ModuloTech
//
//  Created by Lucas Lee on 27/07/2021.
//  Copyright © 2021 Lucas Lee. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class RollerShutterViewController: UIViewController {
    
    var viewModel: RollerShutterViewModel!
    private let disposeBag = DisposeBag()
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var labelValue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.viewModel.rollerShutter.subscribe(onNext: { [weak self] rollerShutter in
            guard let self = self else { return }
            self.title = rollerShutter?.deviceName
            self.slider.value = Float(rollerShutter?.position ?? 0)
        }).disposed(by: disposeBag)
        
        self.slider.rx.value
            .bind(to: self.viewModel.position)
            .disposed(by: disposeBag)
        
        self.slider.rx.value
            .subscribe(onNext: { value in
                self.labelValue.text = String(format: "%0.f", value)
            }).disposed(by: disposeBag)
    }
    
}
