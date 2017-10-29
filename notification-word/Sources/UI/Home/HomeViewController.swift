//
//  HomeViewController.swift
//  notification-word
//
//  Created by Takashima on 2017/09/01.
//  Copyright © 2017年 takattata. All rights reserved.
//

import UIKit

protocol HomeView: class {
    func reloadData()
    func updateFavoriteButtonSelected()
//    func showRepository(with repository: Repository)
}

class HomeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    private(set) lazy var presenter: HomePresenter = HomeViewPresenter(view: self)
    private lazy var dataSource = HomeViewDataSource.init(presenter: self.presenter)

    ///FIXME: get favorite state.
    private var favoriteButton: UIButton = UIButton()

    static func instantiate() -> HomeViewController {
        let storyboard = UIStoryboard(name: self.className, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: self.className) as! HomeViewController

        return viewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.separatorStyle = .none
        tableView.backgroundView = UIImageView(image: UIImage(named: "image_bg"))
        dataSource.configure(with: tableView)
        setupNavigation()
    }
}

extension HomeViewController {
    private func setupNavigation() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage.fontAwesomeIcon(name: .refresh, textColor: .systemBlue, size: CGSize(width: 36, height: 36)), style: .plain, target: self, action: #selector(HomeViewController.refreshButtonTap))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage.fontAwesomeIcon(name: .bug, textColor: .systemBlue, size: CGSize(width: 36, height: 36)), style: .plain, target: self, action: #selector(HomeViewController.resetUserDefaultsForDebug))

        ///FIXME: 機能解除
//        favoriteButton.addTarget(self, action: #selector(HomeViewController.favoriteButtonTap), for: .touchUpInside)
//        favoriteButton.setImage(UIImage.fontAwesomeIcon(name: .starO, textColor: .systemBlue, size: CGSize(width: 36, height: 36)), for: .normal)
//        favoriteButton.setImage(UIImage.fontAwesomeIcon(name: .star, textColor: .systemBlue, size: CGSize(width: 36, height: 36)), for: .selected)
//        favoriteButton.sizeToFit()
//
//        let icons: [UIBarButtonItem] = [
//            UIBarButtonItem(customView: favoriteButton),
//            UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(HomeViewController.shareButtonTap))
//        ]
//        navigationItem.rightBarButtonItems = icons
    }

    @objc private func refreshButtonTap(_ sender: UIBarButtonItem) {

    }

    ///FIXME: debug.
    @objc private func resetUserDefaultsForDebug(_ sender: UIBarButtonItem) {
        AlertManager().reset()
    }

    @objc private func favoriteButtonTap(_ sender: UIBarButtonItem) {
        presenter.favoriteButtonTap()
    }

    @objc private func shareButtonTap(_ sender: UIBarButtonItem) {

    }

    func updateFavoriteButtonSelected() {
        favoriteButton.isSelected = !favoriteButton.isSelected
    }
}

extension HomeViewController: HomeView {
    func reloadData() {

    }

    func setupWord(with: Word) {
        
    }
}
