//
//  SettingViewController.swift
//  notification-word
//
//  Created by Takashima on 2017/09/28.
//  Copyright © 2017年 takattata. All rights reserved.
//

import Foundation
import UIKit

import UserNotifications

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

            tableView.register(cellType: AlertDateCell.self)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigation()
    }

    static func instantiate() -> SettingViewController {
        let storyboard = UIStoryboard(name: self.className, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: self.className) as! SettingViewController

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
            let cell = tableView.dequeueReusableCell(with: SettingDateCell.self, for: indexPath)
            cell.configure()
            return cell
        case .time:
            let cell = tableView.dequeueReusableCell(with: SettingTimeCell.self, for: indexPath) 
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
        ///FIXME: 反映されぬ... 
//        navigationItem.backBarButtonItem?.title = "戻る"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "保存", style: .done, target: self, action: #selector(SettingViewController.saveButtonTap(_:)))
    }

    private func saveData() {
        let contents = UNMutableNotificationContent()
        contents.title = "This is title."
//        contents.subtitle = "This is subtitle."
        contents.body = "This is body. \nHello world!"
        contents.sound = UNNotificationSound.default()

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10.0, repeats: false)

//        let date = DateComponents(month:7, day:7, hour:12, minute:0)
//        let trigger = UNCalendarNotificationTrigger.init(dateMatching: date, repeats: false)

//        let date = DateComponents(hour:8, minute:30)
//        let trigger = UNCalendarNotificationTrigger.init(dateMatching: date, repeats: true)

        let identifier = NSUUID().uuidString
        let request = UNNotificationRequest(identifier: identifier, content: contents, trigger: trigger)

        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Unable to add notification request, \(error.localizedDescription)")
            }
        }
    }

    private func popViewController() {
        navigationController?.popViewController(animated: true)
    }

    @objc private func saveButtonTap(_ sender: UIBarButtonItem) {
    }
}
