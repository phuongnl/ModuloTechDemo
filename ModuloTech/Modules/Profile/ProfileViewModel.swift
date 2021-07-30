//
//  ProfileViewModel.swift
//  ModuloTech
//
//  Created by Lucas Lee on 27/07/2021.
//  Copyright © 2021 Lucas Lee. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ProfileViewModel: NSObject {

    private let disposeBag = DisposeBag()

    let title = L10n.profile
    let user = BehaviorRelay<User?>(value: nil)
    let tapSaveProfile = PublishSubject<Void>()
    let tapDismiss = PublishSubject<Void>()
    
    init(user: User) {
        self.user.accept(user)
    }
    
}
