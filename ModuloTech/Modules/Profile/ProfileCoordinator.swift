//
//  ProfileCoordinator.swift
//  ModuloTech
//
//  Created by Lucas Lee on 27/07/2021.
//  Copyright © 2021 Lucas Lee. All rights reserved.
//

import UIKit
import RxSwift

class ProfileCoordinator: BaseCoordinator {
    
    var profileNavigationController: UINavigationController!
    private let disposeBag = DisposeBag()
    private let profileViewModel: ProfileViewModel
    
    init(profileViewModel: ProfileViewModel) {
        self.profileViewModel = profileViewModel
    }
    
    override func start() {
        setUpBindings()
        let profileViewController = ProfileViewController.loadFromNib()
        profileViewController.viewModel = self.profileViewModel
        profileNavigationController = UINavigationController(rootViewController: profileViewController)
        navigationController.present(profileNavigationController, animated: true)
    }
    
    private func didSaveProfile() {
        profileNavigationController.dismiss(animated: true, completion: nil)
        parentCoordinator?.didFinish(coordinator: self)
    }
    
    private func didDismissProfile() {
        parentCoordinator?.didFinish(coordinator: self)
    }
    
    private func setUpBindings() {
        self.profileViewModel.tapSaveProfile
//        .flatMapLatest({ [weak self] () -> Observable<User> in
//            guard let self = self else { return Observable.empty() }
//            return Observable.combineLatest(
//                self.profileViewModel.
//            )
//        })
            .subscribe(onNext: { _ in
                self.didSaveProfile()
            }).disposed(by: disposeBag)
        
        self.profileViewModel.tapDismiss
            .subscribe(onNext: { [weak self] _ in
                self?.didDismissProfile()
            }).disposed(by: disposeBag)
    }
    
}
