//
//  ScheduleWidgetView.swift
//  autolayout
//
//  Created by AndUser on 02.12.2020.
//  Copyright © 2020 AndUser. All rights reserved.
//

import UIKit

final class ScheduleWidgetView: UITableView {

    override init(frame: CGRect, style: Style) {
        super.init(frame: frame, style: style  )
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - Configuration

extension ScheduleWidgetView {

    struct Model {
        let delegate: UITableViewDelegate
        let dataSource: UITableViewDataSource
        let cornerRadius: CGFloat
    }

    func configure(with model: Model) {
        delegate = model.delegate
        dataSource = model.dataSource
        layer.cornerRadius = model.cornerRadius
    }
}
