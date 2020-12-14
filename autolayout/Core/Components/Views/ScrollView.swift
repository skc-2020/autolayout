//
//  SearchView.swift
//  autolayout
//
//  Created by AndUser on 30.11.2020.
//  Copyright © 2020 AndUser. All rights reserved.
//

import UIKit

final class ScrollView: UIScrollView {

    // MARK: - Constants

    let containerView = ContainerView()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)

        translatesAutoresizingMaskIntoConstraints = false

        setupView()
        setupContainerView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configuration

extension ScrollView {

    struct Model {
        let cornerRadius: CGFloat
    }

    func configure(with model: Model) {
        layer.cornerRadius = model.cornerRadius
    }
}

extension ScrollView {

    func setupView() {
        self.addSubview(containerView)
    }

    func setupContainerView() {
        let constraint = containerView.heightAnchor.constraint(equalTo: self.heightAnchor)
        constraint.priority = .defaultLow

        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            containerView.topAnchor.constraint(equalTo: self.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            containerView.widthAnchor.constraint(equalTo: self.widthAnchor),
            constraint
        ])
    }
}
