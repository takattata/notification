//
//  HomeViewPresenter.swift
//  notification-word
//
//  Created by Takashima on 2017/10/14.
//  Copyright © 2017年 takattata. All rights reserved.
//

import Foundation

protocol HomePresenter: class {
    init(view: HomeView)
    func favoriteButtonTap()
    func shareButtonTap()
    func fetchWord()
    func getWord() -> Word?
}

final class HomeViewPresenter : HomePresenter {
    private weak var view: HomeView?
    private var word: Word?

    ///FIXME: 関数準備しなくてもgetterで事足りそう. 
    func getWord() -> Word? {
        return word
    }

    init(view: HomeView) {
        self.view = view
    }

    func favoriteButtonTap() {
        // idからfavorite検索.
        // あるならfavoriteを外す / ないならfavoriteを追加する.
        view?.updateFavoriteButtonSelected()
    }

    func shareButtonTap() {
        
    }

    func fetchWord() {
        ///FIXME: databaseから取得する.
        word = Word(id: 0, text: "test text", quotation: "test quotation")
    }
}
