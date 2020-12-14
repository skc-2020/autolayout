//
//  SchedulerTableView.swift
//  autolayout
//
//  Created by AndUser on 08.12.2020.
//  Copyright © 2020 AndUser. All rights reserved.
//

import UIKit

final class SchedulerTableView: UITableView {

    override init(frame: CGRect, style: Style) {
        super.init(frame: frame, style: style  )

        self.layer.cornerRadius = 25
        configureSchedulerTableView()
        translatesAutoresizingMaskIntoConstraints = false
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configuration

extension SchedulerTableView {

    struct Model {
        let delegate: UITableViewDelegate
        let dataSource: UITableViewDataSource
    }

    func configure(with model: Model) {
        delegate = model.delegate
        dataSource = model.dataSource
    }
}

extension SchedulerTableView {
    func configureSchedulerTableView() {
        self.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
}
