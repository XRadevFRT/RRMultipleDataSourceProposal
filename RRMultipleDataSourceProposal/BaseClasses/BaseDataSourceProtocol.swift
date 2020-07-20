//
//  BaseDataSourceProtocol.swift
//  Skeleton
//
//  Created by Martin Vasilev on 14.11.18.
//  Copyright © 2018 Upnetix. All rights reserved.
//

import UIKit

protocol BaseDataSource {
    /// Provides the number of sections in your table/collection view
    /// Defaults to 1
    var numberOfSections: Int { get }
    
    /// Provides the number of table/collection view cells for the given section
    ///
    /// - Parameter section: The given section
    /// - Returns: The number of cells from the viewModel
    func numberOfCells(in section: Int) -> Int?
    
    /// Provides title for current section
    /// - Parameter section: The given section
    func titleForSection(_ section: Int) -> String?
    
    /// Provides the viewConfigurator for your configurable table/collection view cell
    ///
    /// - Parameter indexPath: The index path for the current cell
    /// - Returns: A configurator from the viewModel
    func viewConfigurator(at index: Int, in section: Int) -> ViewConfigurator?
    
    // ================================================================================
    func numberOfCells(for tableViewId: Int, in section: Int) -> Int?
    
    func viewConfigurator(for tableViewId: Int, at index: Int, in section: Int) -> ViewConfigurator?
}

extension BaseDataSource {
    
    var numberOfSections: Int {
        return 1
    }
    
    func titleForSection(_ section: Int) -> String? {
        return ""
    }
    
    func numberOfCells(for tableViewId: Int, in section: Int) -> Int? {
        return nil
    }
    
    func viewConfigurator(for tableViewId: Int, at index: Int, in section: Int) -> ViewConfigurator? {
        return nil
    }
    
    func numberOfCells(in section: Int) -> Int? {
        return nil
    }
    
    func viewConfigurator(at index: Int, in section: Int) -> ViewConfigurator? {
        return nil
    }
}
