//
//  NewVC.swift
//  autolayout
//
//  Created by AndUser on 29.11.2020.
//  Copyright © 2020 AndUser. All rights reserved.
//

import UIKit

class NewVC: UIViewController {

//    lazy var contentViewSize = CGSize(width: self.view.frame.width, height: self.view.frame.height + 400)

    private let activityView: ActivityView = {
        let view = ActivityView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .yellow
        return view
    }()

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(activityView)
        return scrollView
    }()

    
//    lazy var scrollView: UIScrollView = {
//        let view = UIScrollView(frame: .zero)
//        view.backgroundColor = .white
//        view.contentSize = contentViewSize
//        return view
//    }()
//
//    lazy var containerView: UIView = {
//        let view = UIView()
//        view.backgroundColor = .white
//        view.frame = view.bounds
//        view.frame.size = contentViewSize
//        return view
//    }()
//
//    lazy var label: UILabel = {
//        let label = UILabel()
//        label.text = "Center of a view"
//        return label
//    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .yellow
        view.tintColor = .black
        title = NSLocalizedString("Activity", comment: "")
        setupView()

    }

    private func setupView() {
        view.addSubview(scrollView)

        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo:view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo:view.bottomAnchor),

            scrollView.leadingAnchor.constraint(equalTo: activityView.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: activityView.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: activityView.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: activityView.bottomAnchor),
    
            scrollView.widthAnchor.constraint(equalTo: activityView.widthAnchor)
        ]) }
}
