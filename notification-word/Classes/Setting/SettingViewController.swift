//
//  SettingViewController.swift
//  notification-word
//
//  Created by Takashima on 2017/09/28.
//  Copyright © 2017年 takattata. All rights reserved.
//

import Foundation
import UIKit

import RxCocoa
import RxSwift

class SettingViewController: UIViewController {
    enum Section: Int {
        case date
        case time

        case MAX_NUM
    }

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.separatorStyle = .none
            tableView.isScrollEnabled = false

            tableView.register(UINib(nibName: Identifier.Cell.alertDateCell, bundle: nil), forCellReuseIdentifier: Identifier.Cell.alertDateCell)
        }
    }
    ///FIXME: to presenter.
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigation()
    }

    static func create() -> SettingViewController {
        let storyboard = UIStoryboard(name: Identifier.Storyboard.settingViewController, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: Identifier.Storyboard.settingViewController) as! SettingViewController

        return viewController
    }
}

extension SettingViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return Section.MAX_NUM.rawValue
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = Section(rawValue: indexPath.section)!

        switch section {
        case .date:
            let cell = tableView.dequeueReusableCell(withIdentifier: Identifier.Cell.settingDateCell, for: indexPath) as! SettingDateCell
            cell.configure()
            return cell
        case .time:
            let cell = tableView.dequeueReusableCell(withIdentifier: Identifier.Cell.settingTimeCell, for: indexPath) as! SettingTimeCell
            cell.configure()
            return cell
        default:
            return UITableViewCell()
        }
    }
}

extension SettingViewController {
    private func setupNavigation() {
        navigationItem.title = "通知設定"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "保存", style: .done, target: self, action: nil)
        navigationItem.rightBarButtonItem?.rx.tap
            .subscribe(
                { [weak self] _ in
                    self?.saveData()
                    self?.popViewController()
                }
            ).addDisposableTo(disposeBag)
    }

    private func saveData() {
        ///FIXME:
        print(">>> test saved.")
    }

    private func popViewController() {
        navigationController?.popViewController(animated: true)
    }
}
