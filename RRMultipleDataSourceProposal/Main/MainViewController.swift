//
//  MainViewController.swift
//  UniperReusableComponents
//
//  Created by Radoslav Radev on 9.07.20.
//  Copyright © 2020 Radoslav Radev. All rights reserved.
//

import UIKit

enum MainVCTableViewsId: Int {
    case happyEmojiTableView
    case sadEmojiTableView
}

class MainViewController: UIViewController {

    // MARK: - UI elements
    let mainStackView = UIStackView()
    let happyEmojiTableView = CustomTableView(tableViewId: MainVCTableViewsId.happyEmojiTableView.rawValue)
    let sadEmojiTableView = CustomTableView(tableViewId: MainVCTableViewsId.sadEmojiTableView.rawValue)
    
    // MARK: - Properties
    var viewModel: MainViewModelProtocol!

    // MARK: - Initial functions
    override func loadView() {
        super.loadView()
        setupUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView(tableView: happyEmojiTableView)
        setupTableView(tableView: sadEmojiTableView)
        registerCells()
        bindToViewModel(viewModel)
    }
    
    private func bindToViewModel(_ viewModel: MainViewModelProtocol) {
        setupTableViewReloader(viewModel)
    }
    
    // MARK: - Setup functions
    private func setupTableViewReloader(_ viewModel: MainViewModelProtocol) {
        viewModel.shouldReloadTableViewData.bindAndFire { [weak self] _ in
            self?.happyEmojiTableView.reloadData()
            self?.sadEmojiTableView.reloadData()
        }
    }
    
    private func setupUI() {
        mainStackView.axis = .vertical
        mainStackView.distribution = .fillEqually
        view.addPinnedSubview(mainStackView)
        
        mainStackView.addArrangedSubview(happyEmojiTableView)
        mainStackView.addArrangedSubview(sadEmojiTableView)
    }
    
    private func setupTableView(tableView: UITableView) {
        tableView.tableFooterView = UIView()
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.rowHeight = UITableView.automaticDimension
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }
    
    private func registerCells() {
        happyEmojiTableView.register(cellNames: "\(MainTableViewCell.self)")
        sadEmojiTableView.register(cellNames: "\(MainTableViewCell.self)")
    }
    
}

// MARK: - UITableViewDataSource
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfCells(for: tableView.tag, in: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let configurator = viewModel.viewConfigurator(for: tableView.tag, at: indexPath.row, in: indexPath.section) else { return UITableViewCell() }
        return tableView.configureCell(for: configurator, at: indexPath)
    }
}
