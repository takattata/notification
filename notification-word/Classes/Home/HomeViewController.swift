//
//  ViewController.swift
//  notification-word
//
//  Created by Takashima on 2017/09/01.
//  Copyright © 2017年 takattata. All rights reserved.
//

import UIKit

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

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigation()
    }

    static func create() -> HomeViewController {
        let storyboard = UIStoryboard(name: Identifier.Storyboard.homeViweController, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: Identifier.Storyboard.homeViweController) as! HomeViewController

        return viewController
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

extension HomeViewController {
    private func setupNavigation() {
        let starIcon = UIImage.fontAwesomeIcon(name: .starO, textColor: .darkGray, size: CGSize(width: 36, height: 36))
        ///FIXME: シェアのアイコンはないっぽいけど、どう実装するの??.
        let shareIcon = UIImage.fontAwesomeIcon(name: .shareSquare, textColor: .darkGray, size: CGSize(width: 36, height: 36))

        let icons: [UIBarButtonItem] = [
            translateBarButtonItem(icon: starIcon),
            translateBarButtonItem(icon: shareIcon)
        ]

        navigationItem.rightBarButtonItems = icons
    }

    private func translateBarButtonItem(icon: UIImage) -> UIBarButtonItem {
        let button = UIButton()
        button.setImage(icon, for: .normal)
        button.sizeToFit()
        return UIBarButtonItem(customView: button)
    }
}
