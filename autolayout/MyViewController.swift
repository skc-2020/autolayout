//
// MyViewController.swift
// autolayout
//
// Created by AndUser on 14.11.2020.
// Copyright © 2020 AndUser. All rights reserved.
//

import UIKit
let itemsArray = [("ПЯТНИЦА, 13 НОЯБ.", ""), ("[Andersen] Daily Meeting", "15:30"), ("[Andersen] Аудит", "16:00"), ("ВОСКРЕСЕНЬЕ, 15 НОЯБ.", ""), ("Turkish Grand Prix", "12:10"), ("ПОНЕДЕЛЬНИК, 16 НОЯБ.", ""), ("SA_Platform features (mob)_we...", "10:30"), ("ещё 1 событие", "")]
class MyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let item = itemsArray[indexPath.row]
        cell.textLabel?.text = item.0
        cell.detailTextLabel?.text = item.1
        return cell
    }
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
    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    // - 3RD LAYER
    let weatherView: WeatherView = WeatherView()
    private lazy var watchView: UIView = {
        let watchView = UIView()
        watchView.translatesAutoresizingMaskIntoConstraints = false
        watchView.backgroundColor = .init(red: 0.510, green: 0.549, blue: 0.576, alpha: 1)
        return watchView
    }()
    private lazy var cellularWidgetView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .init(red: 0.263, green: 0.791, blue: 0.373, alpha: 1)
        return view
    }()
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    private lazy var currencyView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        view.addSubviews(views:
            searchBar,
                         scrollView
        )
        scrollView.addSubview(backgroundView)
        backgroundView.addSubviews(
            views:
            weatherView,
            watchView,
            cellularWidgetView,
            tableView,
            currencyView
        )
        weatherView.configure(with:
            .init(cornerRadius: 20,
                  backgroundColor: .init(red: 0.401, green: 0.465, blue: 0.541, alpha: 1)
            )
        )
        setupSearchView()
        setupScrollView()
        setupBackgroundView()
        setupWeatherView()
        setupRootView()
        setupWatchView()
        setupCellWidgetView()
        setupTableView()
        setupCurrencyView()
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
        let constraint = scrollView.heightAnchor.constraint(equalTo: backgroundView.heightAnchor)
        constraint.priority = .defaultLow

        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.widthAnchor.constraint(equalTo: backgroundView.widthAnchor),
            constraint
        ])
    }
    func setupBackgroundView() {
        NSLayoutConstraint.activate([
            backgroundView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            backgroundView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }
    func setupWeatherView() {
        NSLayoutConstraint.activate([
            weatherView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 18),
            weatherView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -18),
            weatherView.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 8),
            weatherView.heightAnchor.constraint(equalToConstant: 376)
        ])
    }
    func setupWatchView() {
        NSLayoutConstraint.activate([
            watchView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 18),
            watchView.trailingAnchor.constraint(equalTo: cellularWidgetView.leadingAnchor, constant: -18),
            watchView.topAnchor.constraint(equalTo: weatherView.bottomAnchor, constant: 18),
            watchView.widthAnchor.constraint(equalTo: watchView.heightAnchor)
        ])
    }
    func setupCellWidgetView() {
        NSLayoutConstraint.activate([
            cellularWidgetView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -18),
            cellularWidgetView.topAnchor.constraint(equalTo: weatherView.bottomAnchor, constant: 18),
            cellularWidgetView.widthAnchor.constraint(equalTo: watchView.widthAnchor),
            cellularWidgetView.heightAnchor.constraint(equalTo: watchView.heightAnchor)
        ])
    }
    func setupTableView() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 18),
            tableView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -18),
            tableView.topAnchor.constraint(equalTo: watchView.bottomAnchor, constant: 18),
            tableView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    func setupCurrencyView() {
        NSLayoutConstraint.activate([
            currencyView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 18),
            currencyView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -18),
            currencyView.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 18),
            currencyView.heightAnchor.constraint(equalToConstant: 200),
            currencyView.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor)
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
