//
//  HomeViewController.swift
//  ModuloTech
//
//  Created by Lucas Lee on 27/07/2021.
//  Copyright © 2021 Lucas Lee. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.

        self.tableView.register(DeviceCell.self)
        self.tableView.rx.modelSelected(Lampe.self)
            .subscribe(onNext: { [weak self] lampe in
                
            })
            .disposed(by: disposeBag)
        self.tableView.rx.modelSelected(VoletRoulant.self)
            .subscribe(onNext: { [weak self] voletRoulant in
                
            })
            .disposed(by: disposeBag)
        self.tableView.rx.modelSelected(Radiateur.self)
            .subscribe(onNext: { [weak self] radiateur in
                
            })
            .disposed(by: disposeBag)
    }
    
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: DeviceCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        return cell
    }
    
}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

