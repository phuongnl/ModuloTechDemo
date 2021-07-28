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
    
    var viewModel: HomeViewModel!
    private let disposeBag = DisposeBag()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.title = viewModel.title
        
        self.tableView.register(DeviceCell.self)
        self.tableView.hideEmptyCells()
        
        self.viewModel.devices
            .bind(to: tableView.rx.items) { tableview, row, item -> DeviceCell in
                let cell: DeviceCell = tableview.dequeueReusableCell(forIndexPath: IndexPath(row: row, section: 0))
                if let item = item as? Light {
                    cell.config(item: item)
                } else if let item = item as? RollerShutter {
                    cell.config(item: item)
                } else if let item = item as? Heater {
                    cell.config(item: item)
                }
                return cell
        }.disposed(by: disposeBag)
        
        self.tableView.rx.modelSelected(Light.self)
            .subscribe(onNext: { [weak self] lampe in
                
            })
            .disposed(by: disposeBag)
        self.tableView.rx.modelSelected(RollerShutter.self)
            .subscribe(onNext: { [weak self] voletRoulant in
                
            })
            .disposed(by: disposeBag)
        self.tableView.rx.modelSelected(Heater.self)
            .subscribe(onNext: { [weak self] radiateur in
                
            })
            .disposed(by: disposeBag)
    }
    
}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

