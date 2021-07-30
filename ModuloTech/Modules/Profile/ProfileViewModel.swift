//
//  ProfileViewModel.swift
//  ModuloTech
//
//  Created by Lucas Lee on 27/07/2021.
//  Copyright © 2021 Lucas Lee. All rights reserved.
//

import UIKit
import RxSwift

class ProfileViewModel: NSObject {

    private let disposeBag = DisposeBag()

    let title = L10n.profile

    let user: PublishSubject<User> = PublishSubject()

    let devices = BehaviorSubject(value: [Any]())

}
