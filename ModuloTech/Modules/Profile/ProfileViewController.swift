//
//  ProfileViewController.swift
//  ModuloTech
//
//  Created by Lucas Lee on 27/07/2021.
//  Copyright © 2021 Lucas Lee. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ProfileViewController: UIViewController {
    
    var viewModel: ProfileViewModel!
    private let disposeBag = DisposeBag()
    
    @IBOutlet weak var textFieldFirstName: UITextField!
    @IBOutlet weak var textieldLastName: UITextField!
    @IBOutlet weak var textFieldCity: UITextField!
    @IBOutlet weak var textFieldPostalCode: UITextField!
    @IBOutlet weak var textFieldStreet: UITextField!
    @IBOutlet weak var textFieldStreetCode: UITextField!
    @IBOutlet weak var textFieldCountry: UITextField!
    @IBOutlet weak var textFieldBirthDate: UITextField!
    @IBOutlet weak var buttonSave: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.title = viewModel.title
        
        self.viewModel.user.subscribe(onNext: { [weak self] user in
            guard let user = user, let self = self else { return }
            self.textFieldFirstName.text = user.firstName
            self.textieldLastName.text = user.lastName
            self.textFieldCity.text = user.address.city
            self.textFieldPostalCode.text = String(user.address.postalCode)
            self.textFieldStreet.text = user.address.street
            self.textFieldStreetCode.text = user.address.streetCode
            self.textFieldCountry.text = user.address.country
            self.textFieldBirthDate.text = self.formatDate(timeInterval: user.birthDate)
        }).disposed(by: disposeBag)
        
        self.buttonSave.rx.tap.subscribe(onNext: { [weak self] _ in
            self?.viewModel.tapSaveProfile.onNext(())
        }).disposed(by: disposeBag)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.viewModel.tapDismiss.onNext(())
    }
    
    func formatDate(timeInterval: TimeInterval) -> String {
        let date = Date(timeIntervalSince1970: timeInterval)
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
        return formatter.string(from: date)
    }
    
}
