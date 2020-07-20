//
//  MainViewModelProtocol.swift
//  UniperReusableComponents
//
//  Created by Radoslav Radev on 14.07.20.
//  Copyright © 2020 Radoslav Radev. All rights reserved.
//

import TwoWayBondage

protocol MainViewModelProtocol: BaseDataSource {
    
    /// Observes for data source changes and reloads the table view when needed
    var shouldReloadTableViewData: Observable<Bool> { get }
}
