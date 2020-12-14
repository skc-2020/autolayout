//
//  RootView.swift
//  autolayout
//
//  Created by AndUser on 14.12.2020.
//  Copyright © 2020 AndUser. All rights reserved.
//

import UIKit

class RootView: UIView {

    // MARK: - Constants

    let searchBar = SearchBar()
    let scrollView = ScrollView()
    let containerView = ContainerView()
    let view = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)

        translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = customDarkColor

        self.addSubviews(views: searchBar,scrollView)

        configureSearchBar()
        setupScrollView()
        setupSearchBarConstraints()
    }

    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Configuration

    func configureSearchBar() {
        searchBar.configure(with:
        .init(text: "Поиск",
              cornerRadius: searchbarCornerRadius,
              backgroundColor: customDarkGrayColor,
              searchBarStyle: .minimal,
              textColor: .gray,
              textFont: .systemFont(ofSize: 19)))
    }

    func setupScrollView() {
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }

    func setupSearchBarConstraints() {
        NSLayoutConstraint.activate([
            searchBar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 18),
            searchBar.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -18),
            searchBar.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            searchBar.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
