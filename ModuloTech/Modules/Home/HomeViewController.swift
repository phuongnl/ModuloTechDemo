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
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.title = viewModel.title
        
        self.setupProfile()
        self.setUpTableView()
        self.setupSearchBar()
    }
    
    func setupSearchBar() {
        let searchResults = self.searchBar.rx.text
            .orEmpty
            .throttle(.microseconds(300), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .flatMapLatest { [weak self] query -> Observable<[Any]> in
                guard let self = self else { return .just([]) }
                if query.isEmpty {
                    return self.viewModel.devices
                }
                // Can't use filter
                var filteredDevices = [Any]()
                self.viewModel.devices
                    .subscribe(onNext: { devices in
                        for case let item as Device in devices {
                            if item.productType.lowercased().contains(query.lowercased()) {
                                filteredDevices.append(item)
                            }
                        }
                    }).disposed(by: self.disposeBag)
                return .just(filteredDevices)
        }.observe(on: MainScheduler.instance)
        
        searchResults.bind(to: tableView.rx.items) { tableview, row, item -> DeviceCell in
            let cell: DeviceCell = tableview.dequeueReusableCell(forIndexPath: IndexPath(row: row, section: 0))
            if let item = item as? Device {
                cell.config(item: item)
            }
            return cell
        }.disposed(by: disposeBag)
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
        
        self.tableView.rx.itemDeleted
            .subscribe(onNext: { indexPath in
                do {
                    var tempDevices = try self.viewModel.devices.value()
                    tempDevices.remove(at: indexPath.row)
                    self.viewModel.devices.onNext(tempDevices)
                }    catch {
                    log.error(error)
                }
            }).disposed(by: disposeBag)
    }
    
}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
