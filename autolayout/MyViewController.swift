//
//  MyViewController.swift
//  autolayout
//
//  Created by AndUser on 14.11.2020.
//  Copyright © 2020 AndUser. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {

    private let searchBar: UISearchBar = {
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

//    private let searchView: UIScrollView = {
//        let searchView = UIScrollView()
//        searchView.translatesAutoresizingMaskIntoConstraints = false
//        searchView.backgroundColor = .init(red: 0.094, green: 0.094, blue: 0.102, alpha: 1)
//        return searchView
//    }()

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        print(scrollView.description)
        return scrollView
    }()

    private let weatherView: UIView = {
        let weatherView = UIView()
        weatherView.layer.cornerRadius = 20
        weatherView.translatesAutoresizingMaskIntoConstraints = false
        weatherView.backgroundColor = .init(red: 0.401, green: 0.465, blue: 0.541, alpha: 1)
        return weatherView
    }()

    private let watchView: UIScrollView = {
        let watchView = UIScrollView()
        watchView.translatesAutoresizingMaskIntoConstraints = false
        watchView.backgroundColor = .init(red: 0.510, green: 0.549, blue: 0.576, alpha: 1)
        return watchView
    }()

    private let cellularWidgetView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .init(red: 0.263, green: 0.791, blue: 0.373, alpha: 1)
        return view
    }()

    private let tableView: UIScrollView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
//        tableView.backgroundColor =
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubviews(views: [
            searchBar,
            scrollView,
            weatherView,
            watchView,
            cellularWidgetView,
            tableView
        ])
//        scrollView.addSubview(weatherView) // error!!
        
        setupSearchView()
        setupScrollView()
        setupWeatherView()
        setupRootView()
        setupWatchView()
        setupCellWidgetView()
        setupTableView()
        print(view.debugDescription)
        print(view.description)

    }
    
    func setupRootView() {
        view.backgroundColor = .init(red: 0.094, green: 0.094, blue: 0.102, alpha: 1) // makes safe area dark
    }

    func setupSearchView() {
        NSLayoutConstraint.activate([
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18),
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBar.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    func setupScrollView() {
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 5),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    func setupWeatherView() {
        NSLayoutConstraint.activate([
            weatherView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 18),
            weatherView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -18),
            weatherView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 8),
            weatherView.heightAnchor.constraint(equalToConstant: 376)
        ])
    }

    func setupWatchView() {
        NSLayoutConstraint.activate([
            watchView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 18),//1
            watchView.trailingAnchor.constraint(equalTo: cellularWidgetView.leadingAnchor, constant: -18),//3
            watchView.topAnchor.constraint(equalTo: weatherView.bottomAnchor, constant: 18),//2
//            watchView.bottomAnchor.constraint(equalTo: tableView.topAnchor, constant: -18),//7
//            watchView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),//7
            watchView.widthAnchor.constraint(equalTo: watchView.heightAnchor)
        ])
    }

    func setupCellWidgetView() {
        NSLayoutConstraint.activate([
            cellularWidgetView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -18),
            cellularWidgetView.topAnchor.constraint(equalTo: weatherView.bottomAnchor, constant: 18),
            cellularWidgetView.widthAnchor.constraint(equalTo: watchView.widthAnchor),
            cellularWidgetView.heightAnchor.constraint(equalTo: watchView.heightAnchor)
        ])
    }

    func setupTableView() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 18),
            tableView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -18),
            tableView.topAnchor.constraint(equalTo: watchView.bottomAnchor, constant: 18),
//            tableView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
            tableView.heightAnchor.constraint(equalToConstant: 340)
        ])
    }

}

extension UIView {
    func addSubviews(views: [UIView]) {
        for view in views {
            self.addSubview(view)
        }
    }
}
