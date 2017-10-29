//
//  HomeViewDataSource.swift
//  notification-word
//
//  Created by Takashima on 2017/10/14.
//  Copyright © 2017年 takattata. All rights reserved.
//

import Foundation
import UIKit

final class HomeViewDataSource: NSObject {
    enum Section: Int {
        case word

        case MAX_NUM
    }

    private let presenter: HomePresenter

    init(presenter: HomePresenter) {
        self.presenter = presenter
    }

    func configure(with tableView: UITableView) {
        tableView.dataSource = self
///        tableView.delegate = self

        presenter.fetchWord()
    }
}

extension HomeViewDataSource: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return Section.MAX_NUM.rawValue
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = Section(rawValue: indexPath.section)!

        switch section {
        case .word:
            let cell = tableView.dequeueReusableCell(with: WordCell.self, for: indexPath)
            cell.backgroundColor = .clear
            cell.contentView.backgroundColor = .clear
            ///FIXME: なんかダサい.
            if let word = presenter.getWord() {
                cell.configure(title: word.text, quotation: word.quotation)
            }
            return cell
        default:
            return UITableViewCell()
        }
    }
}
