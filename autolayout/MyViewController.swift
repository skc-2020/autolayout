//
//  MyViewController.swift
//  autolayout
//
//  Created by AndUser on 14.11.2020.
//  Copyright © 2020 AndUser. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {

    // - 1ST LAYER
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.text = "Поиск"
        searchBar.searchTextField.textColor = .gray
        searchBar.searchBarStyle = .minimal
        searchBar.backgroundColor = .init(red: 0.278, green: 0.278, blue: 0.286, alpha: 1)
        searchBar.setPositionAdjustment(.init(horizontal: 140, vertical: 0), for: .search)
        searchBar.layer.cornerRadius = 15
        searchBar.searchTextField.font = .systemFont(ofSize: 19)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()

    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // - 2ND LAYER

    private lazy var backgroundView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // - 3RD LAYER
    let weatherView: WeatherView = WeatherView()
//    weatherView.configure()
//    private lazy var weatherView: UIView = {
//        let weatherView = UIView()
//        weatherView.layer.cornerRadius = 20
//        weatherView.translatesAutoresizingMaskIntoConstraints = false
//        weatherView.backgroundColor = .init(red: 0.401, green: 0.465, blue: 0.541, alpha: 1)
//        return weatherView
//    }()

    private lazy var watchView: UIScrollView = {
        let watchView = UIScrollView()
        watchView.translatesAutoresizingMaskIntoConstraints = false
        watchView.backgroundColor = .init(red: 0.510, green: 0.549, blue: 0.576, alpha: 1)
        return watchView
    }()

    private lazy var cellularWidgetView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .init(red: 0.263, green: 0.791, blue: 0.373, alpha: 1)
        return view
    }()

    private lazy var tableView: UIScrollView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubviews(views:
            searchBar,
            scrollView
        )

        setupSearchView()
        setupScrollView()
        setupBackgroundView()
        setupWeatherView()
        setupRootView()
        setupWatchView()
        setupCellWidgetView()
        setupTableView()
    }
    
    func setupRootView() {
        view.backgroundColor = .init(red: 0.094, green: 0.094, blue: 0.102, alpha: 1) // makes safe area dark
    }

    func setupSearchView() {
        NSLayoutConstraint.activate([
            searchBar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 18),
            searchBar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -18),
            searchBar.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            searchBar.heightAnchor.constraint(equalToConstant: 50)
        ])

        weatherView.configure(with:
            .init(cornerRadius: 20,
                  backgroundColor: .init(red: 0.401, green: 0.465, blue: 0.541, alpha: 1)
            )
        )
    }

    func setupScrollView() {
        NSLayoutConstraint.activate([
//            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
//            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
//            scrollView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
//            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }

    func setupBackgroundView() {
        NSLayoutConstraint.activate([
            backgroundView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            backgroundView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])

        backgroundView.addSubviews(
            views:
            weatherView,
            watchView,
            cellularWidgetView,
            tableView
        )
    }

    func setupWeatherView() { // pin to backgroundView
        NSLayoutConstraint.activate([
            weatherView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 18),
            weatherView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -18),
            weatherView.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 8),
            weatherView.heightAnchor.constraint(equalToConstant: 376)
        ])
    }

    func setupWatchView() {// pin to backgroundView
        NSLayoutConstraint.activate([
            watchView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 18),//1
            watchView.trailingAnchor.constraint(equalTo: cellularWidgetView.leadingAnchor, constant: -18),//3
            watchView.topAnchor.constraint(equalTo: weatherView.bottomAnchor, constant: 18),//2
//            watchView.bottomAnchor.constraint(equalTo: tableView.topAnchor, constant: -18),//7
//            watchView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),//7
            watchView.widthAnchor.constraint(equalTo: watchView.heightAnchor)
        ])
    }

    func setupCellWidgetView() {// pin to backgroundView
        NSLayoutConstraint.activate([
            cellularWidgetView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -18),
            cellularWidgetView.topAnchor.constraint(equalTo: weatherView.bottomAnchor, constant: 18),
            cellularWidgetView.widthAnchor.constraint(equalTo: watchView.widthAnchor),
            cellularWidgetView.heightAnchor.constraint(equalTo: watchView.heightAnchor)
        ])
    }

    func setupTableView() {// pin to backgroundView
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 18),
            tableView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -18),
            tableView.topAnchor.constraint(equalTo: watchView.bottomAnchor, constant: 18),
//            tableView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
            tableView.heightAnchor.constraint(equalToConstant: 340)
        ])
    }

}

extension UIView {
    func addSubviews(views: UIView...) {
        for view in views {
            self.addSubview(view)
        }
    }
}
