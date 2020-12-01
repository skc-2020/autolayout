//
//  SearchView.swift
//  autolayout
//
//  Created by AndUser on 30.11.2020.
//  Copyright © 2020 AndUser. All rights reserved.
//

import UIKit

final class SearchBar: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)

        translatesAutoresizingMaskIntoConstraints = false
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configuration

extension SearchBar {

    struct Model {
        let cornerRadius: CGFloat
        let backgroundColor: UIColor
        let searchBarStyle: UISearchBar.Style
        let textColor: UIColor
        let textFont: UIFont
    }

    func configure(with model: Model) {
        layer.cornerRadius = model.cornerRadius
        backgroundColor = model.backgroundColor
        searchBarStyle = model.searchBarStyle
//        searchTextField.textColor = 
    }
}
