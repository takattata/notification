//
//  ViewController.swift
//  notification-word
//
//  Created by Takashima on 2017/09/01.
//  Copyright © 2017年 takattata. All rights reserved.
//

import UIKit
import UserNotifications

class HomeViewController: UIViewController {
    enum Section: Int {
        case text
        case quotation

        case MAX_NUM
    }

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.separatorStyle = .none
            tableView.isScrollEnabled = false
        }
    }

    static func create() -> HomeViewController {
        let storyboard = UIStoryboard(name: Identifier.Storyboard.homeViweController, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: Identifier.Storyboard.homeViweController) as! HomeViewController

        return viewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let contents = UNMutableNotificationContent()
        contents.title = "This is title."
        contents.subtitle = "This is subtitle."
        contents.body = "This is body. \nHello world!"

        // トリガーの作成(5秒後に通知実行)
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10.0, repeats: false)

        // リクエストの作成
        let identifier = NSUUID().uuidString
        let request = UNNotificationRequest(identifier: identifier, content: contents, trigger: trigger)

        // リクエスト実行
        UNUserNotificationCenter.current().add(request){ error in
            if let error = error {
                print("Unable to add notification request, \(error.localizedDescription)")
            }
        }
    }
}

extension HomeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return Section.MAX_NUM.rawValue
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = Section(rawValue: indexPath.section)!

        switch section {
        case .text:
            let cell = tableView.dequeueReusableCell(withIdentifier: Identifier.Cell.textCell, for: indexPath) as! TextCell
            cell.configure()
            return cell
        case .quotation:
            let cell = tableView.dequeueReusableCell(withIdentifier: Identifier.Cell.quotationCell, for: indexPath) as! QuotationCell
            cell.configure()
            return cell
        default:
            return UITableViewCell()
        }
    }
}
