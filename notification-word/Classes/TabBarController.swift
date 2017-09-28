//
//  TabBarController.swift
//  notification-word
//
//  Created by Takashima on 2017/09/28.
//  Copyright © 2017年 takattata. All rights reserved.
//

import Foundation
import UIKit

import FontAwesome_swift

class TabBarController: UITabBarController {
    private var previousViewController: UIViewController?

    let home = HomeViewController.create()
    let setting = SettingListViewController.create()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self

        let home = UINavigationController(rootViewController: self.home)
        home.tabBarItem.title = "ホーム"
        home.tabBarItem.image = UIImage.fontAwesomeIcon(name: .home, textColor: .gray, size: CGSize(width: 42, height: 42))
        home.tabBarItem.image = UIImage.fontAwesomeIcon(name: .home, textColor: .darkGray, size: CGSize(width: 42, height: 42))

        let setting = UINavigationController(rootViewController: self.setting)
        setting.tabBarItem.title = "設定"
        setting.tabBarItem.image = UIImage.fontAwesomeIcon(name: .cog, textColor: .gray, size: CGSize(width: 42, height: 42))
        setting.tabBarItem.image = UIImage.fontAwesomeIcon(name: .cog, textColor: .darkGray, size: CGSize(width: 42, height: 42))

        viewControllers = [home, setting]
    }
}

extension TabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if previousViewController == viewController {
            if let navigation = viewController as? UINavigationController,
                let target = navigation.viewControllers.first {
                guard let tableView = target.view.subviews.first as? UITableView else {
                    return
                }

                tableView.scrollRectToVisible(CGRect(x: 0, y: 0, width: 1, height: 1), animated: true)
            }
        }

        previousViewController = viewController
    }
}
