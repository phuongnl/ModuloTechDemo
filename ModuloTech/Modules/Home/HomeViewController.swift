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
        
        self.setupProfile()
        self.setUpTableView()
    }
    
    func setupProfile() {
        let profileButton = UIBarButtonItem(image: Asset.profile.image, style: .plain, target: self.viewModel, action: #selector(self.viewModel.showProfile))
        self.navigationItem.rightBarButtonItem = profileButton
    }
    
    func setUpTableView() {
        self.tableView.register(DeviceCell.self)
        self.tableView.hideEmptyCells()
        
        self.viewModel.devices
            .bind(to: tableView.rx.items) { tableview, row, item -> DeviceCell in
                let cell: DeviceCell = tableview.dequeueReusableCell(forIndexPath: IndexPath(row: row, section: 0))
                if let item = item as? Device {
                    cell.config(item: item)
                }
                return cell
        }.disposed(by: disposeBag)
        
        self.tableView.rx.modelSelected(Any.self)
            .subscribe(onNext: { [weak self] device in
                switch device {
                case is Light:
                    self?.viewModel.didTapLight.onNext(())
                case is RollerShutter:
                    self?.viewModel.didTapRollerShutter.onNext(())
                case is Heater:
                    self?.viewModel.didTapHeater.onNext(())
                default:
                    break
                }
            }).disposed(by: disposeBag)
    }
    
}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

