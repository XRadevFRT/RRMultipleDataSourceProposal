//
//  MainViewModel.swift
//  UniperReusableComponents
//
//  Created by Radoslav Radev on 14.07.20.
//  Copyright © 2020 Radoslav Radev. All rights reserved.
//

import Foundation
import TwoWayBondage

class MainViewModel: MainViewModelProtocol {
    
    typealias EmojiCellConfigurator = BaseViewConfigurator<MainTableViewCell>
    
    // MARK: - Properties
    private var happyEmojisConfigurators: [ViewConfigurator] = []
    private let happyEmojis = ["😄", "😆", "😊", "😋", "🤗"]
    private var sadEmojisConfigurators: [ViewConfigurator] = []
    private let sadEmojis = ["☹️", "😔", "😩", "😟", "😢"]
    
    init() {
        createHappyEmojisConfigurators()
        createSadEmojisConfigurators()
    }
    
    // MARK: - Observables
    let shouldReloadTableViewData = Observable<Bool>()

    
    // MARK: - BaseDataSource
    func numberOfCells(for tableViewId: Int, in section: Int) -> Int? {
        switch MainVCTableViewsId(rawValue: tableViewId) {
        case .happyEmojiTableView:
            return happyEmojisConfigurators.count
        case .sadEmojiTableView:
            return sadEmojisConfigurators.count
        case .none:
            return nil
        }
    }
    
    func viewConfigurator(for tableViewId: Int, at index: Int, in section: Int) -> ViewConfigurator? {
        switch MainVCTableViewsId(rawValue: tableViewId) {
        case .happyEmojiTableView:
            return happyEmojisConfigurators[safeAt: index]
        case .sadEmojiTableView:
            return sadEmojisConfigurators[safeAt: index]
        case .none:
            return nil
        }
    }
    
    // MARK: - Configurators population
    private func createHappyEmojisConfigurators() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.happyEmojis.forEach { emoji in
                self.happyEmojisConfigurators.append(EmojiCellConfigurator(data: emoji))
            }
            self.shouldReloadTableViewData.value = true
        }
    }
    
    private func createSadEmojisConfigurators() {
        sadEmojis.forEach { emoji in
            sadEmojisConfigurators.append(EmojiCellConfigurator(data: emoji))
        }
        shouldReloadTableViewData.value = true
    }
}
