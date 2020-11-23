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
//        print(searchBar.layer.contentsCenter.width)
//        print(searchBar.searchTextField.center.x)
        searchBar.setPositionAdjustment(.init(horizontal: 140, vertical: 0), for: .search)
        searchBar.layer.cornerRadius = 15
        searchBar.searchTextField.font = .systemFont(ofSize: 19)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private let weatherView: UIView = {
        let weatherView = UIView()
        weatherView.layer.cornerRadius = 20
        weatherView.translatesAutoresizingMaskIntoConstraints = false
        weatherView.backgroundColor = .black//.init(red: 0.401, green: 0.465, blue: 0.541, alpha: 1)
        return weatherView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(searchBar)
        view.addSubview(scrollView)
        scrollView.addSubview(weatherView)
        
        setupSearchView()
        setupScrollView()
        setupWeatherView()
//        setupRootView()
    }

    func setupRootView() {
        view.backgroundColor = .init(red: 0.094, green: 0.094, blue: 0.102, alpha: 1)
    }

    func setupSearchView() {
        NSLayoutConstraint.activate([
        searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
        searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18),
        searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        searchBar.heightAnchor.constraint(equalToConstant: 50)
        ])
//        searchLabel.topAnchor.constraint(equalTo: headerView.topAnchor).isActive = true
//        searchLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
//        searchLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor).isActive = true
//        searchLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor).isActive = true
//        searchLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor).isActive = true
    }

    func setupScrollView() {
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18).isActive = true
        scrollView.topAnchor.constraint(equalTo: searchBar.bottomAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

    func setupWeatherView() {
        weatherView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 18).isActive = true
        weatherView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 18).isActive = true
        weatherView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 8).isActive = true
        weatherView.heightAnchor.constraint(equalToConstant: 376).isActive = true
        weatherView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    }

}
