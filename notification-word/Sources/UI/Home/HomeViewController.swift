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

    @IBOutlet weak var tableView: UITableView!
    ///FIXME: get favorite state.
    private var isFavoriteForTest = true
    private var favoriteButton: UIButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        configure(with: tableView)
        setupNavigation()
    }

    static func instantiate() -> HomeViewController {
        let storyboard = UIStoryboard(name: self.className, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: self.className) as! HomeViewController

        return viewController
    }

    private func configure(with: UITableView) {
        tableView.dataSource = self
        tableView.separatorStyle = .none
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
            let cell = tableView.dequeueReusableCell(with: TextCell.self, for: indexPath)
            cell.configure()
            return cell
        case .quotation:
            let cell = tableView.dequeueReusableCell(with: QuotationCell.self, for: indexPath)
            cell.configure()
            return cell
        default:
            return UITableViewCell()
        }
    }
}

extension HomeViewController {
    private func setupNavigation() {
        favoriteButton.addTarget(self, action: #selector(HomeViewController.favoriteButtonTap), for: .touchUpInside)
        favoriteButton.setImage(UIImage.fontAwesomeIcon(name: .starO, textColor: .systemBlue, size: CGSize(width: 36, height: 36)), for: .normal)
        favoriteButton.setImage(UIImage.fontAwesomeIcon(name: .star, textColor: .systemBlue, size: CGSize(width: 36, height: 36)), for: .selected)
        favoriteButton.sizeToFit()

        let icons: [UIBarButtonItem] = [
            UIBarButtonItem(customView: favoriteButton),
            UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(HomeViewController.shareButtonTap))
        ]

        navigationItem.rightBarButtonItems = icons
    }

    @objc private func favoriteButtonTap(_ sender: UIBarButtonItem) {
        isFavoriteForTest = !isFavoriteForTest
        favoriteButton.isSelected = isFavoriteForTest
    }

    @objc private func shareButtonTap(_ sender: UIBarButtonItem) {

    }
}